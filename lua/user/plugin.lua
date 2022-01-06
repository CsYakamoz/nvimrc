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
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	-- basic
	use("wbthomason/packer.nvim")
	use("lewis6991/impatient.nvim")
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")

	-- Colorscheme
	use({ "sainnhe/everforest" })

	-- lazy load
	use({ "moll/vim-bbye", cmd = "Bdelete" })
	use({ "AndrewRadev/linediff.vim", cmd = "Linediff" })
	use({ "ojroques/vim-oscyank", cmd = "OSCYankReg" })
	use({ "FooSoft/vim-argwrap", cmd = "ArgWrap" })
	use({ "mbbill/undotree", cmd = "UndotreeToggle" })
	use({ "dstein64/vim-startuptime", cmd = "StartupTime", config = [[vim.g.startuptime_tries = 10]] })
	use({ "machakann/vim-swap", keys = { "gs" } })
	use({
		"kkoomen/vim-doge",
		run = ":call doge#install()",
		cmd = "DogeGenerate",
		config = [[vim.g.doge_enable_mappings = 0]],
	})
	use({
		"lukas-reineke/headlines.nvim",
		ft = { "markdown", "rmd", "vimwiki" },
		config = function()
			require("headlines").setup()
		end,
	})
	use({ "tpope/vim-fugitive", cmd = { "G", "Git", "Gwrite", "Gread" } })
	-- TODO: lazy load markdown-preview with cmd instead ft, issues: https://github.com/wbthomason/packer.nvim/issues/620
	use({ "iamcco/markdown-preview.nvim", run = "cd app && yarn install", ft = { "markdown" } })
	use({ "vim-test/vim-test", cmd = { "TestFile", "TestNearest" }, config = [[require("user.test")]] })

	use("tpope/vim-rsi")
	use("tpope/vim-repeat")
	use({ "preservim/nerdcommenter", config = [[require('user.comment')]] })
	use("junegunn/vim-easy-align")
	use("machakann/vim-sandwich")
	use("andymass/vim-matchup")
	use("tommcdo/vim-exchange")
	use({ "jiangmiao/auto-pairs", config = [[vim.g.AutoPairsShortcutBackInsert = '']] })
	use({ "gelguy/wilder.nvim", run = ":UpdateRemotePlugins", config = [[require("user.wilder")]] })

	use("kyazdani42/nvim-web-devicons")
	use("kyazdani42/nvim-tree.lua")
	use("lukas-reineke/indent-blankline.nvim")
	use("goolord/alpha-nvim")
	use("nvim-lualine/lualine.nvim")
	use("akinsho/bufferline.nvim")
	use("akinsho/toggleterm.nvim")
	use("folke/which-key.nvim")
	use("karb94/neoscroll.nvim")
	use("kevinhwang91/nvim-bqf")
	use("p00f/nvim-ts-rainbow")
	use("kevinhwang91/nvim-hlslens")
	use("lewis6991/gitsigns.nvim")

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")

	-- snippets
	use("L3MON4D3/LuaSnip")
	-- use("rafamadriz/friendly-snippets")
	use("honza/vim-snippets")

	-- lsp
	use("neovim/nvim-lspconfig")
	use("williamboman/nvim-lsp-installer")
	use("jose-elias-alvarez/null-ls.nvim")
	use("ray-x/lsp_signature.nvim")

	use("nvim-telescope/telescope.nvim")

	-- treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/nvim-treesitter-textobjects")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
