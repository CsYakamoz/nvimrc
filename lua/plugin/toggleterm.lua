local toggleterm = require("toggleterm")

toggleterm.setup({
	open_mapping = [[<M-j>]],
	start_in_insert = true,
	direction = "float",
	float_opts = {
		border = "curved",
		winblend = 0,
	},
})

vim.cmd([[
function! s:CD()
	let path = expand('%:p:h')
	if !isdirectory(path)
        echo 'path does not exist or is not a directory: ' . path
        return
    endif

	execute 'ToggleTerm dir=' . path . ' direction=float'
endfunction

command! -nargs=0 CD :call <SID>CD()
]])
