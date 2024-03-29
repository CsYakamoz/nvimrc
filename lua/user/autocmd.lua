vim.cmd([[
augroup _general_settings
    autocmd!
	autocmd BufReadPost *
		\ if line("'\"") > 1 && line("'\"") <= line("$") |
		\   exe "normal! g`\"" |
		\ endif

    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=500}

    autocmd FileType qf set nobuflisted
augroup end
]])
