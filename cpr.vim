let s:cpr_config = {
    \ }

let s:cpr_option_list = ['alpha', 'beta']
let s:cpr_current_target = 'alpha'

function! s:Reset(item)
    let s:cpr_current_target = a:item
endfunction

function! g:CpRReset()
    call fzf#run({
    \   'source': s:cpr_option_list,
    \   'sink': function('<SID>Reset')
    \   'window': 'call CreateCenteredFloatingWindow()' 
    \ })
endfunction

function! CpR()
    let l:root = getcwd()
    if has_key(s:cpr_config, l:root)
        let l:file = expand('%') 
        let l:relative_path = fnamemodify(expand("%"), ":~:.")

        let l:target = s:cpr_config[l:root][s:cpr_current_target]

        let l:remote_path = l:target['dir'] . '/' . l:relative_path
        let l:ssh = l:target['user'] . '@' . l:target['addr']

        let l:command = "scp " . l:file . " " . l:ssh . ':' . l:remote_path
        call system(command)

        echo 'Successfully copy the file to remote server with id(' . s:cpr_current_target . ')'
    else
        echo 'no config for this project(' . l:root . ')'
    endif
endfunction

