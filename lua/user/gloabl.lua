vim.cmd([[
let g:is_win = (has('win32') || has('win64')) ? v:true : v:false
let g:is_linux = (has('unix') && !has('macunix')) ? v:true : v:false
let g:is_mac = has('macunix') ? v:true : v:false

if g:is_mac
    let g:python3_host_prog='/usr/bin/python3'
elseif g:is_linux
    let g:python3_host_prog='/usr/bin/python3'
endif
]])

_G.project_files = function()
	vim.cmd([[
		silent! !git rev-parse --is-inside-work-tree
		if v:shell_error == 0
            execute 'Telescope git_files'
        else
            execute 'Telescope find_files'
        endif
	]])
end
