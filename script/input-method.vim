" MacOS: im-select
" Unix: fcitx-remote, link: https://wiki.archlinux.org/index.php/Fcitx_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)#Vim
if has('mac') && executable('im-select')
    let s:original_method = "com.apple.keylayout.ABC"
    function! s:ChangeInputMethodToEn()
        let s:original_method = system("/usr/local/bin/im-select")
        call system("im-select com.apple.keylayout.ABC")
    endfunction

    function! s:ChangeInputMethodToOriginal()
        call system("im-select ".s:original_method)
    endfunction

    autocmd InsertLeave * call <SID>ChangeInputMethodToEn()
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

