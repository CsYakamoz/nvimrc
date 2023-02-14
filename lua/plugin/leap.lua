local keymap = require("user.keymap")

keymap.map(
	{ "n", "v", "o" },
	",",
	"<Plug>(leap-forward-to)",
	keymap.silent_opts
)

keymap.map(
	{ "n", "v", "o" },
	"<leader>,",
	"<Plug>(leap-backward-to)",
	keymap.silent_opts
)
