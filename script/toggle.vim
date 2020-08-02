" reference: https://github.com/chemzqm/vimrc/blob/64f4cdfc1b/leadermap.vim#L104-L106
function! s:NumberToggle()
    if(&number == 1) | set nu! | set rnu! | else | set rnu | set nu | endif
endfunction
nnoremap <Leader>nu :call <SID>NumberToggle()<CR>

" reference: https://github.com/chemzqm/vimrc/blob/64f4cdfc1b/leadermap.vim#L95-L102
function! s:BackgroundToggle()
    if &background ==# 'light'
      set background=dark
    else
      set background=light
    endif
endfunction
nnoremap <Leader>bg :call <SID>BackgroundToggle()<CR>

" reference: https://github.com/chemzqm/vimrc/blob/64f4cdfc1b/command.vim#L35-L41
function! s:MouseToggle()
    if empty(&mouse)
      set mouse=a
    else
      set mouse=
    endif
endfunction
command! -nargs=0 Mouse :call s:MouseToggle()
