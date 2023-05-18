local keymap = require("user.keymap")

keymap.set(
	{ "n", "v", "o" },
	"s",
	"<Plug>(leap-forward-to)",
	keymap.silent_opts("Leap Forward To")
)

keymap.set(
	{ "n", "v", "o" },
	"S",
	"<Plug>(leap-backward-to)",
	keymap.silent_opts("Leap Backward To")
)
