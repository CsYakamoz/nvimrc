local telescope = require("telescope")

local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")
local action_state = require("telescope.actions.state")

local function multi_selection_open_tab(way)
	return function(prompt_bufnr)
		local picker = action_state.get_current_picker(prompt_bufnr)
		local num_selections = #picker:get_multi_selection()
		if not num_selections or num_selections <= 1 then
			actions.add_selection(prompt_bufnr)
		end

		if way == "selected" then
			actions.send_selected_to_qflist(prompt_bufnr)
		elseif way == "all" then
			actions.send_to_qflist(prompt_bufnr)
		else
			print("unexpected way" .. way)
		end

		vim.cmd("tabnew")
		vim.cmd("copen")
		vim.cmd("cc")
	end
end

telescope.setup({
	defaults = {
		prompt_prefix = " ",
		selection_caret = " ",
		path_display = { "smart" },

		mappings = {
			i = {
				["<esc>"] = actions.close,
				["<C-w>"] = function()
					vim.api.nvim_input("<c-s-w>")
				end,
				["<C-n>"] = actions.cycle_history_next,
				["<C-p>"] = actions.cycle_history_prev,

				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,

				["<C-c>"] = actions.close,

				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,

				["<CR>"] = actions.select_default,
				["<C-s>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				["<PageUp>"] = actions.results_scrolling_up,
				["<PageDown>"] = actions.results_scrolling_down,

				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				-- ["<M-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = multi_selection_open_tab("all"),
				-- ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<C-q>"] = multi_selection_open_tab("selected"),
				["<C-_>"] = actions.which_key,
				["<M-p>"] = action_layout.toggle_preview,
			},

			n = {
				["<esc>"] = actions.close,
				["<CR>"] = actions.select_default,
				["<C-s>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,

				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				-- ["<M-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = multi_selection_open_tab("all"),
				-- ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<C-q>"] = multi_selection_open_tab("selected"),

				["j"] = actions.move_selection_next,
				["k"] = actions.move_selection_previous,
				["H"] = actions.move_to_top,
				["M"] = actions.move_to_middle,
				["L"] = actions.move_to_bottom,

				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,
				["gg"] = actions.move_to_top,
				["G"] = actions.move_to_bottom,

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				["<PageUp>"] = actions.results_scrolling_up,
				["<PageDown>"] = actions.results_scrolling_down,

				["?"] = actions.which_key,
			},
		},
	},
	pickers = {
		find_files = { theme = "ivy" },
		git_files = { theme = "ivy" },
		live_grep = { theme = "ivy" },
		buffers = { theme = "ivy" },
		oldfiles = { theme = "ivy" },
		keymaps = { theme = "ivy" },
		diagnostics = { theme = "ivy" },
		git_status = { theme = "ivy" },
		commands = { theme = "ivy" },
		file_browser = { theme = "ivy" },
		help_tags = { theme = "ivy" },
		man_pages = { theme = "ivy" },
		registers = { theme = "ivy" },
		jumplist = { theme = "ivy" },
		current_buffer_fuzzy_find = { theme = "ivy" },

		-- lsp
		lsp_references = { theme = "ivy" },
		lsp_definitions = { theme = "ivy" },
		lsp_document_symbols = { theme = "ivy" },
		lsp_workspace_symbols = { theme = "ivy" },
		lsp_implementations = { theme = "ivy" },
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
