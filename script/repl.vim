" require: vim-floaterm
fun! s:CsRepl(mode) range
    let l:mapping = {
    \   "javascript": "node",
    \   "python": "python3",
    \ }

    let l:filetype = &filetype
    if ! has_key(l:mapping, l:filetype)
        echom 'no configure for this type(' . l:filetype . ')'
        return
    endif
    let l:name = l:mapping[l:filetype]

    let l:found_bufnr = 0
    for nr in filter(range(1, bufnr('$')), 'bufexists(v:val)')
        if getbufvar(nr, '&buftype') == 'terminal' && bufname(nr) == 'floaterm://' . l:name
            let l:found_bufnr = nr
        endif
    endfor

    if l:found_bufnr == 0
        execute 'FloatermNew --width=0.5 --wintype=normal --position=right --name=' . l:name . ' ' . l:name
        stopinsert

        setlocal nonumber
        setlocal norelativenumber

        let prev_window = winnr('#')
        execute prev_window . 'wincmd w'
    endif

    if a:mode == 0
        execute 'FloatermSend --name=' . l:name
    else
        execute "'<,'>FloatermSend --name=" . l:name
    endif
endf

nnoremap <silent> <Leader>x :call <SID>CsRepl(0)<CR>
vnoremap <silent> <Leader>x :call <SID>CsRepl(1)<CR>

