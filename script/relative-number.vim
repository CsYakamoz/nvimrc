" reference: https://github.com/bluz71/vim-moonfly-colors#tip-relative-number-column-highlighting-only-for-the-active-window
if exists('&cursorlineopt')
    set cursorlineopt=number
    set cursorline
endif

let s:black_buf_type_list = [
    \ "nofile",
    \ "nowrite",
    \ "terminal",
    \ "help",
    \ ]
let s:black_file_type_list = [
    \ "startify",
    \ "diff",
    \ ]
function! RelativeNumberActivity(active)
    if &diff || &number == 0
        " For diffs, do nothing since we want relativenumbers in all windows.
        return
    endif
    if index(s:black_buf_type_list, &buftype) != -1 || index(s:black_file_type_list, &filetype) != -1
        setlocal nonumber
    elseif a:active == v:true
        setlocal relativenumber
        if exists('&cursorlineopt')
            setlocal cursorline
        endif
    else
        setlocal norelativenumber
        if exists('&cursorlineopt')
            setlocal nocursorline
        endif
    endif
endfunction

augroup CustomWindowActivity
    autocmd!
    autocmd WinEnter * call RelativeNumberActivity(v:true)
    autocmd WinLeave * call RelativeNumberActivity(v:false)
augroup END

