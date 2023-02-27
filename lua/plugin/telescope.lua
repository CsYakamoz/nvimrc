local telescope = require("telescope")
local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")
local action_state = require("telescope.actions.state")
local previewers = require("telescope.previewers")
local builtin = require("telescope.builtin")

local utils = require("utils")

-- Refer: https://github.com/nvim-telescope/telescope.nvim/issues/1048
local function open_on_tab(action)
	return function(prompt_bufnr)
		local entry = action_state.get_selected_entry()
		if not entry then
			return
		end

		local picker = action_state.get_current_picker(prompt_bufnr)
		local num_selections = #picker:get_multi_selection()
		local copen = true

		if not num_selections or num_selections <= 1 then
			actions.add_selection(prompt_bufnr)
			copen = false
		end

		if copen then
			actions.send_selected_to_qflist(prompt_bufnr)
			vim.cmd("tabnew")
			vim.cmd("copen")
			vim.cmd("cc")
		else
			action(prompt_bufnr)
		end
	end
end

-- Refer: https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#ignore-files-bigger-than-a-threshold
local buffer_previewer_maker = function(filepath, bufnr, opts)
	opts = opts or {}

	filepath = vim.fn.expand(filepath)
	vim.loop.fs_stat(filepath, function(_, stat)
		if not stat then
			return
		end
		if stat.size > 100000 then
			return
		else
			previewers.buffer_previewer_maker(filepath, bufnr, opts)
		end
	end)
end

local opts = {
	prompt_prefix = " ",
	selection_caret = " ",
	path_display = { "smart" },

	-- see https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/mappings.lua#L133
	mappings = {
		i = {
			["<esc>"] = actions.close,
			["<C-j>"] = actions.cycle_history_next,
			["<C-k>"] = actions.cycle_history_prev,

			["<CR>"] = open_on_tab(actions.select_default),
			["<C-s>"] = open_on_tab(actions.select_horizontal),
			["<C-v>"] = open_on_tab(actions.select_vertical),
			["<C-t>"] = open_on_tab(actions.select_tab),

			["<C-g>"] = actions.toggle_all,

			["<M-p>"] = action_layout.toggle_preview,
		},

		n = {
			["<CR>"] = open_on_tab(actions.select_default),
			["<C-s>"] = open_on_tab(actions.select_horizontal),
			["<C-v>"] = open_on_tab(actions.select_vertical),
			["<C-t>"] = open_on_tab(actions.select_tab),
		},
	},

	-- https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#ripgrep-remove-indentation
	vimgrep_arguments = {
		"rg",
		"--color=never",
		"--no-heading",
		"--with-filename",
		"--line-number",
		"--column",
		"--smart-case",
		"--trim",
	},

	buffer_previewer_maker = buffer_previewer_maker,
}

telescope.setup({
	-- Refer: https://github.com/nvim-telescope/telescope.nvim/issues/938#issuecomment-877539724
	defaults = require("telescope.themes").get_ivy(opts),
	pickers = {
		current_buffer_fuzzy_find = { previewer = false },
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
	},
})

vim.api.nvim_create_user_command("TelescopeProjectFile", function(param)
	local opt = {}
	if param.args ~= "" then
		opt.default_text = param.args
	end

	if utils.git.isInGit() then
		builtin.git_files(opt)
	else
		builtin.find_files(opt)
	end
end, { nargs = "?" })

vim.api.nvim_create_user_command("GrepVisualText", function()
	local text = utils.getVisualText()
	if string.match(text, "\n") ~= nil then
		vim.notify("do not support newline", "error", { title = "Telescope" })
		return
	end
	local opt = { default_text = text }
	builtin.live_grep(opt)
end, {})

vim.api.nvim_create_user_command("FindVisualFile", function()
	local text = utils.getVisualText()
	if string.match(text, "\n") ~= nil then
		vim.notify("do not support newline", "error", { title = "Telescope" })
		return
	end

	local opt = { default_text = text }
	if utils.git.isInGit() then
		builtin.git_files(opt)
	else
		builtin.find_files(opt)
	end
end, {})
