local which_key = require("which-key")

local normal = {
	opts = {
		mode = "n", -- NORMAL mode
		prefix = "<leader>",
	},
	mappings = {
		["a"] = { "<cmd>Alpha<cr>", "Alpha" },
		["x"] = { "<cmd>Bdelete<CR>", "Delete Buffer" },
		["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
		["S"] = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		["M"] = { "<cmd>message<cr>", "See Message" },

		u = {
			name = "Utool",
			a = { "<cmd>ArgWrap<cr>", "ArgWrap" },
			e = { "<Plug>(ExchangeClear)", "ExchangeClear" },
			s = {
				name = "Session-Manager",
				d = { "<cmd>SessionManager delete_session<cr>", "Delete Session" },
				l = {
					"<cmd>SessionManager load_current_dir_session<cr>",
					"Load Current Dir Session",
				},
				L = { "<cmd>SessionManager load_session<cr>", "Load Session" },
				s = { "<cmd>SessionManager save_current_session<cr>", "Save Session" },
			},
		},

		m = {
			name = "Makrdown",
			p = { "<cmd>MarkdownPreview<cr>", "Preview" },
			s = { "<cmd>MarkdownPreviewStop<cr>", "Stop" },
			f = { "<cmd>Pangu<cr>", "Pangu" },
		},

		g = {
			name = "Git",
			b = { "<cmd>G blame<cr>", "Blame" },
			c = { "<cmd>Git commit<cr>", "Gcommit" },
			s = { "<cmd>tab Git<cr>", "Gstatus" },
		},

		l = {
			name = "LSP",
			a = {
				"<cmd>Telescope coc line_code_actions<cr>",
				"Line Code Action",
			},
			A = {
				"<cmd>Telescope coc file_code_actions<cr>",
				"File Code Action",
			},
			d = {
				"<cmd>Telescope coc diagnostics<cr>",
				"Document Diagnostics",
			},
			D = {
				"<cmd>Telescope coc workspace_diagnostics<cr>",
				"Workspace Diagnostics",
			},
			s = {
				"<cmd>Telescope coc document_symbols<cr>",
				"Document Symbols",
			},
			S = {
				"<cmd>Telescope coc workspace_symbols<cr>",
				"Workspace Symbols",
			},
		},

		s = {
			name = "Search",
			b = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Buffers" },
			c = { "<cmd>Telescope commands<cr>", "Commands" },
			f = { "<cmd>TelescopeProjectFile<CR>", "Find (Git) files" },
			F = {
				":Telescope find_files default_text=<C-r><C-w><CR>",
				"Find Current-Word files",
			},
			g = { "<cmd>Telescope live_grep<cr>", "Grep Text" },
			G = {
				":Telescope live_grep default_text=<C-r><C-w><CR>",
				"Grep Current-Word Text",
			},
			h = { "<cmd>Telescope command_history<cr>", "Command History" },
			H = { "<cmd>Telescope help_tags<cr>", "Find Help" },
			j = { "<cmd>Telescope jumplist<cr>", "Jump List" },
			k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
			m = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
			r = { "<cmd>Telescope oldfiles only_cwd=true<cr>", "Open Recent File" },
			R = { "<cmd>Telescope registers<cr>", "Registers" },
			w = { "<cmd>Telescope grep_string<cr>", "Grep Word String" },
		},

		t = {
			name = "Terminal",
			f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
			h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
			v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
		},
	},
}

local visual = {
	opts = {
		mode = "v",
		prefix = "<leader>",
	},
	mappings = {
		u = {
			name = "Utool",
			l = { ":Linediff<cr>", "Line Diff" },
		},
	},
}

which_key.setup({
	window = {
		border = "rounded", -- none, single, double, shadow
	},
	ignore_missing = true,
})
for _, config in pairs({ normal, visual }) do
	which_key.register(config.mappings, config.opts)
end
