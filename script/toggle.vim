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

let s:autoSelectToggle = 1
fun! s:AutoSelectTextAfterPasteToggle()
    if s:autoSelectToggle == 1
        nunmap <Leader>p
        nunmap <Leader>P
        xunmap <Leader>p
        xunmap <Leader>P
        xunmap p
        xunmap P

        nnoremap p p`[v`]
        nnoremap P P`[v`]

        nnoremap <silent> <Leader>p "+p`[v`]
        nnoremap <silent> <Leader>P "+P`[v`]
        xnoremap <silent> <Leader>p "+p`[v`]
        xnoremap <silent> <Leader>P "+P`[v`]
        xnoremap p "_dP`[v`]
        xnoremap P "_dP`[v`]
        let s:autoSelectToggle = 0
    else
        nunmap <Leader>p
        nunmap <Leader>P
        xunmap <Leader>p
        xunmap <Leader>P
        xunmap p
        xunmap P

        nunmap p
        nunmap P

        nnoremap <silent> <Leader>p "+p
        nnoremap <silent> <Leader>P "+P
        xnoremap <silent> <Leader>p "+p
        xnoremap <silent> <Leader>P "+P
        xnoremap p "_dP
        xnoremap P "_dP
        let s:autoSelectToggle = 1
    endif
endf
command! -nargs=0 AutoSelectTextAfterPasteToggle :call s:AutoSelectTextAfterPasteToggle()
