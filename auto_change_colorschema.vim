function! s:GetTimeRange()
    let l:hour = strftime('%H')
    if l:hour > 6 && l:hour < 15
        return 'light'
    else 
        return 'dark'
    endif
endfunction

function! s:Gruvbox()
    let g:gruvbox_material_enable_italic = 1
    colorscheme gruvbox-material
    let g:airline_theme='gruvbox_material'
endfunction

function! s:Xcode()
    " italic comments
    augroup vim-colors-xcode
        autocmd!
    augroup END
    autocmd vim-colors-xcode ColorScheme * hi Comment        cterm=italic gui=italic
    autocmd vim-colors-xcode ColorScheme * hi SpecialComment cterm=italic gui=italic

    let l:bgType = s:GetTimeRange()
    if l:bgType == 'light'
        let g:xcodeligh_temph_types=1
        let g:xcodeligh_emph_funcs=1
        let g:xcodeligh_emph_idents=1
        colorscheme xcodelight
        let g:airline_theme='solarized'
    else
        let g:xcodedark_temph_types=1
        let g:xcodedark_emph_funcs=1
        let g:xcodedark_emph_idents=1
        colorscheme xcodedark
        let g:airline_theme='bubblegum'
    endif
endfunction

function! s:Palenight()
    colorscheme palenight
    let g:airline_theme = "palenight"
    let g:palenight_terminal_italics=1
endfunction

function! s:ForestNight()
    let g:forest_night_enable_italic = 1
    colorscheme forest-night
    let g:airline_theme='forest_night'
endfunction

function! s:Ayu()
    let l:bgType = s:GetTimeRange()
    if l:bgType == 'light'
        let g:ayucolor="light"
    else
        let g:ayucolor="mirage"
    endif

    colorscheme ayu
endfunction

function! s:Nord()
    colorscheme nord
endfunction

function! s:Dracula()
    colorscheme dracula
endfunction

let s:colorList = [
    \ function("<SID>Gruvbox"),
    \ function('<SID>ForestNight'),
    \ function("<SID>Xcode"),
    \ function('<SID>Ayu'),
    \ function('<SID>Palenight'),
    \ function('<SID>Nord'),
    \ function('<SID>Dracula'),
    \ ]
" 28800 millisecond is equal to 8 hour, because China timezone is GMT+8
" 86400 millisecond is equal to 1 day
let s:dayNumFrom1970 = (localtime() + 28800) / 86400
let s:idx = s:dayNumFrom1970 % len(s:colorList)
let s:ChangeFun = s:colorList[s:idx]
call s:ChangeFun()
