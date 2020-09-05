call plug#begin('~/.local/share/nvim/plugged')
    " colorschema {{{ "
        Plug 'sainnhe/gruvbox-material'
        Plug 'sainnhe/forest-night'
        Plug 'arzg/vim-colors-xcode'
        Plug 'ayu-theme/ayu-vim'
        Plug 'drewtempelmeyer/palenight.vim'
        Plug 'dracula/vim', { 'as': 'dracula' }
        Plug 'tyrannicaltoucan/vim-quantum'
        Plug 'frankier/neovim-colors-solarized-truecolor-only'
        Plug 'joshdick/onedark.vim'
        Plug 'hardcoreplayers/oceanic-material'
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
        Plug 'jackguo380/vim-lsp-cxx-highlight'
        Plug 'pangloss/vim-javascript'
        Plug 'leafgarland/typescript-vim'
        Plug 'PeterRincker/vim-searchlight'
        Plug 'elzr/vim-json'
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
        Plug 'tpope/vim-sleuth'
        Plug 'jiangmiao/auto-pairs'
        Plug 'airblade/vim-gitgutter'
        Plug 'liuchengxu/vista.vim'
        Plug 'scrooloose/nerdtree'
        Plug 'scrooloose/nerdcommenter'
        Plug 'janko/vim-test'
        Plug 'junegunn/vim-peekaboo'
        Plug 'skywind3000/vim-quickui'
        Plug 'kkoomen/vim-doge'
        Plug 'dense-analysis/ale'
        Plug 'honza/vim-snippets'
        Plug 'neoclide/coc.nvim', {'branch': 'release'}
        Plug 'voldikss/vim-floaterm'
        Plug 'bootleq/vim-cycle'
        Plug 'psliwka/vim-smoothie'
        Plug 'editorconfig/editorconfig-vim'
        Plug 'dhruvasagar/vim-zoom'
        Plug 'tommcdo/vim-exchange'
        Plug 'mzlogin/vim-markdown-toc'
        Plug 'kristijanhusak/vim-carbon-now-sh'
        Plug 'voldikss/vim-browser-search'
        Plug 'iamcco/markdown-preview.nvim', {  'do': 'cd app & yarn install', 'for': 'markdown'  }
        Plug 'junegunn/goyo.vim'
        Plug 'terryma/vim-expand-region'
        Plug 'tmhedberg/simpylfold'
        Plug 'Konfekt/FastFold'
        Plug 'hotoo/pangu.vim'
    " }}} tool "

    " self {{{ "
        Plug 'CsYakamoz/coc-qubao-tool-kit', { 'do': 'yarn install --frozen-lockfile' }
    " }}} self "
call plug#end()

