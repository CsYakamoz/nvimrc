-- Requirement:
-- MacOS: im-select
-- Unix: fcitx-remote, link: https://wiki.archlinux.org/index.php/Fcitx_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)#Vim
vim.cmd([[
let s:auto = 0
let s:input_toggle = 0

if has('mac') && executable('im-select')
    function! s:Method2En()
        let method = trim(system("im-select"))

		if method != "com.apple.keylayout.ABC"
            let s:input_toggle = 1
			let s:original_method = method

			call system("im-select com.apple.keylayout.ABC")
		endif
    endfunction

    function! s:RestoreMethod()
        let method = trim(system("im-select"))

		if method == "com.apple.keylayout.ABC" && s:input_toggle == 1
			call system("im-select " . s:original_method)
            let s:input_toggle = 0
		endif
    endfunction

	let s:auto = 1
elseif has('unix') && executable('fcitx-remote')
	" `fcitx-remote`: 0 for close, 1 for inactive, 2 for active
    function! s:Method2En()
        let input_status = system("fcitx-remote")

        if input_status == 2
            let s:input_toggle = 1
            call system("fcitx-remote -c")
        endif
    endfunction

    function! s:RestoreMethod()
        let input_status = system("fcitx-remote")

        if input_status != 2 && s:input_toggle == 1
            call system("fcitx-remote -o")
            let s:input_toggle = 0
        endif
    endfunction

	let s:auto = 1
endif

if s:auto == 1
    set ttimeoutlen=150
    autocmd InsertLeave * call <SID>Method2En()
    autocmd InsertEnter * call <SID>RestoreMethod()
endif
]])
