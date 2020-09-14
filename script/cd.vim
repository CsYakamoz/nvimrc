fun! s:CD()
    let path = expand('%:p:h')
    if !isdirectory(path)
        echo 'can not cd ' . path
        return
    endif

    execute 'FloatermNew --name=csyakamoz_path'
    execute 'FloatermToggle'
    execute 'FloatermSend --name=csyakamoz_path cd ' . path
    execute 'FloatermToggle'
endf
command! -nargs=0 CD :call s:CD()
