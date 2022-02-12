local tabby = require("tabby")
local presets = require("tabby.presets")

tabby.setup({
	tabline = presets.tab_only,
})

-- TODO: update after supporting the feature
-- https://github.com/nanozuki/tabby.nvim/issues/32
vim.o.showtabline = 1

local keymap = require("user.keymap")
keymap.map("n", "<F2>", ":TabRename ", keymap.empty_opts)
