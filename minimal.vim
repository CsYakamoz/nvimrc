" common {{{ "
    set termguicolors                   " use true color
    set nowrap                          " don't wrap line
    set ignorecase                      " ignore case when searching
    set expandtab                       " use spaces instead of tabs
    language en_US.UTF-8                " um... i just want to learn english
    colorscheme desert
" }}} common "

" restore cursor position when opening file(if opened)
    autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif

" key-binding without plugin {{{ "
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
" }}} key-binding without plugin "

