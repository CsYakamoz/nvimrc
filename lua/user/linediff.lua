local keymap = require('user.keymap')

keymap.map('n', '<Leader>l', ':Linediff<CR>', keymap.opts)
keymap.map('x', '<Leader>l', ':Linediff<CR>', keymap.opts)
