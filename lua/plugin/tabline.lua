local tabby = require("tabby")
local presets = require("tabby.presets")

tabby.setup({
	tabline = presets.tab_only,
})

vim.cmd([[
cnoreabbrev tr TabRename
]])
