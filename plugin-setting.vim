" color-schema
    colorscheme gruvbox
    " colorscheme forest-night
    " colorscheme soft-era

" transparency background
    hi Normal  ctermfg=252 ctermbg=none

" indent_guides
    let g:indent_guides_guide_size = 1
    let g:indent_guides_enable_on_vim_startup = 1

" airline
    let g:airline_theme='bubblegum'
    " let g:airline_theme = 'softera'
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#formatter = 'unique_tail_improved' 

" simpylfold
    set foldmethod=indent
    set foldlevelstart=10
    let g:SimpylFold_docstring_preview = 1

" fzf
    let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit' }

    command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

    command! -bang -nargs=* Rg
        \ call fzf#vim#grep(
        \   'rg --column --line-number --no-heading --color=always --smart-case --glob "!node_modules" '.shellescape(<q-args>), 1,
        \   <bang>0 ? fzf#vim#with_preview('up:60%')
        \           : fzf#vim#with_preview('right:50%:hidden', '?'),
        \   <bang>0)

" coc-prettier
    command! -nargs=0 Prettier :CocCommand prettier.formatFile

" nerdtree
    " How can I open NERDTree automatically when vim starts up on opening a directory?
    " Note: Executing vim ~/some-directory will open NERDTree and a new edit window. exe 'cd '.argv()[0] sets the pwd of the new edit window to ~/some-directory
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
    let NERDTreeIgnore = ['node_modules', '\.git']

" nerdcommenter
    " Add spaces after comment delimiters by default
    let g:NERDSpaceDelims = 1

" startify
    " When opening a file or bookmark, don't change to its directory
    let g:startify_change_to_dir = 0
    " How do I get both NERDTree and Startify working at startup?~
    autocmd VimEnter *
            \   if !argc()
            \ |   Startify
            \ |   NERDTree
            \ |   wincmd w
            \ | endif
    " change order
    let g:startify_lists = [
          \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
          \ { 'type': 'files',     'header': ['   MRU']            },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'commands',  'header': ['   Commands']       },
          \ ]

" vista
    " default executive
    let g:vista_default_executive="coc"
    " fzf - preview
    let g:vista_fzf_preview = ['right:50%']

" vim-javascript
    let g:javascript_plugin_jsdoc = 1
