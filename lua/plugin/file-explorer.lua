vim.g.nvim_tree_icons = {
	default = "",
	symlink = "",
	git = {
		unstaged = "",
		staged = "S",
		unmerged = "",
		renamed = "➜",
		deleted = "",
		untracked = "U",
		ignored = "◌",
	},
	folder = {
		default = "",
		open = "",
		empty = "",
		empty_open = "",
		symlink = "",
	},
}

local nvim_tree = require("nvim-tree")

local mapping_list = {
	{ key = "x",         action = "close_node" },
	{ key = "<C-r>",     action = "refresh" },
	{ key = "C",         action = "cd" },
	{ key = "u",         action = "dir_up" },

	{ key = "o",         action = "edit" },
	{ key = "<CR>",      action = "edit" },
	{ key = "<C-s>",     action = "split" },
	{ key = "<C-v>",     action = "vsplit" },
	{ key = "<C-t>",     action = "tabnew" },

	{ key = "p",         action = "parent_node" },
	{ key = "<C-k>",     action = "prev_sibling" },
	{ key = "<C-j>",     action = "next_sibling" },
	{ key = "K",         action = "first_sibling" },
	{ key = "J",         action = "last_sibling" },

	{ key = "a",         action = "create" },
	{ key = "dd",        action = "trash" },
	{ key = "c",         action = "copy" },
	{ key = "<Leader>x", action = "cut" },
	{ key = "<Leader>p", action = "paste" },
	{ key = "r",         action = "rename" },

	{ key = "y",         action = "copy_name" },
	{ key = "Y",         action = "copy_path" },
	{ key = "gy",        action = "copy_absolute_path" },

	{ key = "[c",        action = "prev_git_item" },
	{ key = "]c",        action = "next_git_item" },

	{ key = "I",         action = "toggle_ignored" },
	{ key = "H",         action = "toggle_dotfiles" },
	{ key = "g?",        action = "toggle_help" },

	{ key = "<Tab>",     action = "preview" },
	{ key = "<Leader>o", action = "system_open" },
}

nvim_tree.setup({
	disable_netrw = false,
	hijack_netrw = false,
	open_on_setup = false,
	ignore_ft_on_setup = {
		"startify",
		"dashboard",
		"alpha",
	},
	auto_close = false,
	open_on_tab = false,
	hijack_cursor = false,
	update_cwd = true,
	update_to_buf_dir = {
		enable = true,
		auto_open = true,
	},
	update_focused_file = {
		enable = false,
		update_cwd = false,
		ignore_list = {},
	},
	system_open = {
		cmd = nil,
		args = {},
	},
	filters = {
		dotfiles = false,
		custom = { "vendor", "node_modules" },
	},
	git = {
		enable = true,
		ignore = true,
		timeout = 400,
	},
	view = {
		width = '17%',
		hide_root_folder = false,
		side = "left",
		auto_resize = true,
		mappings = {
			custom_only = true,
			list = mapping_list,
		},
		number = false,
		relativenumber = false,
		signcolumn = 'no',
	},
	trash = {
		cmd = "trash",
		require_confirm = true,
	},
	quit_on_open = 0,
	git_hl = 1,
	disable_window_picker = 0,
	root_folder_modifier = ":t",
	show_icons = {
		git = 1,
		folders = 1,
		files = 1,
		folder_arrows = 1,
		tree_width = 30,
	},
})

local keymap = require("user.keymap")

keymap.map("n", "<F4>", ":NvimTreeFindFile<CR>", keymap.opts)
keymap.map("n", "<M-4>", ":NvimTreeFindFile<CR>", keymap.opts)
