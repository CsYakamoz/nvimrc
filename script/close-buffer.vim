function! s:CloseBuffer(item)
    execute 'bdelete ' . a:item
endfunction

function! CloseSpecificBuffer()
    " clean all unedited unnamed buffer
    let l:buffers = filter(range(1, bufnr('$')), 'buflisted(v:val) && empty(bufname(v:val)) && bufwinnr(v:val) < 0 && (getbufline(v:val, 1, "$") == [""])')
    if !empty(l:buffers)
        exe 'bd '.join(buffers, ' ')
    endif

    let l:list = filter(range(1, bufnr('$')), 'buflisted(v:val) && getbufvar(v:val, "&filetype") != "qf"')
    let l:named_list = map(l:list, 'bufname(v:val)')

    call fzf#run({
    \   'source': l:named_list,
    \   'sink': function('<SID>CloseBuffer'),
    \   'options': '--multi',
    \   'window': 'call CreateCenteredFloatingWindow()'
    \ })
endfunction

