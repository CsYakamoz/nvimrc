local set = function(mode, l, r, opts)
	opts = opts or {}
	vim.keymap.set(mode, l, r, opts)
end

local merge = function(desc, opt)
	opt = opt or {}
	if type(desc) == "string" then
		opt.desc = desc
	end

	return opt
end

local silent_opts = function(desc, opt)
	return vim.tbl_deep_extend("force", { silent = true }, merge(desc, opt))
end

local opts = function(desc, opt)
	return vim.tbl_deep_extend(
		"force",
		{ noremap = true, silent = true },
		merge(desc, opt)
	)
end

--Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = 'n',
--   insert_mode = 'i',
--   visual_mode = 'v',
--   visual_block_mode = 'x',
--   term_mode = 't',
--   command_mode = 'c',

-- Hobby
set("n", "<Leader>w", ":w<CR>", opts("Save"))
set("n", "<Leader>q", ":q<CR>", opts("Quit"))
set("n", "<Leader>Q", ":qa<CR>", opts("Quit All"))
set("n", "<Leader><BackSpace>", ":nohl<CR>", opts("No HlSearch"))
set("v", "gl", "g_", opts("Jump To End"))
set("v", "gh", "^", opts("Jump to First Non Blank Char"))

-- Start Insert mode when press <C-h> in Select mode, ref: coc-snippets
set("s", "<C-h>", "<C-g>c", opts("Delete Selected Text"))

-- Avoid to start ex mode
set("n", "Q", "<Nop>", opts())

-- Ctrl-c doesn't trigger the InsertLeave autocmd . map to <ESC> instead
-- map("i", "<C-c>", "<Esc>", opts())
-- Force myself to use <C-[> in insert mode
set("i", "<C-c>", "<Nop>", opts())

-- Deprecated: Like j,k in normal mode
set("i", "<C-k>", "<Nop>")
set("i", "<C-j>", "<Nop>")

-- Focus the current split: https://www.reddit.com/r/vim/comments/5civsq/is_there_a_way_to_focus_the_current_split/
set("n", "<Leader>z", ":tab split<CR>", opts("Focus the current split"))

-- Yarn to system, paste from system
set("v", "<Leader>y", '"+y', opts("Yarn to System"))
set("n", "<Leader>p", '"+p', opts("Paste from System"))
set("v", "<Leader>p", '"+p', opts("Paste from System"))

-- Bring search results to midscreen: https://www.reddit.com/r/vim/comments/oyqkkd/your_most_frequently_used_mapping/
set("n", "n", "nzzzv", opts())
set("n", "N", "Nzzzv", opts())

-- Easily switch tab
set("n", "<C-n>", "gt", opts("Next Tab"))
set("n", "<C-p>", "gT", opts("Previous Tab"))

-- See unimpaired.vim
set("n", "]q", ":cnext<CR>", opts("cnext"))
set("n", "[q", ":cprevious<CR>", opts("cprevious"))
set(
	"n",
	"]e",
	":<c-u>execute 'move +'. v:count1<cr>",
	opts("move line to previous")
)
set(
	"n",
	"[e",
	":<c-u>execute 'move -1-'. v:count1<cr>",
	opts("move line to next")
)
set("n", "]ow", ":set wrap!<CR>", opts("toggle wrap option"))
set("n", "[ow", ":set wrap!<CR>", opts("toggle wrap option"))
set("n", "]op", ":set paste!<CR>", opts("toggle paste option"))
set("n", "[op", ":set paste!<CR>", opts("toggle paste option"))

-- Better window navigation
set("n", "<C-h>", "<C-w>h", opts())
set("n", "<C-j>", "<C-w>j", opts())
set("n", "<C-k>", "<C-w>k", opts())
set("n", "<C-l>", "<C-w>l", opts())

-- Don't lose selection when shifting sidewards: https://github.com/mhinz/vim-galore#dont-lose-selection-when-shifting-sidewards
set("v", "<", "<gv", opts())
set("v", ">", ">gv", opts())

-- Do NOT rewrite register after paste: https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
set("v", "p", 'p:let @"=@0<CR>', opts())
set("v", "P", 'P:let @"=@0<CR>', opts())

-- Quickly add empty lines: https://github.com/mhinz/vim-galore#quickly-add-empty-lines
set(
	"n",
	"<Leader>o",
	":<C-u>put =repeat(nr2char(10), v:count1)<CR>",
	opts("Add a new line below the current line")
)
set(
	"n",
	"<Leader>O",
	":<C-u>put! =repeat(nr2char(10), v:count1)<CR>'[",
	opts("Add new line above the current line")
)

-- Search for visually selected text: https://vim.fandom.com/wiki/Search_for_visually_selected_text
set("v", "*", "y/\\V<C-R>=escape(@\",'/\\')<CR><CR>", opts())

-- Search only over a visual range: https://vim.fandom.com/wiki/Search_only_over_a_visual_range
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
vnoremap <silent> / :<C-U>call RangeSearch('/')<CR>:if strlen(g:srchstr) > 0\|exec '/'.g:srchstr\|endif<CR>
vnoremap <silent> ? :<C-U>call RangeSearch('?')<CR>:if strlen(g:srchstr) > 0\|exec '?'.g:srchstr\|endif<CR>
]])

-- Search current word: https://vim.fandom.com/wiki/Searching#Case_sensitivity
set("n", "*", "/\\<<C-R>=expand('<cword>')<CR>\\><CR>", opts())
set("n", "#", "?\\<<C-R>=expand('<cword>')<CR>\\><CR>", opts())

-- Highlight matches without moving: https://vim.fandom.com/wiki/Highlight_all_search_pattern_matches#Highlight_matches_without_moving
set(
	"n",
	"z/",
	":let @/='\\<<C-R>=expand(\"<cword>\")<CR>\\>'<CR>:set hls<CR>",
	opts("Highlight Current word")
)

-- reference: https://www.reddit.com/r/vim/comments/ksix5c/replacing_text_my_favorite_remap/
set(
	"n",
	"<Leader>rw",
	":%s/\\<<C-r><C-w>\\>//g<Left><Left><C-r><C-w>",
	{ noremap = true }
)

return {
	silent_opts = silent_opts,
	opts = opts,
	set = set,
}
