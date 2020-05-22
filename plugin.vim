call plug#begin('~/.local/share/nvim/plugged')
    Plug 'sainnhe/gruvbox-material'
    Plug 'sainnhe/forest-night'
    Plug 'arzg/vim-colors-xcode'
    Plug 'ayu-theme/ayu-vim'
    Plug 'drewtempelmeyer/palenight.vim'
    Plug 'arcticicestudio/nord-vim'
    Plug 'dracula/vim', { 'as': 'dracula' }

    Plug 'mhinz/vim-startify'
    Plug 'ryanoasis/vim-devicons'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'iamcco/markdown-preview.nvim', {  'do': 'cd app & yarn install', 'for': 'markdown'  }

    if has('mac')
        Plug '/usr/local/opt/fzf'
    elseif executable('fzf')
        Plug 'junegunn/fzf'
    else
        Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    endif
    Plug 'junegunn/fzf.vim'

    if has('mac')
        Plug 'rizzatti/dash.vim', { 'on': 'Dash' }
    else
        Plug 'KabbAmine/zeavim.vim', { 'on': 'Zeavim' }
    endif
    Plug 'machakann/vim-swap'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rsi'
    Plug 'tpope/vim-sleuth'
    Plug 'PeterRincker/vim-searchlight'
    Plug 'pangloss/vim-javascript'
    Plug 'leafgarland/typescript-vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'tmhedberg/simpylfold'
    Plug 'airblade/vim-gitgutter'
    Plug 'liuchengxu/vista.vim'
    Plug 'scrooloose/nerdtree'
    Plug 'scrooloose/nerdcommenter'
    Plug 'Xuyuanp/nerdtree-git-plugin'
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

    Plug 'CsYakamoz/coc-qubao-tool-kit', { 'do': 'yarn install --frozen-lockfile' }
call plug#end()

