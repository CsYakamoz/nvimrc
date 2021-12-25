vim.cmd [[
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
]]

require "user.option"
require "user.keymap"
require "user.plugin"
require "user.colorscheme"
require "user.nvim-tree"
require "user.lualine"
require "user.treesitter"
require "user.indentline"
require "user.alpha"
require "user.telescope"
require "user.bufferline"
require "user.gitsigns"
require "user.impatient"
require "user.toggleterm"
require "user.neoscroll"
require "user.oscyank"
require "user.linediff"
require "user.neogen"
require "user.headlines"
require "user.autopairs"
require "user.wilder"
require "user.easy-align"
require "user.hlslens"
require "user.which-key"
