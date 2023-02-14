local hlslens = require("hlslens")

hlslens.setup({
	nearest_only = true,
	override_lens = function(render, plist, nearest, idx, r_idx)
		local sfw = vim.v.searchforward == 1
		local indicator, text, chunks
		local abs_r_idx = math.abs(r_idx)
		if abs_r_idx > 1 then
			indicator = ("%d%s"):format(abs_r_idx, sfw ~= (r_idx > 1) and "▲" or "▼")
		elseif abs_r_idx == 1 then
			indicator = sfw ~= (r_idx == 1) and "▲" or "▼"
		else
			indicator = ""
		end

		local lnum, col = unpack(plist[idx])
		if nearest then
			local cnt = #plist
			if indicator ~= "" then
				text = ("[%s %d/%d]"):format(indicator, idx, cnt)
			else
				text = ("[%d/%d]"):format(idx, cnt)
			end
			chunks = { { " ", "Ignore" }, { text, "HlSearchLensNear" } }
		else
			text = ("[%s %d]"):format(indicator, idx)
			chunks = { { " ", "Ignore" }, { text, "HlSearchLens" } }
		end
		render.set_virt(0, lnum - 1, col - 1, chunks, nearest)
	end,
})

local keymap = require("user.keymap")
local map = keymap.set
local opts = keymap.opts

local call_hlslens = "<Cmd>lua require('hlslens').start()<CR>"

-- Remap search mapping, ref: lua/user/keymap.lua
map("n", "n", "<Cmd>execute('normal! ' . v:count1 . 'nzzzv')<CR>" .. call_hlslens, opts)
map("n", "N", "<Cmd>execute('normal! ' . v:count1 . 'Nzzzv')<CR>" .. call_hlslens, opts)
map("n", "*", "/\\<<C-R>=expand('<cword>')<CR>\\><CR>" .. call_hlslens, opts)
map("n", "#", "?\\<<C-R>=expand('<cword>')<CR>\\><CR>" .. call_hlslens, opts)
map("v", "*", "y/\\V<C-R>=escape(@\",'/\\')<CR><CR>" .. call_hlslens, opts)
map("n", "z/", ":let @/='\\<<C-R>=expand(\"<cword>\")<CR>\\>'<CR>:set hls<CR>" .. call_hlslens, opts)
vim.cmd([[
function! RangeSearch(direction)
	call inputsave()
	let g:srchstr = input(a:direction)
	call inputrestore()
	if strlen(g:srchstr) > 0
		let g:srchstr = g:srchstr.
			\ '\%>'.(line("'<")-1).'l'.
			\ '\%<'.(line("'>")+1).'l'
	else
		let g:srchstr = ''
	endif
endfunction
vnoremap <silent> / :<C-U>call RangeSearch('/')<CR>:if strlen(g:srchstr) > 0\|exec '/'.g:srchstr\|endif<CR><Cmd>lua require('hlslens').start()<CR>
vnoremap <silent> ? :<C-U>call RangeSearch('?')<CR>:if strlen(g:srchstr) > 0\|exec '?'.g:srchstr\|endif<CR><Cmd>lua require('hlslens').start()<CR>
]])
