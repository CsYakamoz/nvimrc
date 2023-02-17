local telescope = require("telescope")

local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")
local action_state = require("telescope.actions.state")
local previewers = require("telescope.previewers")

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

telescope.setup({
	-- Refer: https://github.com/nvim-telescope/telescope.nvim/issues/938#issuecomment-877539724
	defaults = require("telescope.themes").get_ivy({
		prompt_prefix = " ",
		selection_caret = " ",
		path_display = { "smart" },

		mappings = {
			i = {
				["<esc>"] = actions.close,
				["<C-n>"] = actions.cycle_history_next,
				["<C-p>"] = actions.cycle_history_prev,

				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,

				["<CR>"] = open_on_tab(actions.select_default),
				["<C-s>"] = open_on_tab(actions.select_horizontal),
				["<C-v>"] = open_on_tab(actions.select_vertical),
				["<C-t>"] = open_on_tab(actions.select_tab),

				["<C-g>"] = actions.toggle_all,
				["<C-a>"] = actions.select_all,

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
	}),
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

vim.api.nvim_create_user_command("TelescopeProjectFile", function()
	vim.fn.system("git rev-parse --is-inside-work-tree")
	if vim.v.shell_error == 0 then
		vim.cmd([[execute 'Telescope git_files']])
	else
		vim.cmd([[execute 'Telescope find_files']])
	end
end, {})
