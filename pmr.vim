let s:pmr_option = {
    \ }
let s:pmr_current_target = "alpha"

function! s:Reset(item)
    let s:pmr_current_target = a:item
endfunction

function! g:PmRReset() 
    call fzf#run({
    \   'source': keys(s:pmr_option),
    \   'sink': function('<SID>Reset'),
    \   'window': 'call CreateCenteredFloatingWindow()' 
    \ })
endfunction

function! s:PmRExec(item) 
    let l:target = s:pmr_option[s:pmr_current_target]
    let l:command = 'ssh ' . l:target['user'] . '@' . l:target['addr'] . ' pm2 restart ' . a:item
    call system(command)
    echo 'Successfully restart ' . a:item
endfunction

function! PmR()
    let l:target = s:pmr_option[s:pmr_current_target]
    let l:command = 'ssh ' . l:target['user'] . '@' . l:target['addr'] . " pm2 ls | awk '{print $2}' | grep -E '[^(App)|\s+|(`pm2)]'"
    call fzf#run({
    \   'source': l:command,
    \   'sink': function('<SID>PmRExec'),
    \   'options': '--multi',
    \   'window': 'call CreateCenteredFloatingWindow()' 
    \ })
endfunction

