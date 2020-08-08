" require: vim-floaterm
fun! s:CsRepl(mode) range
    let mapping = {
    \   "javascript": "node",
    \   "python": "python3",
    \ }

    let filetype = &filetype
    if ! has_key(mapping, filetype)
        echom 'no configure for this type(' . filetype . ')'
        return
    endif
    let name = mapping[filetype]

    let found_bufnr = 0
    for nr in filter(range(1, bufnr('$')), 'bufexists(v:val)')
        if getbufvar(nr, '&buftype') == 'terminal' && bufname(nr) == 'floaterm://' . name
            let found_bufnr = nr
        endif
    endfor

    if found_bufnr == 0
        execute 'FloatermNew --width=0.5 --wintype=normal --position=right --name=' . name . ' ' . name
        stopinsert

        setlocal nonumber
        setlocal norelativenumber

        let prev_window = winnr('#')
        execute prev_window . 'wincmd w'
    endif

    if a:mode == 0
        execute 'FloatermSend --name=' . name
    else
        execute "'<,'>FloatermSend --name=" . name
    endif
endf

nnoremap <silent> <Leader>x :call <SID>CsRepl(0)<CR>
xnoremap <silent> <Leader>x :call <SID>CsRepl(1)<CR>

