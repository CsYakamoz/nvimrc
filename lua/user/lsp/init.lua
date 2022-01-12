require("user.lsp.lsp-installer")
require("user.lsp.handlers").setup()
require("user.lsp.null_ls")

local keymap = require("user.keymap")

keymap.map("n", "<Leader>f", ":lua vim.lsp.buf.formatting()<CR>", keymap.opts)
keymap.map("v", "<Leader>f", ":lua vim.lsp.buf.range_formatting()<CR>", keymap.opts)
