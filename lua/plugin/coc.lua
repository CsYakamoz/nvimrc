vim.g.coc_global_extensions = {
	"coc-word",
	"coc-spell-checker",
	"coc-snippets",
	"coc-eslint",
	"coc-prettier",
	"coc-json",
	"coc-tsserver",
	"coc-clangd",
	"coc-diagnostic",
	"coc-go",
}

vim.cmd([[
inoremap <silent><expr> <TAB>
	\ coc#pum#visible() ? coc#_select_confirm() :
	\ coc#expandableOrJumpable() ?
	\ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
	\ CocCheckBackSpace() ? "\<TAB>" :
	\ coc#refresh()

function! CocCheckBackSpace() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<Tab>'
let g:coc_snippet_prev = '<S-Tab>'

" Use K to show documentation in preview window.
nnoremap <silent> K :call CocShowDocumentation()<CR>
function! CocShowDocumentation()
	if CocAction('hasProvider', 'hover')
		call CocActionAsync('doHover')
	else
		call feedkeys('K', 'in')
	endif
endfunction

nmap <leader>rn <Plug>(coc-rename)
nmap <leader>rf <Plug>(coc-refactor)

nmap <silent> gd :Telescope coc definitions<CR>
nmap <silent> <leader>gi :Telescope coc implementations<CR>
nmap <silent> gr :Telescope coc references<CR>

nmap <silent> <Leader>f :call CocAction('format')<CR>
xmap <silent> <Leader>f  <Plug>(coc-format-selected)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use `[d` and `]d` to navigate diagnostics
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

augroup CocGroup
	autocmd!
	" Setup formatexpr specified filetype(s).
	autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	" Update signature help on jump placeholder.
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

let g:coc_disable_transparent_cursor=1

"see :help coc-completion
inoremap <silent><expr> <C-e> coc#pum#visible() ?
		\ coc#pum#cancel() :
		\ col('.') > strlen(getline('.')) ? "\<C-e>" : "\<End>"

inoremap <silent><expr> <C-n> coc#pum#visible() ? coc#pum#next(1) : "\<Down>"
inoremap <silent><expr> <C-p> coc#pum#visible() ? coc#pum#prev(1) : "\<Up>"
]])
