-- :help nvim-tree.disable_netrw
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--- @param os string
local function has(os)
	return vim.fn.has(os) == 1
end

if has("win32") or has("win64") then
	vim.g.os = "win"
elseif has("mac") then
	vim.g.os = "mac"
elseif has("wsl") then
	vim.g.os = "wsl"
else
	vim.g.os = "linux"
end
