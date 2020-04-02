" auto change input method, required im-select for MacOS
" if used fcitx in Linux,
" see https://wiki.archlinux.org/index.php/Fcitx_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)#Vim
let s:original_method = "com.apple.keylayout.ABC"
function! ChangeInputMethodToEn()
    let s:original_method = system("/usr/local/bin/im-select")
    call system("/usr/local/bin/im-select com.apple.keylayout.ABC")
endfunction
autocmd InsertLeave * call ChangeInputMethodToEn()

function! ChangeInputMethodToOriginal()
    call system("/usr/local/bin/im-select ".s:original_method)
endfunction
autocmd InsertEnter * call ChangeInputMethodToOriginal()

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
    let buffers = filter(range(1, bufnr('$')), 'buflisted(v:val) && empty(bufname(v:val)) && bufwinnr(v:val) < 0 && (getbufline(v:val, 1, "$") == [""])')
    if !empty(buffers)
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
