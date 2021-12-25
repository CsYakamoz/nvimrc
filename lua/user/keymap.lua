local M = {}
local empty_opts = {}
local silent_opts = { silent = true }
local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap
local bmap = vim.api.nvim_buf_set_keymap

M.empty_opts = empty_opts
M.silent_opts = silent_opts
M.opts = opts
M.map = map
M.bmap = bmap

--Remap space as leader key
map('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Modes
--   normal_mode = 'n',
--   insert_mode = 'i',
--   visual_mode = 'v',
--   visual_block_mode = 'x',
--   term_mode = 't',
--   command_mode = 'c',

-- Hobby
map('n', '<Leader>w', ':w<CR>', opts)
map('n', '<Leader>q', ':q<CR>', opts)
map('n', '<Leader>Q', ':qa<CR>', opts)
map('n', '<Leader><BackSpace>', ':nohl<CR>', opts)

-- Avoid to start ex mode
map('n', 'Q', '<Nop>', opts)

-- Ctrl-c doesn't trigger the InsertLeave autocmd . map to <ESC> instead
map('i', '<C-c>', '<Esc>', opts)

-- Like j,k in normal mode
map('i', '<C-k>', '<Up>', empty_opts)
map('i', '<C-j>', '<Down>', empty_opts)

-- Focus the current split: https://www.reddit.com/r/vim/comments/5civsq/is_there_a_way_to_focus_the_current_split/
map('n', '<Leader>z', ':tab split<CR>', opts)

-- Yarn to system, paste from system
map('v', '<Leader>y', '"+y', opts)
map('n', '<Leader>p', '"+p', opts)
map('v', '<Leader>p', '"+p', opts)

-- Bring search results to midscreen: https://www.reddit.com/r/vim/comments/oyqkkd/your_most_frequently_used_mapping/
map('n', 'n', 'nzzzv', opts)
map('n', 'N', 'Nzzzv', opts)

-- Easily switch tab
map('n', '<C-n>', 'gt', opts)
map('n', '<C-p>', 'gT', opts)

-- Unimpaired.vim
map('n', ']q', ':cnext<CR>', opts)
map('n', '[q', ':cprevious<CR>', opts)
map('n', ']ow', ':set wrap!<CR>', opts)
map('n', '[ow', ']ow', empty_opts)
map('n', ']op', ':set paste!<CR>', opts)
map('n', '[op', ']op', empty_opts)

-- Better window navigation
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- Don't lose selection when shifting sidewards: https://github.com/mhinz/vim-galore#dont-lose-selection-when-shifting-sidewards
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

-- Do NOT rewrite register after paste: https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
map('v', 'p', 'p:let @"=@0<CR>', opts)
map('v', 'P', 'P:let @"=@0<CR>', opts)

-- Quickly add empty lines: https://github.com/mhinz/vim-galore#quickly-add-empty-lines
map('n', '<Leader>o', ':<C-u>put =repeat(nr2char(10), v:count1)<CR>', opts)
map('n', '<Leader>O', ":<C-u>put! =repeat(nr2char(10), v:count1)<CR>'[", opts)

-- Search for visually selected text: https://vim.fandom.com/wiki/Search_for_visually_selected_text
map('v', '*', "y/\\V<C-R>=escape(@\",'/\\')<CR><CR>", opts) 

-- Search current word: https://vim.fandom.com/wiki/Searching#Case_sensitivity
map('n', '*', "/\\<<C-R>=expand('<cword>')<CR>\\><CR>", opts)
map('n', '#', "?\\<<C-R>=expand('<cword>')<CR>\\><CR>", opts)

-- Highlight matches without moving: https://vim.fandom.com/wiki/Highlight_all_search_pattern_matches#Highlight_matches_without_moving
map('n', 'z/', ":let @/='\\<<C-R>=expand(\"<cword>\")<CR>\\>'<CR>:set hls<CR>", opts)

return M
