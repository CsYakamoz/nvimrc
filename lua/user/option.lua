local optionList = {
	mouse = "",
	wrap = false,
	number = true,
	hidden = true,
	swapfile = false,
	autoread = true,
	jumpoptions = "stack",
	timeoutlen = 400,

	-- appearance
	background = "light", -- default to light, and may be overwritten in lua/user/colorscheme/color.lua
	termguicolors = true,
	cursorline = true,
	-- This comment is copied from ESLint
	-- Very long lines of code in any language can be difficult to read.
	-- In order to aid in readability and maintainability
	-- Many coders have developed a convention to limit lines of code to X number of characters
	-- (traditionally 80 characters).
	colorcolumn = { 80, 120 }, -- help me checking the line
	signcolumn = "yes",
	synmaxcol = 300,

	-- work with listchars(see below)
	list = true,

	-- fold
	foldmethod = "indent",
	foldlevelstart = 10,

	-- match
	showmatch = true,
	matchtime = 1,

	-- undo
	undofile = true,
	undodir = vim.fn.stdpath("config") .. "/.undo",

	-- scrolloff
	scrolloff = 3,
	sidescrolloff = 3,

	-- search
	hlsearch = true,
	ignorecase = true,
	smartcase = true,

	-- tab
	tabstop = 4,
	shiftwidth = 4,
	softtabstop = 4,
	expandtab = true,
	shiftround = true,
	smartindent = true,

	-- split
	splitright = true,
	splitbelow = true,

	-- advised by coc
	backup = false,
	writebackup = false,
	updatetime = 300,

	-- replace
	inccommand = "split",
}

for k, v in pairs(optionList) do
	vim.opt[k] = v
end

vim.opt.listchars = { extends = ">", tab = "▸ ", trail = "·" }
