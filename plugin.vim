call plug#begin('~/.local/share/nvim/plugged')
    " display, always pursue beautiful thing :)
    Plug 'morhetz/gruvbox'
    Plug 'sainnhe/vim-color-forest-night'
    Plug 'soft-aesthetic/soft-era-vim'

    Plug 'mhinz/vim-startify'
    Plug 'ryanoasis/vim-devicons'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'nathanaelkane/vim-indent-guides'

    " easy-tool, lazy guys may need it -.-
    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf.vim'

    Plug 'terryma/vim-expand-region'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-fugitive'
    Plug 'honza/vim-snippets'
    Plug 'sheerun/vim-polyglot'
    Plug 'jiangmiao/auto-pairs'
    Plug 'tmhedberg/simpylfold'
    Plug 'airblade/vim-gitgutter'

    Plug 'liuchengxu/vista.vim'
    Plug 'scrooloose/nerdtree'
    Plug 'scrooloose/nerdcommenter'
    Plug 'Xuyuanp/nerdtree-git-plugin'

    " complete
    Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
call plug#end()

