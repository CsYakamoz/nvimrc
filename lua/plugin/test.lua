vim.cmd([[
let g:test#strategy = "neovim"

let test#go#gotest#options = {
\   'all':   '-v',
\ }

nnoremap <silent> <F5> :TestFile<CR>
nnoremap <silent> <M-5> :TestFile<CR>
nnoremap <silent> <F6> :TestNearest<CR>
nnoremap <silent> <M-6> :TestNearest<CR>
]])
