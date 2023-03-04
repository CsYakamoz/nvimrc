-- :help nvim-tree.disable_netrw
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
	vim.g.os = "win"
elseif vim.fn.has("mac") == 1 then
	vim.g.os = "mac"
else
	vim.g.os = "linux"
end
