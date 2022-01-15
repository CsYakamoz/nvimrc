require("plugin.lsp.lsp-installer")
require("plugin.lsp.handlers").setup()
require("plugin.lsp.null_ls")

local keymap = require("user.keymap")

keymap.map("n", "<Leader>f", ":lua vim.lsp.buf.formatting()<CR>", keymap.opts)
keymap.map("v", "<Leader>f", ":lua vim.lsp.buf.range_formatting()<CR>", keymap.opts)
