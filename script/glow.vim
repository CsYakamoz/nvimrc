" TODO: being in normal mode when returning from another buffer
func! s:CsGlow(type) abort
    if &filetype != 'markdown'
        echo 'not a markdown file, ignore...'
        return
    endif

    " 1: floating
    " 2: normal
    if a:type == 1
        let optionList = [
            \ '--name=floaterm-glow-preview',
            \ '--title=floaterm-glow-preview',
            \ '--wintype=floating',
            \ '--position=center',
            \ '--width=0.99',
            \ '--height=0.99',
            \ ]
    elseif a:type == 2
        let optionList = [
            \ '--name=floaterm-glow-preview',
            \ '--title=floaterm-glow-preview',
            \ '--wintype=normal',
            \ '--position=right',
            \ '--width=0.5',
            \ ]
    else
        echo 'unknown type(' . a:type . ')'
        return
    endif

    execute 'FloatermNew ' . join(optionList, ' ') . ' glow %'
    stopinsert
    execute 'normal! gg'

    nnoremap <silent><buffer> q :FloatermKill floaterm-glow-preview<CR>
    nmap <silent><buffer> <Leader>q q
endf

command! -nargs=1 CsGlow :call <SID>CsGlow(<args>)
