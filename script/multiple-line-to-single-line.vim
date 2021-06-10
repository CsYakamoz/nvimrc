function! s:MultipleLineToSingleLine()
    execute '%s/\n\{3,}/\r\r/e'
endfunction

command! -nargs=0 Ml2Sl :call s:MultipleLineToSingleLine()

