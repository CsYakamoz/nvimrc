" basic
    let mapleader = " "         " use space as the leader
    nnoremap <Leader>w :w<CR>
    nnoremap <Leader>q :q<CR>

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
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l

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
    " make snippet completion work just like VSCode
    inoremap <silent><expr> <TAB>
        \ pumvisible() ? coc#_select_confirm() :
        \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
    
    function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    let g:coc_snippet_next = '<Tab>'
    let g:coc_snippet_prev = '<S-Tab>'

    " Use K to show documentation in preview window
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
        if (index(['vim','help'], &filetype) >= 0)
            execute 'h '.expand('<cword>')
        else
            call CocAction('doHover')
        endif
    endfunction

    " Remap for rename current word
    nmap <leader>rn <Plug>(coc-rename)

    " renmap keys for gotos
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gr <Plug>(coc-references)

" vista
    nnoremap <Leader>v :Vista!!<CR>      

