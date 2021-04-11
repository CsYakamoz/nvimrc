call plug#begin('~/.local/share/nvim/plugged')
    " colorschema {{{ "
        Plug 'sainnhe/gruvbox-material'
        Plug 'sainnhe/forest-night'
        Plug 'arzg/vim-colors-xcode'
        Plug 'ayu-theme/ayu-vim'
        Plug 'frankier/neovim-colors-solarized-truecolor-only'
        Plug 'hardcoreplayers/oceanic-material'
        Plug 'junegunn/seoul256.vim'
    " }}} colorschema "

    " appearance {{{ "
        Plug 'mhinz/vim-startify'
        Plug 'ryanoasis/vim-devicons'
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
        Plug 'Yggdroot/indentLine'
        " FIXME: remove this if statement when fixing a bug
        if ! has('mac')
            Plug 'lukas-reineke/indent-blankline.nvim'
        endif
        Plug 'jackguo380/vim-lsp-cxx-highlight', { 'for': ['cpp', 'c'] }
        Plug 'pangloss/vim-javascript'
        Plug 'leafgarland/typescript-vim'
        Plug 'PeterRincker/vim-searchlight'
        Plug 'elzr/vim-json'
        Plug 'kristijanhusak/defx-git'
        Plug 'kristijanhusak/defx-icons'
    " }}} appearance "

    " tool {{{ "
        if has('mac')
            Plug '/usr/local/opt/fzf'
        elseif executable('fzf')
            Plug 'junegunn/fzf'
        else
            Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
        endif
        Plug 'junegunn/fzf.vim'

        if has('mac')
            Plug 'rizzatti/dash.vim'
        else
            Plug 'KabbAmine/zeavim.vim'
        endif

        Plug 'machakann/vim-swap'
        Plug 'tpope/vim-repeat'
        Plug 'tpope/vim-surround'
        Plug 'tpope/vim-fugitive'
        Plug 'tpope/vim-rsi'
        Plug 'jiangmiao/auto-pairs'
        Plug 'airblade/vim-gitgutter'
        Plug 'liuchengxu/vista.vim', { 'on': 'Vista!!' }
        Plug 'scrooloose/nerdcommenter'
        Plug 'janko/vim-test', { 'on': ['TestFile', 'TestNearest'] }
        Plug 'skywind3000/vim-quickui'
        Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
        Plug 'dense-analysis/ale'
        Plug 'honza/vim-snippets'
        Plug 'neoclide/coc.nvim', {'branch': 'release'}
        Plug 'voldikss/vim-floaterm'
        Plug 'bootleq/vim-cycle'
        Plug 'psliwka/vim-smoothie'
        Plug 'editorconfig/editorconfig-vim'
        " Plug 'dhruvasagar/vim-zoom'
        Plug 'tommcdo/vim-exchange'
        Plug 'kristijanhusak/vim-carbon-now-sh', { 'on': 'CarbonNowSh' }
        Plug 'voldikss/vim-browser-search'
        Plug 'iamcco/markdown-preview.nvim', {  'do': 'cd app & yarn install', 'for': 'markdown'  }
        Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
        Plug 'terryma/vim-expand-region'
        Plug 'tmhedberg/simpylfold', { 'for': 'python' }
        Plug 'Konfekt/FastFold'
        Plug 'hotoo/pangu.vim', { 'on': 'Pangu' }
        Plug 'AndrewRadev/linediff.vim', { 'on': ['Linediff', 'LinediffReset'] }
        Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
        Plug 'antoinemadec/coc-fzf', {'branch': 'release'}
        Plug 'andymass/vim-matchup'
        Plug 'tpope/vim-projectionist'
        Plug 'kana/vim-textobj-user'
        Plug 'sgur/vim-textobj-parameter'
        Plug 'dstein64/vim-startuptime', { 'on': 'StartupTime' }
        Plug 'andymass/vim-tradewinds'
        Plug 'justinmk/vim-sneak'
        Plug 'michaeljsmith/vim-indent-object'
        Plug 'tpope/vim-abolish'
        Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
        Plug 'tamago324/LeaderF-filer'
        Plug 'dkarter/bullets.vim'
        Plug 'ron89/thesaurus_query.vim'
        Plug 'junegunn/vim-after-object'
    " }}} tool "

    " self {{{ "
        " Plug 'CsYakamoz/coc-qubao-tool-kit', { 'do': 'yarn install --frozen-lockfile' }
        " Plug 'CsYakamoz/fzf-mru.vim', { 'branch': 'preview-window' }
    " }}} self "
call plug#end()

" vim: set sw=4 ts=4 sts=4 et foldmarker={{{,}}} foldmethod=marker foldlevel=0:
