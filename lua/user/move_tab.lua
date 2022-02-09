vim.cmd([[
function! s:move_tab(direction) abort
    let count = tabpagenr('$')
    if count == 1
        return
    endif

    if a:direction == 0
        if tabpagenr() == 1
			let target = '$'
        else
			let target = '-'
        endif
    else
        if tabpagenr() == count
			let target = '0'
        else
			let target = '+'
        endif
    endif

	execute 'tabmove ' . target
endfunction
nnoremap <silent> <M-h> :call <SID>move_tab(0)<CR>
nnoremap <silent> <M-l> :call <SID>move_tab(1)<CR>
]])
