function! s:Gruvbox()
    let g:gruvbox_material_enable_italic = 1
    colorscheme gruvbox-material

    let g:airline_theme='gruvbox_material'
endfunction

function! s:Xcodewwdc()
    colorscheme xcodewwdc

    let g:airline_theme='bubblegum'
endfunction

function! s:ForestNight()
    let g:forest_night_enable_italic = 1
    colorscheme forest-night

    let g:airline_theme='forest_night'
endfunction

function! s:Ayu()
    let g:ayucolor="light"
    colorscheme ayu

    let g:airline_theme='solarized'
endfunction

let s:colorList = [
    \ function("<SID>Gruvbox"),
    \ function('<SID>Ayu'),
    \ function("<SID>Xcodewwdc"),
    \ function('<SID>ForestNight'),
    \ ]
" 28800 millisecond is equal to 8 hour, because China timezone is GMT+8
" 86400 millisecond is equal to 1 day
let s:dayNumFrom1970 = (localtime() + 28800) / 86400
let s:idx = s:dayNumFrom1970 % len(s:colorList)
let s:ChangeFun = s:colorList[s:idx]
call s:ChangeFun()
