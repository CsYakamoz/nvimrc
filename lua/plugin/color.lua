local function dark_color()
	vim.o.background = "dark"

	vim.cmd([[
	try
		colorscheme kanagawa
	catch /^Vim\%((\a\+)\)\=:E185/
	    colorscheme default
	endtry
	]])
end

vim.api.nvim_create_user_command("CsDarkColor", dark_color, {})

local function light_color()
	vim.o.background = "light"
	vim.g.everforest_enable_italic = 1
	vim.g.everforest_better_performance = 1
	vim.g.everforest_diagnostic_text_highlight = 1

	vim.cmd([[
	try
		colorscheme everforest
	catch /^Vim\%((\a\+)\)\=:E185/
	    colorscheme default
	endtry
	]])
end

vim.api.nvim_create_user_command("CsLightColor", light_color, {})
