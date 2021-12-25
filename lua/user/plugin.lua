local fn = vim.fn

local packer_install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(packer_install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        packer_install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugin.lua source <afile> | PackerSync
    augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

return packer.startup(function(use)
    use "wbthomason/packer.nvim"

    use "lewis6991/impatient.nvim"
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"

    -- Colorscheme
    use { "sainnhe/everforest" }

    use "tpope/vim-rsi"
    use "tpope/vim-repeat"
    use { "moll/vim-bbye", cmd = 'Bdelete' }
    use { 'AndrewRadev/linediff.vim', cmd = 'Linediff'}
    use 'tomtom/tcomment_vim'
    use { 'junegunn/vim-easy-align', keys = { mode = 'v', map = 'ga' }}
    use 'machakann/vim-sandwich'
    use 'andymass/vim-matchup'
    use { 'ojroques/vim-oscyank', cmd = 'OSCYankReg' }
    use { 'FooSoft/vim-argwrap', cmd = 'ArgWrap' }
    use { 'mbbill/undotree', cmd = 'UndotreeToggle' }
    use { 'dstein64/vim-startuptime', cmd = 'StartupTime', config = [[vim.g.startuptime_tries = 10]] }

    use "kyazdani42/nvim-web-devicons"
    use "kyazdani42/nvim-tree.lua"
    use "lukas-reineke/indent-blankline.nvim"
    use "goolord/alpha-nvim"
    use "nvim-lualine/lualine.nvim"
    use "akinsho/bufferline.nvim"
    use "akinsho/toggleterm.nvim"
    use "folke/which-key.nvim"
    use 'karb94/neoscroll.nvim'
    use 'kevinhwang91/nvim-bqf'
    use { "danymat/neogen", requires = "nvim-treesitter/nvim-treesitter" }
    use { 'lukas-reineke/headlines.nvim', ft = { 'markdown', 'rmd', 'vimwiki' }}
    use "windwp/nvim-autopairs"
    use { 'gelguy/wilder.nvim', run = ":UpdateRemotePlugins"}
    use "p00f/nvim-ts-rainbow"
    use 'kevinhwang91/nvim-hlslens'

    use "nvim-telescope/telescope.nvim"
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

    -- Git
    use "lewis6991/gitsigns.nvim"
    use {
        "tpope/vim-fugitive",
        cmd = { 'Git', 'Gstatus', 'Gblame', 'Gpush', 'Gpull', 'Gwrite', 'Gread' },
        disable = true
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)