" MacOS: im-select
" Unix: fcitx-remote, link: https://wiki.archlinux.org/index.php/Fcitx_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)#Vim
if has('mac') && executable('im-select')
    let s:original_method = "com.apple.keylayout.ABC"
    function! s:ChangeInputMethodToEn()
        let s:original_method = system("/usr/local/bin/im-select")
        call system("im-select com.apple.keylayout.ABC")
    endfunction
    autocmd InsertLeave * call <SID>ChangeInputMethodToEn()
    
    function! s:ChangeInputMethodToOriginal()
        call system("im-select ".s:original_method)
    endfunction
    autocmd InsertEnter * call <SID>ChangeInputMethodToOriginal()
elseif has('unix') && executable('fcitx-remote')
    let s:input_toggle = 1
    function! s:Fcitx2en()
        let l:input_status = system("fcitx-remote")
        if l:input_status == 2
            let s:input_toggle = 1
            call system("fcitx-remote -c")
        endif
    endfunction
    
    function! s:Fcitx2zh()
        let l:input_status = system("fcitx-remote")
        if l:input_status != 2 && s:input_toggle == 1
            call system("fcitx-remote -o")
            let s:input_toggle = 0
        endif
    endfunction

    set ttimeoutlen=150
    autocmd InsertLeave * call <SID>Fcitx2en()
    autocmd InsertEnter * call <SID>Fcitx2zh()
endif

" Creates a floating window with a most recent buffer to be used
" reference: https://github.com/camspiers/dotfiles/blob/master/files/.config/nvim/init.vim#L246
function! CreateCenteredFloatingWindow()
    let width = float2nr(&columns * 1)
    let height = float2nr(&lines * 0.75)
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let top = "╭" . repeat("─", width - 2) . "╮"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "╰" . repeat("─", width - 2) . "╯"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    au BufWipeout <buffer> exe 'bw '.s:buf
endfunction


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

fun! s:CsRepl() range
    let l:contentList = getline(a:firstline, a:lastline)

    let l:mapping = {
    \   "javascript": "node",
    \   "python": "python3",
    \ }
    
    let l:filetype = &filetype
    if ! has_key(l:mapping, l:filetype)
        echom 'no configure for this type(' . l:filetype . ')'
        return
    endif
    let l:name = l:mapping[l:filetype]
    
    let l:found_bufnr = 0
    for nr in filter(range(1, bufnr('$')), 'bufexists(v:val)')
        if getbufvar(nr, '&buftype') == 'terminal' && bufname(nr) == 'floaterm://' . l:name
            let l:found_bufnr = nr
        endif
    endfor

    if l:found_bufnr == 0
        execute 'FloatermNew --width=0.5 --wintype=normal --position=right --name=' . l:name . ' ' . l:name
        stopinsert

        setlocal nonumber
        setlocal norelativenumber

        let prev_window = winnr('#')
        execute prev_window . 'wincmd w'
    endif

    for content in l:contentList
        execute 'FloatermSend --name=' . l:name . ' ' . content 
    endfor
endf

nnoremap <silent> <Leader>x :call <SID>CsRepl()<CR>
vnoremap <silent> <Leader>x :call <SID>CsRepl()<CR>
