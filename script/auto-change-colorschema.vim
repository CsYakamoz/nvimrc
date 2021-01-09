" let s:colorType = 'dark'
if !exists('s:colorType')
    if strftime('%H') > 6 && strftime('%H') < 15
        let s:colorType = 'light'
    else
        let s:colorType = 'dark'
    endif
endif

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
    if s:colorType == 'light'
        let g:ayucolor="light"
    else
        let g:ayucolor="mirage"
    endif

    colorscheme ayu
endfunction

function! s:Quantum()
    let g:quantum_italics=1
    colorscheme quantum
endfunction

function! s:Dracula()
    colorscheme dracula
endfunction

function! s:Solarized()
    if s:colorType == 'light'
        set background=light
    else
        set background=dark
        let g:airline_theme='atomic'
    endif
    colorscheme solarized
endf

function! s:OneDark()
    let g:onedark_terminal_italics = 1
    colorscheme onedark
endfunction

function! s:OceanicMaterial()
    set background=dark
    colorscheme oceanic_material
    let g:airline_theme='bubblegum'
endfunction

fun! s:Elly()
    colorscheme elly
    let g:airline_theme='elly'
endf

fun! s:Janah()
    colorscheme janah
    let g:airline_theme='forest_night'
endf

let s:colorList = [
    \ function("<SID>Gruvbox"),
    \ function('<SID>ForestNight'),
    \ function("<SID>Xcode"),
    \ function('<SID>Ayu'),
    \ function('<SID>Palenight'),
    \ function('<SID>Dracula'),
    \ function('<SID>Quantum'),
    \ function('<SID>Solarized'),
    \ function('<SID>OneDark'),
    \ function('<SID>OceanicMaterial'),
    \ function('<SID>Elly'),
    \ function('<SID>Janah'),
    \ ]

" let s:target = s:colorList[0]
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
