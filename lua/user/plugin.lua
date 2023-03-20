return {
	-- All the lua functions I don't want to write twice
	{ "nvim-lua/plenary.nvim", lazy = true },

	-- colorscheme
	{
		{
			"sainnhe/everforest",
			lazy = false,
			priority = 1000,
			config = function()
				require("plugin.color")
			end,
		},
		{
			"rebelot/kanagawa.nvim",
			lazy = false,
			priority = 1000,
			config = function()
				require("plugin.color")
			end,
		},
	},

	-- Delete buffers and close files in Vim without closing your windows or messing up your layout.
	{ "moll/vim-bbye", cmd = "Bdelete" },

	-- A vim plugin to perform diffs on blocks of code
	{
		"AndrewRadev/linediff.vim",
		cmd = { "Linediff", "LinediffAdd", "LinediffReset" },
	},

	-- A Vim plugin to copy text through SSH with OSC52
	{
		"ojroques/vim-oscyank",
		init = function()
			require("plugin.oscyank")
		end,
		cmd = "OSCYankReg",
	},

	-- Wrap and unwrap function arguments, lists, and dictionaries in Vim
	{ "FooSoft/vim-argwrap", cmd = "ArgWrap" },

	-- A Vim plugin for profiling Vim's startup time.
	{
		"dstein64/vim-startuptime",
		cmd = "StartupTime",
		config = function()
			vim.g.startuptime_tries = 10
		end,
	},

	-- Reorder delimited items.
	{ "machakann/vim-swap", keys = { "gs" } },

	-- A Git wrapper so awesome, it should be illegal
	{ "tpope/vim-fugitive", cmd = { "G", "Git", "Gwrite", "Gread" } },

	-- Run your tests at the speed of thought
	{
		"vim-test/vim-test",
		keys = { "<F5>", "<M-5>", "<F6>", "<M-6>" },
		cmd = { "TestFile", "TestNearest" },
		config = function()
			require("plugin.test")
		end,
	},

	-- asily search for, substitute, and abbreviate multiple variants of a word
	{
		"tpope/vim-abolish",
		keys = {
			"crs",
			"crm",
			"crc",
			"crs",
			"cru",
			"cr-",
			"cr.",
			"cr<space>",
			"crt",
		},
	},

	-- 『盘古之白』中文排版自动规范化的 Vim 插件
	{ "hotoo/pangu.vim", cmd = { "Pangu" } },

	-- Cycle text within predefined candidates.
	{
		"bootleq/vim-cycle",
		lazy = false,
		config = function()
			require("plugin.cycle")
		end,
	},

	-- Easy text exchange operator for Vim
	{
		"tommcdo/vim-exchange",
		keys = { { "<C-x>", mode = "x" } },
		config = function()
			require("plugin.exchange")
		end,
	},

	-- A simple, easy-to-use Vim alignment plugin.
	{
		"junegunn/vim-easy-align",
		keys = { { "ga", mode = "v" } },
		config = function()
			require("plugin.easy-align")
		end,
	},

	-- Vim plugin for intensely nerdy commenting powers
	{
		"preservim/nerdcommenter",
		keys = {
			"<leader>c<leader>",
			{ "<leader>c<leader>", mode = "x" },
			{ "<leader>cs", mode = "x" },
		},
		config = function()
			require("plugin.comment")
		end,
	},

	-- A vim 7.4+ plugin to generate table of contents for Markdown files.
	{
		"mzlogin/vim-markdown-toc",
		cmd = { "GenTocGFM", "GenTocGitLab", "GenTocMarked" },
		ft = { "markdown" },
		config = function()
			vim.g.vmt_list_item_char = "-"
		end,
	},

	-- Syntax highlighting, matching rules and mappings for the original Markdown and extensions.
	{
		"plasticboy/vim-markdown",
		ft = { "markdown" },
		config = function()
			vim.g.vim_markdown_toc_autofit = 1
		end,
	},

	-- This plugin adds 3 kind of horizontal highlights for text filetypes
	{
		"lukas-reineke/headlines.nvim",
		ft = { "markdown", "rmd", "vimwiki" },
		config = true,
	},

	-- a neovim plugin that change type character to other characters accroding rules and filter.
	{
		"glepnir/mutchar.nvim",
		ft = { "go", "php" },
		config = function()
			require("plugin.mutchar")
		end,
	},

	-- markdown preview plugin for (neo)vim
	-- TODO: lazy load markdown-preview with cmd instead ft, issues: https://github.com/wbthomason/packer.nvim/issues/620
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && yarn install",
		cond = vim.fn.executable("yarn") == 1,
		ft = { "markdown" },
	},

	-- Readline style insertion
	{ "tpope/vim-rsi", event = "VeryLazy" },

	-- enable repeating supported plugin maps with "."
	{ "tpope/vim-repeat", event = "VeryLazy" },

	-- Set of operators and textobjects to search/select/edit sandwiched texts.
	{
		"machakann/vim-sandwich",
		event = { "BufReadPost", "BufNewFile" },
	},

	-- match-up is a plugin that lets you highlight, navigate, and operate on sets of matching text.
	{
		"andymass/vim-matchup",
		event = { "BufReadPost", "BufNewFile" },
	},

	-- A more adventurous wildmenu
	{
		"gelguy/wilder.nvim",
		event = "VeryLazy",
		build = ":UpdateRemotePlugins",
		config = function()
			require("plugin.wilder")
		end,
	},

	-- lua `fork` of vim-web-devicons for neovim
	{ "nvim-tree/nvim-web-devicons", lazy = true },

	-- A file explorer tree for neovim written in lua
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
		keys = { "<F4>", "<M-4>" },
		config = function()
			require("plugin.file-explorer")
		end,
	},

	-- Indent guides for Neovim
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("plugin.indent-line")
		end,
	},

	-- a lua powered greeter like vim-startify / dashboard-nvim
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("plugin.alpha")
		end,
	},

	-- A blazing fast and easy to configure neovim statusline plugin written in pure lua.
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("plugin.statusline")
		end,
	},

	-- A minimal, configurable, neovim style tabline. Use your nvim tabs as workspace multiplexer.
	{
		"nanozuki/tabby.nvim",
		event = "VeryLazy",
		config = function()
			require("plugin.tabline")
		end,
	},

	-- A neovim lua plugin to help easily manage multiple terminal windows
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		cmd = { "CD", "ToggleTerm" },
		keys = { "<M-j>" },
		config = function()
			require("plugin.toggleterm")
		end,
	},

	-- Create key bindings that stick. WhichKey is a lua plugin for Neovim 0.5 that displays a popup with possible keybindings of the command you started typing.
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			require("plugin.which-key")
		end,
	},

	-- Smooth scrolling neovim plugin written in lua
	{
		"karb94/neoscroll.nvim",
		keys = {
			"<C-u>",
			"<C-d>",
			"<C-b>",
			"<C-f>",
			"<C-y>",
			"<C-e>",
			"zt",
			"zz",
			"zb",
		},
		config = function()
			require("plugin.neoscroll")
		end,
	},

	-- Better quickfix window in Neovim, polish old quickfix window.
	{ "kevinhwang91/nvim-bqf", event = "VeryLazy" },

	-- Hlsearch Lens for Neovim
	{
		"kevinhwang91/nvim-hlslens",
		keys = {
			"n",
			"N",
			"*",
			"#",
			"z/",
			{ "*", mode = "v" },
			{ "/", mode = "v" },
			{ "?", mode = "v" },
		},
		config = function()
			require("plugin.hlslens")
		end,
	},

	-- Git integration for buffers
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugin.gitsigns")
		end,
	},

	-- Single tabpage interface for easily cycling through diffs for all modified files for any git rev.
	{
		"sindrets/diffview.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		cmd = { "DiffviewOpen", "DiffviewFileHistory" },
	},

	-- Snippet engine and snippet template
	{ "honza/vim-snippets", event = "VeryLazy" },

	-- Vim plugin, insert or delete brackets, parens, quotes in pair
	{
		"jiangmiao/auto-pairs",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			vim.g.AutoPairsShortcutBackInsert = ""
		end,
	},

	-- A simple wrapper around :mksession.
	{
		"Shatur/neovim-session-manager",
		cmd = "SessionManager",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugin.session")
		end,
	},

	-- 🦘 Neovim's answer to the mouse
	{
		"ggandor/leap.nvim",
		event = "VeryLazy",
		config = function()
			require("plugin.leap")
		end,
	},

	-- Make your Vim/Neovim as smart as VSCode.
	{
		"neoclide/coc.nvim",
		branch = "release",
		evet = "VeryLazy",
		dependencies = { "tpope/vim-rsi" },
		config = function()
			require("plugin.coc")
		end,
	},

	-- Find, Filter, Preview, Pick. All lua, all the time.
	{
		"nvim-telescope/telescope.nvim",
		cmd = {
			"TelescopeProjectFile",
			"Telescope",
			"GrepVisualText",
			"FindVisualFile",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"fannheyward/telescope-coc.nvim",
			"nvim-telescope/telescope-fzf-native.nvim",
		},
		config = function()
			require("plugin.telescope")
		end,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		lazy = true,
		cond = vim.fn.executable("make") == 1,
		config = function()
			require("telescope").load_extension("fzf")
		end,
	},
	{
		"fannheyward/telescope-coc.nvim",
		lazy = true,
		dependencies = { "neoclide/coc.nvim" },
		config = function()
			require("telescope").load_extension("coc")
		end,
	},

	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		build = ":TSUpdate",
		config = function()
			require("plugin.treesitter")
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter-context",
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		lazy = true,
		opts = true,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		lazy = true,
	},

	-- ✅ Highlight, list and search todo comments in your projects
	{
		"folke/todo-comments.nvim",
		cmd = { "TodoQuickFix", "TodoLocList", "TodoTelescope" },
		event = "BufReadPre",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("plugin.todo-comment")
		end,
	},
}
