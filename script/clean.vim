" reference: https://github.com/chemzqm/vimrc/blob/64f4cdfc1b/leadermap.vim#L113-L129
" Simple clean utility
function! s:Clean()
    let view = winsaveview()
    let ft = &filetype

    " replace tab with 4 space
    if index(['javascript', 'sh','vim'], ft) != -1
      silent! execute "%s/\<tab>/    /g"
    endif

    " remove tailing white space
    silent! execute '%s/\s\+$//'

    " remove windows `\r`
    call winrestview(view)
endfunction

nnoremap <Leader>cl :call <SID>Clean()<CR>
