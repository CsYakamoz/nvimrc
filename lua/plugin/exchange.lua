local keymap = require("user.keymap")

vim.g.exchange_no_mappings = 1
keymap.set("x", "<C-x>", "<Plug>(Exchange)")
