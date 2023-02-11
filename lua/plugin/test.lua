local keymap = require("user.keymap")
vim.g["test#strategy"] = "neovim"
vim.g["test#go#gotest#options"] = { all = "-v" }

keymap.map("n", "<F5>", ":TestFile<CR>", keymap.opts)
keymap.map("n", "<M-5>", ":TestFile<CR>", keymap.opts)

keymap.map("n", "<F6>", ":TestNearest<CR>", keymap.opts)
keymap.map("n", "<M-6>", ":TestNearest<CR>", keymap.opts)
