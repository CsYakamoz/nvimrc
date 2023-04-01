if vim.g.os == "mac" then
	return
end

vim.cmd([[
autocmd TextYankPost *
	\ if v:event.operator is 'y' && v:event.regname is '+' |
	\     execute 'OSCYankRegister +' |
	\ endif
]])
