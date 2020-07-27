" common {{{ "
    set termguicolors                   " use true color
    set nowrap                          " don't wrap line    
    set hidden                          " allow jump other buffer without saving
    set signcolumn=yes                  " always show signcolumns
    set number                          " show line number
    set relativenumber                  " show relative number
    set cursorline                      " highlight current line
    set cursorcolumn                    " highlight current column
    set ignorecase                      " ignore case when searching
    set expandtab                       " use spaces instead of tabs
    set softtabstop=4                   " tab key indents by 4 spaces
    set shiftwidth=4                    " >> indents by 4 spaces
    set shiftround                      " >> indents to next multiple of shiftwidth
    set foldmethod=indent               " the kind of folding used for the current window.
    set foldlevelstart=10               " not yet understood
    set updatetime=300                  " you will have bad experience for diagnostic messages when it's default 4000.
    set shortmess+=c                    " Don't pass messages to |ins-completion-menu|
    set splitright                      " splitting a window will put the new window right of the current
    set splitbelow                      " splitting a window will put the new window below of the current
    language en_US.UTF-8                " um... i just want to learn english
    set synmaxcol=300                   " Only highlight the first 300 columns.
    set lazyredraw
    set pumheight=15                    " Maximum number of items to show in the popup menu
    set undofile
    set undodir=~/.vim_undodir
    set fileformats=unix,dos
" }}} common "

" only activated window has the highlight line & column
    autocmd WinEnter * set cursorline
    autocmd WinLeave * set nocursorline
    autocmd WinEnter * set cursorcolumn
    autocmd WinLeave * set nocursorcolumn

" restore cursor position when opening file(if opened)
    autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif

" the fish shell is not very compatible to other shells and unexpectedly
" breaks things that use 'shell'.
    if &shell =~# 'fish$'
        set shell=/bin/bash
    endif

" key-binding without plugin {{{ "
    " don't use arrow key in normal and insert mode
    map <Left> <Nop>
    map <Right> <Nop>
    map <Up> <Nop>
    map <Down> <Nop>
    imap <Up> <Nop>
    imap <Down> <Nop>
    imap <Left> <Nop>
    imap <Right> <Nop>

    " use space as the leader
    let mapleader = " "

    nnoremap <Leader>w :w<CR>
    nnoremap <silent> <Leader>q :q<CR>

    " yarn to system, paste from system
    vnoremap <silent> <Leader>y "+y
    nnoremap <silent> <Leader>p "+p
    nnoremap <silent> <Leader>P "+P
    vnoremap <silent> <Leader>p "+p
    vnoremap <silent> <Leader>P "+P

    nnoremap <silent> <Leader><BackSpace> :nohl<CR>

    " ctrl-c doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
    inoremap <C-c> <ESC>
    " neovim terminal - To map <Esc> to exit terminal-mode
    :tnoremap <Esc> <C-\><C-n>

    " using `Ctrl + {h, j, k, l}` to navigate windows
    nnoremap <silent> <C-h> <C-w>h
    nnoremap <silent> <C-j> <C-w>j
    nnoremap <silent> <C-k> <C-w>k
    nnoremap <silent> <C-l> <C-w>l

    " change windows size
    " + or - is increase or decrease current windows height
    nnoremap <silent> <Leader>+ <C-w>3+
    nnoremap <silent> <Leader>- <C-w>3-
    " > or < is increase or decrease current windows width
    nnoremap <silent> <Leader>> <C-w>5>
    nnoremap <silent> <Leader>< <C-w>5< 

    " add new empty line in normal mode
    nnoremap <Leader>o o<ESC>
    nnoremap <Leader>O O<ESC>

    xnoremap < <gv
    xnoremap > >gv

    vnoremap gl g_
    vnoremap gh ^
" }}} key-binding without plugin "

