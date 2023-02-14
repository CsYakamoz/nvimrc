local tabby = require("tabby")
local presets = require("tabby.presets")

tabby.setup({
	tabline = presets.tab_only,
	opt = {
		show_at_least = 2,
	},
})

local keymap = require("user.keymap")
keymap.set("n", "<F2>", ":TabRename ")
