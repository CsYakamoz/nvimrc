local keymap = require("user.keymap")

vim.g.cycle_no_mappings = 1
keymap.map("n", "<Plug>CycleFallbackNext", "<C-A>", keymap.opts)
keymap.map("n", "<Plug>CycleFallbackPrev", "<C-X>", keymap.opts)
keymap.map("n", "<C-a>", "<Plug>CycleNext", keymap.silent_opts)
keymap.map("n", "<C-x>", "<Plug>CyclePrev", keymap.silent_opts)

vim.cmd([[
let g:cycle_default_groups = [
    \   [ [',', '，'] ],
    \   [ ['.', '。'] ],
    \   [ ['?', '？'] ],
    \   [ [';', '；'] ],
    \   [ [':', '：'] ],
    \   [ ['(:)', '[:]', '{:}'], 'sub_pairs'],
    \   [ ['++', '--'] ],
    \   [ ['+', '-'] ],
    \   [ ['>', '<'] ],
    \   [ ['>=', '<='] ],
    \   [ ['||', '&&'] ],
    \   [ ['===', '!=='] ],
    \   [ ['==', '!='] ],
    \   [ ['true', 'false'] ],
    \   [ ['yes', 'no'] ],
    \   [ ['on', 'off'] ],
    \   [ ['and', 'or'] ],
    \   [ ["in", "out"] ],
    \   [ ["increase", "decrease"] ],
    \   [ ["up", "down"] ],
    \   [ ["min", "max"] ],
    \   [ ["get", "set"] ],
    \   [ ["add", "remove"] ],
    \   [ ["to", "from"] ],
    \   [ ["read", "write"] ],
    \   [ ["only", "except"] ],
    \   [ ['without', 'with'] ],
    \   [ ["exclude", "include"] ],
    \   [ ["asc", "desc"] ],
    \   [ ["begin", "end"] ],
    \   [ ["first", "last"] ],
    \   [ ["slow", "fast"] ],
    \   [ ["small", "large"] ],
    \   [ ["push", "pull"] ],
    \   [ ["before", "after"] ],
    \   [ ["new", "delete"] ],
    \   [ ["while", "until"] ],
    \   [ ["left", "right"] ],
    \   [ ["top", "bottom"] ],
    \   [ ["prefix", "suffix"] ],
    \   [ ["allow", "deny"] ],
    \   [ ["light", "dark"] ],
    \   [ ["public", "protected", "private"] ],
    \   [ ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten"] ],
    \   [
    \       ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'],
    \       'hard_case', {'name': 'Days'}
    \   ],
    \   [
    \       ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
    \       'hard_case', {'name': 'Months'}
    \   ],
    \ ]

let g:cycle_default_groups_for_javascript = [
    \ [ ['var', 'let', 'const'] ],
    \ ]
]])
