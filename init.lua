--- @param path string module path
local function safe_require(path)
	local ok, _ = pcall(require, path)
	if ok then
		return
	end

	print(
		string.format(
			"%s/%s.lua is not exist",
			vim.fn.stdpath("config"),
			path:gsub("%.", "/")
		)
	)
end

safe_require("user.local-specific")

require("user.global")
require("user.option")
require("user.abbr")
require("user.autocmd")
require("user.keymap")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("user.plugin")

safe_require("user.colorscheme.color")

require("user.input-method")
require("user.move-tab")
