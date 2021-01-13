function! s:swapWindow(nav) abort
    let winCount = winnr('$')
    if winCount == 1
        return
    endif
    let currWinnr = winnr()
    let currBufnr = bufnr()

    " 0: previous, 1: next
    let targetWinnr = a:nav == 0 ? currWinnr - 1 : currWinnr + 1
    if targetWinnr == 0
        let targetWinnr = winCount
    elseif targetWinnr >  winCount
        let targetWinnr = 1
    endif

    execute targetWinnr . 'wincmd w'
    let targetBufnr = bufnr()

    execute 'buffer ' . currBufnr . '|'.
        \ currWinnr . 'wincmd w' . '|'.
        \ 'buffer ' . targetBufnr
endf

nnoremap <silent> <Leader>{ :call <SID>swapWindow(0)<CR>
nnoremap <silent> <Leader>} :call <SID>swapWindow(1)<CR>

