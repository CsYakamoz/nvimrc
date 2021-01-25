" common {{{ "
    set termguicolors                   " use true color
    set nowrap                          " don't wrap line
    set hidden                          " allow jump other buffer without saving
    set signcolumn=yes                  " always show signcolumns
    set number                          " show line number
    set relativenumber                  " show relative number
    set cursorline                      " highlight current line
    set cursorcolumn                    " highlight current column
    set colorcolumn=80,120
    set ignorecase                      " ignore case when searching
    set smarttab
    set smartcase                       " Override the 'ignorecase' option if the search pattern contains upper case characters
    set shiftwidth=4                    " >> indents by 4 spaces
    set tabstop=4
    set expandtab                       " use spaces instead of tabs
    set shiftround                      " >> indents to next multiple of shiftwidth
    set softtabstop=4                   " tab key indents by 4 spaces
    set autoindent
    set foldmethod=indent               " the kind of folding used for the current window.
    set foldlevelstart=10               " not yet understood
    set updatetime=300                  " you will have bad experience for diagnostic messages when it's default 4000.
    set shortmess+=c                    " Don't pass messages to |ins-completion-menu|
    set splitright                      " splitting a window will put the new window right of the current
    set splitbelow                      " splitting a window will put the new window below of the current
    language en_US.UTF-8                " um... i just want to learn english
    set synmaxcol=300                   " Only highlight the first 300 columns.
    set pumheight=15                    " Maximum number of items to show in the popup menu
    set undofile
    set undodir=~/.cache/vim/undo
    set fileformats=unix,dos
    set noswapfile
    set scrolloff=3
    set sidescrolloff=3
    set list
    set listchars=tab:▸\ ,trail:·,extends:>
    set showmatch
    set matchtime=1
    set complete-=i                     " disable scanning included files
    set complete-=t                     " disable searching tags
    set autoread
" }}} common "

" only activated window has the highlight line & column
    augroup highlight_line_column
        autocmd!
        autocmd WinEnter * set cursorline
        autocmd WinLeave * set nocursorline
        autocmd WinEnter * set cursorcolumn
        autocmd WinLeave * set nocursorcolumn
    augroup end

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
    " ctrl-c doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
    inoremap <C-c> <ESC>

    " don't use arrow key in normal and insert mode
    map <Left> <Nop>
    map <Right> <Nop>
    map <Up> <Nop>
    map <Down> <Nop>
    imap <Up> <Nop>
    imap <Down> <Nop>
    imap <Left> <Nop>
    imap <Right> <Nop>

    " avoid to start ex mode
    nnoremap Q <nop>

    " use space as the leader
    let mapleader = " "

    nnoremap <silent> <Leader>w :w<CR>
    nnoremap <silent> <Leader>q :q<CR>
    nnoremap <silent> <Leader>Q :qa<CR>

    " yarn to system, paste from system
    xnoremap <silent> <Leader>y "+y
    nnoremap <silent> <Leader>p "+p
    nnoremap <silent> <Leader>P "+P
    xnoremap <silent> <Leader>p "+p
    xnoremap <silent> <Leader>P "+P

    nnoremap <silent> <Leader><BackSpace> :nohl<CR>

    " using `Ctrl + {h, j, k, l}` to navigate windows
    nnoremap <silent> <C-h> <C-w>h
    nnoremap <silent> <C-j> <C-w>j
    nnoremap <silent> <C-k> <C-w>k
    nnoremap <silent> <C-l> <C-w>l

    " change windows size
    " + or - is increase or decrease current windows height
    nnoremap <silent> <Leader>= <C-w>3+
    nnoremap <silent> <Leader>- <C-w>3-
    " ] or [ is increase or decrease current windows width
    nnoremap <silent> <Leader>] <C-w>5>
    nnoremap <silent> <Leader>[ <C-w>5<

    " add new empty line in normal mode
    " reference: https://github.com/mhinz/vim-galore#quickly-add-empty-lines
    nnoremap <silent> <Leader>o  :<c-u>put =repeat(nr2char(10), v:count1)<cr>
    nnoremap <silent> <Leader>O  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[

    " reference: https://github.com/mhinz/vim-galore#dont-lose-selection-when-shifting-sidewards
    xnoremap < <gv
    xnoremap > >gv

    xnoremap gl g_
    xnoremap gh ^

    nnoremap n nzz
    nnoremap N Nzz
    nnoremap * *zz
    nnoremap # #zz

    nnoremap <silent> <Leader>m :messages<CR>

    " Do NOT rewrite register after paste
    " reference: https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text
    xnoremap <silent> p p:let @"=@0<CR>
    xnoremap <silent> P P:let @"=@0<CR>

    " go to next/previous tabpage
    nnoremap <C-n> gt
    nnoremap <C-p> gT

    " <C-p> <C-n> has been used in Insert Mode
    inoremap <C-k> <Up>
    inoremap <C-j> <Down>

    " visual current buffer
    nnoremap <Leader>vb GVgg

    " remove all trailing whitespace
    nnoremap <silent> <Leader>rt :%s/\s\+$//e<CR>:nohl<CR>

    " reference: https://vim.fandom.com/wiki/Search_for_visually_selected_text
    xnoremap <silent> * y/\V<C-R>=escape(@",'/\')<CR><CR>zz

    " reference: https://github.com/mhinz/vim-galore#quickly-move-current-line
    nnoremap <silent> ]e  :<c-u>execute 'move +'. v:count1<cr>
    nnoremap <silent> [e  :<c-u>execute 'move -1-'. v:count1<cr>

    " reference: https://github.com/tpope/vim-unimpaired
    nnoremap <silent> ]q :cnext<CR>
    nnoremap <silent> [q :cprevious<CR>
    nnoremap <silent> ]ow :set wrap!<cr>
    nmap <silent> [ow ]ow
    nnoremap <silent> ]p :set paste!<CR>
    nmap <silent> [p ]p

    " reference: https://www.reddit.com/r/vim/comments/ksix5c/replacing_text_my_favorite_remap/
    nnoremap <Leader>rw :%s/\<<C-r><C-w>\>//g<Left><Left><C-r><C-w>

    function! s:horizontalNav(nav) abort
        let movement = float2nr(winwidth(0) / 4)
        if a:nav == 'left'
            execute "normal " . movement . "zh"
        else
            execute "normal " . movement . "zl"
        endif
    endfunction
    nnoremap <silent> zH :call <SID>horizontalNav('left')<CR>
    nnoremap <silent> zL :call <SID>horizontalNav('right')<CR>
" }}} key-binding without plugin "

" vim: set sw=4 ts=4 sts=4 et foldmarker={{{,}}} foldmethod=marker foldlevel=0:
