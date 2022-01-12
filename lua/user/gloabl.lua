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
