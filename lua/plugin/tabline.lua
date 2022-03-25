local tabby = require("tabby")
local presets = require("tabby.presets")

tabby.setup({
	tabline = presets.active_wins_at_tail,
	opt = {
		show_at_least = 2,
	},
})

local keymap = require("user.keymap")
keymap.map("n", "<F2>", ":TabRename ", keymap.empty_opts)
