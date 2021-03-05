function! s:Gruvbox()
    let g:gruvbox_material_enable_italic = 1
    colorscheme gruvbox-material
    let g:airline_theme='bubblegum'
endfunction

function! s:Xcode()
    " italic comments
    augroup vim-colors-xcode
        autocmd!
    augroup END
    autocmd vim-colors-xcode ColorScheme * hi Comment        cterm=italic gui=italic
    autocmd vim-colors-xcode ColorScheme * hi SpecialComment cterm=italic gui=italic

    if s:colorType == 'light'
        let g:xcodeligh_temph_types=1
        let g:xcodeligh_emph_funcs=1
        let g:xcodeligh_emph_idents=1
        colorscheme xcodelight
        let g:airline_theme='solarized'
        let $BAT_THEME="Solarized (light)"
    else
        let g:xcodedark_temph_types=1
        let g:xcodedark_emph_funcs=1
        let g:xcodedark_emph_idents=1
        colorscheme xcodedark
        let g:airline_theme='bubblegum'
    endif
endfunction

function! s:ForestNight()
    let g:forest_night_enable_italic = 1
    colorscheme forest-night
    let g:airline_theme='forest_night'
endfunction

function! s:Ayu()
    if s:colorType == 'light'
        let g:ayucolor="light"
        let $BAT_THEME="Solarized (light)"
    else
        let g:ayucolor="mirage"
    endif

    colorscheme ayu
endfunction

function! s:Solarized()
    if s:colorType == 'light'
        set background=light
        let $BAT_THEME="Solarized (light)"
    else
        set background=dark
        let g:airline_theme='atomic'
    endif
    colorscheme solarized
endf

function! s:OceanicMaterial()
    set background=dark
    colorscheme oceanic_material
    let g:airline_theme='bubblegum'
endfunction

fun! s:Seoul256()
    if s:colorType == 'light'
        colorscheme seoul256-light
        let g:airline_theme='solarized'
        let $BAT_THEME="Solarized (light)"
    else
        colorscheme seoul256
        let g:airline_theme='bubblegum'
    endif
endf

let s:colorList = [
    \ function('<SID>Solarized'),
    \ function('<SID>Seoul256'),
    \ function('<SID>Ayu'),
    \ function("<SID>Xcode"),
    \ function("<SID>Gruvbox"),
    \ function('<SID>ForestNight'),
    \ function('<SID>OceanicMaterial'),
    \ ]

let s:colorType = 'light'
if !exists('s:colorType')
    if strftime('%H') > 6 && strftime('%H') < 18
        let s:colorType = 'light'
    else
        let s:colorType = 'dark'
    endif
endif

let s:target = s:colorList[2]
if !exists('s:target')
    " 28800 millisecond is equal to 8 hour, because China timezone is GMT+8
    " 86400 millisecond is equal to 1 day
    let s:dayNumFrom1970 = (localtime() + 28800) / 86400
    let s:idx = s:dayNumFrom1970 % len(s:colorList)
    let s:ChangeFun = s:colorList[s:idx]
    call s:ChangeFun()
else
    call s:target()
endif
