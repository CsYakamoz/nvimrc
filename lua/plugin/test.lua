local keymap = require("user.keymap")
vim.g["test#strategy"] = "neovim"
vim.g["test#go#gotest#options"] = { all = "-v" }

keymap.set("n", "<F5>", ":TestFile<CR>", keymap.opts)
keymap.set("n", "<M-5>", ":TestFile<CR>", keymap.opts)

keymap.set("n", "<F6>", ":TestNearest<CR>", keymap.opts)
keymap.set("n", "<M-6>", ":TestNearest<CR>", keymap.opts)
