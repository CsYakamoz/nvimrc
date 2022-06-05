vim.cmd([[
try
	let g:everforest_enable_italic = 1
    colorscheme everforest
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
endtry
]])
