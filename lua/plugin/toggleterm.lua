local toggleterm = require("toggleterm")

toggleterm.setup({
	size = 20,
	open_mapping = [[<M-j>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "float",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})

local Terminal = require("toggleterm.terminal").Terminal

local node = Terminal:new({ cmd = "node", hidden = true })
function _NODE_TOGGLE()
	node:toggle()
end

local python = Terminal:new({ cmd = "python", hidden = true })
function _PYTHON_TOGGLE()
	python:toggle()
end

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