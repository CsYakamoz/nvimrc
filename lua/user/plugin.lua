local fn = vim.fn

local packer_install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(packer_install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		packer_install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugin.lua source <afile> | PackerSync
    augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({ display = { open_cmd = "tabedit" } })

return packer.startup(function(use)
	-- Improve startup time for Neovim, impatient needs to be setup before any other lua plugin is loaded
	use({
		"lewis6991/impatient.nvim",
		config = function()
			require("impatient").enable_profile()
		end,
	})

	-- Packer can manage itself
	use({ "wbthomason/packer.nvim" })

	-- All the lua functions I don't want to write twice
	use("nvim-lua/plenary.nvim")

	-- An implementation of the Popup API from vim in Neovim
	use({ "nvim-lua/popup.nvim", requires = "nvim-lua/plenary.nvim" })

	-- colorscheme
	use({ "sainnhe/everforest" })

	-- Delete buffers and close files in Vim without closing your windows or messing up your layout.
	use({ "moll/vim-bbye", cmd = "Bdelete" })

	-- A vim plugin to perform diffs on blocks of code
	use({ "AndrewRadev/linediff.vim", cmd = "Linediff" })

	-- A Vim plugin to copy text through SSH with OSC52
	use({
		"ojroques/vim-oscyank",
		setup = [[require('plugin.oscyank')]],
		cmd = "OSCYankReg",
	})

	-- Wrap and unwrap function arguments, lists, and dictionaries in Vim
	use({ "FooSoft/vim-argwrap", cmd = "ArgWrap" })

	-- The undo history visualizer for VIM
	use({ "mbbill/undotree", cmd = "UndotreeToggle" })

	-- A Vim plugin for profiling Vim's startup time.
	use({ "dstein64/vim-startuptime", cmd = "StartupTime", config = [[vim.g.startuptime_tries = 10]] })

	-- Reorder delimited items.
	use({ "machakann/vim-swap", keys = { "gs" } })

	-- A Git wrapper so awesome, it should be illegal
	use({ "tpope/vim-fugitive", cmd = { "G", "Git", "Gwrite", "Gread" } })

	-- Run your tests at the speed of thought
	use({
		"vim-test/vim-test",
		keys = { "<F5>", "<M-5>", "<F6>", "<M-6>" },
		cmd = { "TestFile", "TestNearest" },
		config = [[require("plugin.test")]],
	})

	-- asily search for, substitute, and abbreviate multiple variants of a word
	use({ "tpope/vim-abolish", keys = { "crs", "crm", "crc", "crs", "cru", "cr-", "cr.", "cr<space>", "crt" } })

	-- 『盘古之白』中文排版自动规范化的 Vim 插件
	use({ "hotoo/pangu.vim", cmd = { "Pangu" } })

	-- Cycle text within predefined candidates.
	use({ "bootleq/vim-cycle", keys = { "<C-a>", "<C-v>" }, config = [[require("plugin.cycle")]] })

	-- Easy text exchange operator for Vim
	use({ "tommcdo/vim-exchange", keys = { { "x", "<C-x>" } }, config = [[require("plugin.exchange")]] })

	-- A simple, easy-to-use Vim alignment plugin.
	use({ "junegunn/vim-easy-align", keys = { { "v", "ga" } }, config = [[require("plugin.easy-align")]] })

	-- Vim plugin for intensely nerdy commenting powers
	use({
		"preservim/nerdcommenter",
		keys = { { "n", "<leader>c<leader>" }, { "x", "<leader>c<leader>" }, { "x", "<leader>cs" } },
		config = [[require('plugin.comment')]],
	})

	-- A vim 7.4+ plugin to generate table of contents for Markdown files.
	use({
		"mzlogin/vim-markdown-toc",
		cmd = { "GenTocGFM", "GenTocGitLab", "GenTocMarked" },
		ft = { "markdown" },
		config = function()
			vim.cmd([[let g:vmt_list_item_char="-"]])
		end,
	})

	-- Syntax highlighting, matching rules and mappings for the original Markdown and extensions.
	use({ "plasticboy/vim-markdown", ft = { "markdown" } })

	-- This plugin adds 3 kind of horizontal highlights for text filetypes
	use({
		"lukas-reineke/headlines.nvim",
		ft = { "markdown", "rmd", "vimwiki" },
		config = function()
			require("headlines").setup()
		end,
	})

	-- neovim macgic char
	use({
		"glepnir/mcc.nvim",
		config = [[require('plugin.mcc')]],
	})

	-- markdown preview plugin for (neo)vim
	-- TODO: lazy load markdown-preview with cmd instead ft, issues: https://github.com/wbthomason/packer.nvim/issues/620
	use({ "iamcco/markdown-preview.nvim", run = "cd app && yarn install", ft = { "markdown" } })

	-- Readline style insertion
	use({ "tpope/vim-rsi", event = "VimEnter" })

	-- enable repeating supported plugin maps with "."
	use({ "tpope/vim-repeat", event = "VimEnter" })

	-- Set of operators and textobjects to search/select/edit sandwiched texts.
	use({ "machakann/vim-sandwich", event = "VimEnter" })

	-- match-up is a plugin that lets you highlight, navigate, and operate on sets of matching text.
	use({ "andymass/vim-matchup", event = "VimEnter" })

	-- A more adventurous wildmenu
	use({ "gelguy/wilder.nvim", run = ":UpdateRemotePlugins", config = [[require("plugin.wilder")]] })

	-- lua `fork` of vim-web-devicons for neovim
	use({ "kyazdani42/nvim-web-devicons", event = "VimEnter" })

	-- A file explorer tree for neovim written in lua
	use({
		"kyazdani42/nvim-tree.lua",
		after = "nvim-web-devicons",
		config = [[require('plugin.file-explorer')]],
		requires = { "kyazdani42/nvim-web-devicons" },
	})

	-- Indent guides for Neovim
	use({ "lukas-reineke/indent-blankline.nvim", event = "VimEnter", config = [[require('plugin.indent_line')]] })

	-- a lua powered greeter like vim-startify / dashboard-nvim
	use({
		"goolord/alpha-nvim",
		after = "nvim-web-devicons",
		config = [[require('plugin.alpha')]],
		requires = { "kyazdani42/nvim-web-devicons" },
	})

	-- A blazing fast and easy to configure neovim statusline plugin written in pure lua.
	use({
		"nvim-lualine/lualine.nvim",
		after = "nvim-web-devicons",
		config = [[require('plugin.statusline')]],
		requires = { "kyazdani42/nvim-web-devicons" },
	})

	-- A minimal, configurable, neovim style tabline. Use your nvim tabs as workspace multiplexer.
	use({ "nanozuki/tabby.nvim", config = [[require('plugin.tabline')]] })

	-- A neovim lua plugin to help easily manage multiple terminal windows
	use({
		"akinsho/toggleterm.nvim",
		cmd = { "CD", "ToggleTerm" },
		keys = { "<M-j>" },
		config = [[require('plugin.toggleterm')]],
	})

	-- Create key bindings that stick. WhichKey is a lua plugin for Neovim 0.5 that displays a popup with possible keybindings of the command you started typing.
	use({ "folke/which-key.nvim", event = "VimEnter", config = [[require('plugin.which_key')]] })

	-- Smooth scrolling neovim plugin written in lua
	use({
		"karb94/neoscroll.nvim",
		keys = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
		config = [[require('plugin.neoscroll')]],
	})

	-- Better quickfix window in Neovim, polish old quickfix window.
	use({ "kevinhwang91/nvim-bqf", event = "FileType qf" })

	-- Hlsearch Lens for Neovim
	use({
		"kevinhwang91/nvim-hlslens",
		keys = {
			{ "n", "n" },
			{ "n", "N" },
			{ "n", "*" },
			{ "n", "#" },
			{ "v", "*" },
			"z/",
			{ "v", "/" },
			{ "v", "?" },
		},
		config = [[require('plugin.hlslens')]],
	})

	-- Git integration for buffers
	use({
		"lewis6991/gitsigns.nvim",
		event = "BufEnter",
		config = [[require('plugin.gitsigns')]],
		requires = "nvim-lua/plenary.nvim",
	})

	-- Single tabpage interface for easily cycling through diffs for all modified files for any git rev.
	use({
		"sindrets/diffview.nvim",
		requires = "nvim-lua/plenary.nvim",
		cmd = { "DiffviewOpen", "DiffviewFileHistory" },
	})

	-- Incremental fuzzy search motion plugin for Neovim
	use({
		"rlane/pounce.nvim",
		keys = { { "n", "s" }, { "v", "s" } },
		config = function()
			vim.cmd([[
			nmap s <cmd>Pounce<CR>
			vmap s <cmd>Pounce<CR>
		]])
		end,
	})

	-- Snippet engine and snippet template
	use({ "honza/vim-snippets", event = "VimEnter" })

	-- Vim plugin, insert or delete brackets, parens, quotes in pair
	use({ "jiangmiao/auto-pairs", event = "VimEnter", config = [[vim.g.AutoPairsShortcutBackInsert = '']] })

	-- Find, Filter, Preview, Pick. All lua, all the time.
	use({
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		config = [[require("plugin.telescope")]],
	})
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
		after = "telescope.nvim",
		requires = "nvim-telescope/telescope.nvim",
		config = [[require('telescope').load_extension("fzf")]],
	})
	use({
		"fannheyward/telescope-coc.nvim",
		after = { "telescope.nvim", "coc.nvim" },
		requires = { "nvim-telescope/telescope.nvim", "neoclide/coc.nvim" },
		config = [[require('telescope').load_extension("coc")]],
	})

	-- treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		event = "BufEnter",
		run = ":TSUpdate",
		config = [[require("plugin.treesitter")]],
	})
	use({
		"nvim-treesitter/nvim-treesitter-context",
		requires = "nvim-treesitter/nvim-treesitter",
	})
	use({
		"m-demare/hlargs.nvim",
		after = "nvim-treesitter",
		requires = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("hlargs").setup()
		end,
	})

	-- Debug Adapter Protocol client implementation for Neovim
	use({
		"mfussenegger/nvim-dap",
		event = "VimEnter",
	})
	use({
		"leoluz/nvim-dap-go",
		requires = { "mfussenegger/nvim-dap" },
		ft = { "go" },
		config = [[require('dap-go').setup()]],
	})
	use({
		"rcarriga/nvim-dap-ui",
		requires = { "mfussenegger/nvim-dap" },
	})

	-- Nvim cheat sheet implementation
	use({
		"Djancyp/cheat-sheet",
		cmd = "CheatSH",
		config = [[require("plugin.cheat-sh")]],
	})

	-- Make your Vim/Neovim as smart as VSCode.
	use({ "neoclide/coc.nvim", branch = "release", config = [[require("plugin.coc")]] })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
