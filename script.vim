function! s:ToggleTerminal()
    let found_winnr = 0
    for winnr in range(1, winnr('$'))
      if getbufvar(winbufnr(winnr), '&buftype') == 'terminal'
        let found_winnr = winnr
      endif
    endfor

    if found_winnr > 0
      execute found_winnr . 'wincmd q'
    else
      let found_bufnr = 0
      for bufnr in filter(range(1, bufnr('$')), 'bufexists(v:val)')
        if getbufvar(bufnr, '&buftype') == 'terminal'
          let found_bufnr = bufnr
        endif
      endfor
      if found_bufnr > 0
        if &lines > 30
          botright 15split
          execute 'buffer ' . found_bufnr
        else
          botright split
          execute 'buffer ' . found_bufnr
        endif
      else
        if &lines > 30
          execute 'botright 15split term://' . &shell
        else
          execute 'botright split term://' . &shell
        endif
      endif
    endif
endfunction

nnoremap <silent> <Leader>t :call <SID>ToggleTerminal()<CR>
nnoremap <silent> <M-`>     :call <SID>ToggleTerminal()<CR>


" auto change input method, required im-select for macOS
" if use fcitx, see https://wiki.archlinux.org/index.php/Fcitx_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)#Vim
let g:original_method = "com.apple.keylayout.ABC"
function! ChangeInputMethodToEn()
    let g:original_method = system("/usr/local/bin/im-select")
    call system("/usr/local/bin/im-select com.apple.keylayout.ABC")
endfunction
autocmd InsertLeave * call ChangeInputMethodToEn()

function! ChangeInputMethodToOriginal()
    call system("/usr/local/bin/im-select ".g:original_method)
endfunction
autocmd InsertEnter * call ChangeInputMethodToOriginal()
