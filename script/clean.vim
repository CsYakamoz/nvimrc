" reference: https://github.com/chemzqm/vimrc/blob/64f4cdfc1b/leadermap.vim#L113-L129
" Simple clean utility
let s:effectiveFileType = [
    \ 'javascript',
    \ 'sh',
    \ 'vim',
    \ 'php',
    \ ]
function! s:Clean()
    let view = winsaveview()
    let ft = &filetype

    " replace tab with 4 space
    if index(s:effectiveFileType, ft) != -1
      silent! execute "%s/\<tab>/    /g"
    endif

    " remove tailing white space
    silent! execute '%s/\s\+$//e'

    " remove windows `\r`
    call winrestview(view)
endfunction

command! -nargs=0 Clean :call s:Clean()
