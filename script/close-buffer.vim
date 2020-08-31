function! s:CloseBuffer(item)
    execute 'bdelete ' . a:item
endfunction

function! s:CloseSpecificBuffer()
    " clean all unedited unnamed buffer
    let buffers = filter(range(1, bufnr('$')), 'buflisted(v:val) && empty(bufname(v:val)) && bufwinnr(v:val) < 0 && (getbufline(v:val, 1, "$") == [""])')
    if !empty(buffers)
        exe 'bd '.join(buffers, ' ')
    endif

    let list = filter(range(1, bufnr('$')), 'buflisted(v:val) && getbufvar(v:val, "&filetype") != "qf"')
    let named_list = map(list, 'bufname(v:val)')

    call fzf#run({
    \   'source': named_list,
    \   'sink': function('<SID>CloseBuffer'),
    \   'options': '--multi',
    \   'window': 'call CreateCenteredFloatingWindow()'
    \ })
endfunction
command! -nargs=0 CloseSpecificBuffer :call s:CloseSpecificBuffer()
