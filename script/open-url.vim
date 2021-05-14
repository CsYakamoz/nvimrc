" copy from: https://gist.github.com/skywind3000/4cc6a564ce159870f954763cc49d8784
"----------------------------------------------------------------------
" OpenURL[!] [url]
" - open url in default browser (change this by g:browser_cmd)
" - when bang (!) is included, ignore g:browser_cmd
" - when url is omitted, use the current url under cursor
" - vim-plug format "Plug 'xxx'" can also be accepted.
"----------------------------------------------------------------------
command! -nargs=* -bang OpenURL call s:OpenURL(<q-args>, '<bang>')
function! s:OpenURL(url, bang)
    let url = a:url
    if url == ''
        let t = matchstr(getline('.'), '^\s*Plug\s*''\zs\(.\{-}\)*\ze''')
        if t != ''
            let url = (t =~ '^\(http\|https\):\/\/')? t : ('https://github.com/' . t)
        elseif expand('<cfile>') != ''
            let url = expand('<cfile>')
        endif
    endif
    if url != ''
        let url = escape(url, "%|*#")
        let browser = get(g:, 'browser_cmd', '')
        let browser = (a:bang == '!')? '' : browser
        if has('win32') || has('win64') || has('win16') || has('win95')
            let browser = (browser == '')? 'start' : browser
            silent exec '!start /b cmd /c ' . browser . ' ' . url
        elseif has('mac') || has('macunix') || has('gui_macvim')
            let browser = (browser == '')? 'open' : browser
            call system(browser . ' ' . url . ' &')
        else
            let browser = (browser == '')? 'xdg-open' : browser
            call system(browser . ' ' . url . ' &')
        endif
    endif
endfunction
