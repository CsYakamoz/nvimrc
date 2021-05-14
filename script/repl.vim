" require: vim-floaterm
let s:config = {
\   "javascript": {
    \   "name": "node",
    \   "executor": "node",
    \   "preloading": [
        \   "const R = require('ramda');const trace = R.tap(console.log);const DayJs = require('dayjs');",
        \ ],
    \ },
\   "python": {
    \   "name": "python3",
    \   "executor": "python3",
    \   "preloading": [],
    \ },
\   "php": {
    \   "name": "php",
    \   "executor": "php -a",
    \   "preloading": [],
    \ },
\ }

fun! s:CsRepl(mode) range
    let filetype = &filetype
    if ! has_key(s:config, filetype)
        echom 'no configure for this filetype(' . filetype . ')'
        return
    endif

    let name = s:config[filetype].name
    let executor = s:config[filetype].executor

    let found_bufnr = 0
    for nr in filter(range(1, bufnr('$')), 'bufexists(v:val)')
        if getbufvar(nr, '&buftype') == 'terminal' && matchstr(bufname(nr), 'term://.*//\d\+:' . name) != ''
            let found_bufnr = nr
        endif
    endfor

    if found_bufnr == 0
        execute 'FloatermNew --width=0.5 --wintype=vsplit --position=botright --name=' . name . ' ' . executor
        stopinsert

        setlocal nonumber
        setlocal norelativenumber

        let prev_window = winnr('#')
        execute prev_window . 'wincmd w'

        let preloading = s:config[filetype]
        if len(preloading) != 0
            sleep 100m
            for input in s:config[filetype].preloading
                if strlen(input) == 0
                    continue
                endif

                execute 'FloatermSend --name=' . name . ' ' . input
            endfor
        endif
    endif

    if a:mode == 0
        execute 'FloatermSend --name=' . name
    else
        execute "'<,'>FloatermSend --name=" . name
    endif
endf

nnoremap <silent> <Leader>x :call <SID>CsRepl(0)<CR>
xnoremap <silent> <Leader>x :call <SID>CsRepl(1)<CR>

