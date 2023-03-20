local keymap = require("user.keymap")
local todo = require("todo-comments")

todo.setup({
	signs = false,
})

keymap.set("n", "]t", function()
	todo.jump_next()
end, keymap.opts("Next todo comment"))

keymap.set("n", "[t", function()
	todo.jump_prev()
end, keymap.opts("Previous todo comment"))
