" basic
    let mapleader = " "         " use space as the leader
    nnoremap <Leader>w :w<CR>
    nnoremap <Leader>q :q<CR>
    nnoremap <Leader>Q :qa<CR>

    " yarn to system, paste from system
    vnoremap <Leader>y "+y
    nnoremap <Leader>p "+p
    vnoremap <Leader>p "+p

    nnoremap <Leader><BackSpace> :nohl<CR>

" ESC
    " ctrl-c doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
    inoremap <C-c> <ESC>
    " neovim terminal - To map <Esc> to exit terminal-mode
    :tnoremap <Esc> <C-\><C-n>

" To use `Ctrl + {h, j, k, l}` to navigate windows
    " normal
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l
    " terminal
    tnoremap <C-S-h> <C-\><C-N><C-w>h
    tnoremap <C-S-j> <C-\><C-N><C-w>j
    tnoremap <C-S-k> <C-\><C-N><C-w>k
    tnoremap <C-S-l> <C-\><C-N><C-w>l

" Change windows size
    " + or - is increase or decrease cuuent windows height
    nnoremap <Leader>+ <C-w>3+   
    nnoremap <Leader>- <C-w>3-   
    " > or < is increase or decrease cuuent windows width
    nnoremap <Leader>> <C-w>5>   
    nnoremap <Leader>< <C-w>5<   

" nerdtree
    nnoremap <Leader>e :NERDTreeToggle<CR>

" Use Prettier to format file
    nnoremap <Leader>f :Prettier<CR>

" fzf
    nnoremap <silent> <C-f> :Files<CR>
    nnoremap <silent> <C-b> :Buffers<CR>
    nnoremap <silent> <C-g> :Rg<CR>

" coc.nvim
    inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? coc#rpc#request('doKeymap', ['snippets-expand-jump','']) :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    let g:coc_snippet_next = '<Tab>'
    let g:coc_snippet_prev = '<S-Tab>'

    " rename
    nmap <silent> re <Plug>(coc-rename)

    " renmap keys for gotos
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gr <Plug>(coc-references)

    " integration with vim-airline
    let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
    let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" vista
    nnoremap <Leader>v :Vista!!<CR>      
