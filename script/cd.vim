fun! s:CD()
    let path = expand('%:p:h')
    if !isdirectory(path)
        echo 'can not cd ' . path
        return
    endif

    execute 'FloatermSend cd ' . path
    execute 'FloatermShow'
endf
command! -nargs=0 CD :call s:CD()
