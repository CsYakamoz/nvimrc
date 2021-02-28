fun! s:CsConfirm(...)
    let command = join(a:000, ' ')
    let choice = confirm("Run '" . command . "' command?", "&Yes\n&No", 2)
    if choice == 1
        execute command
    endif
endf

command! -nargs=* CsConfirm :call s:CsConfirm(<q-args>)
