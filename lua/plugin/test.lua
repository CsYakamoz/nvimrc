vim.cmd([[
let g:test#strategy = "neovim"

let test#go#gotest#options = {
\   'all':   '-v',
\ }
]])
