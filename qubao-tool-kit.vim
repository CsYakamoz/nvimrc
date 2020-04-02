let s:pmr_config = {
    \ }
let s:pmr_current_target = "alpha"

function! s:PReset(item)
    let s:pmr_current_target = a:item
endfunction

function! g:PmRReset() 
    call fzf#run({
    \   'source': keys(s:pmr_config),
    \   'sink': function('<SID>PReset'),
    \   'window': 'call CreateCenteredFloatingWindow()' 
    \ })
endfunction

function! s:PmRExec(item) 
    let l:target = s:pmr_config[s:pmr_current_target]
    let l:command = 'ssh ' . l:target['user'] . '@' . l:target['addr'] . ' pm2 restart ' . a:item
    call system(command)
    echo 'Successfully restart ' . a:item
endfunction

function! PmR()
    let l:target = s:pmr_config[s:pmr_current_target]
    let l:command = 'ssh ' . l:target['user'] . '@' . l:target['addr'] . " pm2 ls | awk '{print $2}' | grep -E '[^(App)|\s+|(`pm2)]'"
    call fzf#run({
    \   'source': l:command,
    \   'sink': function('<SID>PmRExec'),
    \   'options': '--multi',
    \   'window': 'call CreateCenteredFloatingWindow()' 
    \ })
endfunction


let s:cpr_config = {
    \ }
let s:cpr_option_list = ['alpha', 'beta', 'alpha3']
let s:cpr_current_target = 'alpha'

function! s:CReset(item)
    let s:cpr_current_target = a:item
endfunction

function! g:CpRReset()
    call fzf#run({
    \   'source': s:cpr_option_list,
    \   'sink': function('<SID>CReset'),
    \   'window': 'call CreateCenteredFloatingWindow()' 
    \ })
endfunction

function! CpR()
    let l:root = getcwd()
    if has_key(s:cpr_config, l:root) && has_key(s:cpr_config[l:root], s:cpr_current_target)
        let l:file = expand('%') 
        let l:relative_path = fnamemodify(expand("%"), ":~:.")

        let l:target = s:cpr_config[l:root][s:cpr_current_target]

        let l:remote_path = l:target['dir'] . '/' . l:relative_path
        let l:ssh = l:target['user'] . '@' . l:target['addr']

        let l:remote_dir = fnamemodify(l:remote_path, ':h')
        let l:mkdir_command = 'ssh ' . l:ssh . ' "mkdir -p ' . l:remote_dir . '"'
        call system(l:mkdir_command)

        let l:scp_command = "scp " . l:file . " " . l:ssh . ':' . l:remote_path
        call system(l:scp_command)

        echo 'Successfully copy the file(' . l:relative_path . ') to remote server with id(' . s:cpr_current_target . ')'
    else
        echo 'no config for this project(' . l:root . ')'
    endif
endfunction

