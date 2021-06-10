if exists("b:did_ftplugin")
    finish
endif

setlocal tabstop=2
" setlocal noexpandtab
setlocal softtabstop=2
setlocal shiftwidth=2

" reference: https://gist.github.com/romainl/ac63e108c3d11084be62b3c04156c263
function! s:JumpToNextHeading(direction, count)
    let col = col(".")

    silent execute a:direction == "up" ? '?^#' : '/^#'

    if a:count > 1
        silent execute "normal! " . repeat("n", a:direction == "up" && col != 1 ? a:count : a:count - 1)
    endif

    silent execute "normal! " . col . "|"

    unlet col
endfunction

nnoremap <buffer> <silent> ]] :<C-u>call <SID>JumpToNextHeading("down", v:count1)<CR>
nnoremap <buffer> <silent> [[ :<C-u>call <SID>JumpToNextHeading("up", v:count1)<CR>

let b:did_ftplugin = 1
