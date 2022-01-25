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
local nvim_tree_config = require("nvim-tree.config")

local tree_cb = nvim_tree_config.nvim_tree_callback

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
		width = 30,
		height = 30,
		hide_root_folder = false,
		side = "left",
		auto_resize = true,
		mappings = {
			custom_only = true,
			list = {
				{ key = "x", cb = tree_cb("close_node") },
				{ key = "<C-r>", cb = tree_cb("refresh") },
				{ key = "C", cb = tree_cb("cd") },
				{ key = "u", cb = tree_cb("dir_up") },

				{ key = "o", cb = tree_cb("edit") },
				{ key = "<CR>", cb = tree_cb("edit") },
				{ key = "i", cb = tree_cb("split") },
				{ key = "s", cb = tree_cb("vsplit") },
				{ key = "t", cb = tree_cb("tabnew") },

				{ key = "p", cb = tree_cb("parent_node") },
				{ key = "<C-k>", cb = tree_cb("prev_sibling") },
				{ key = "<C-j>", cb = tree_cb("next_sibling") },
				{ key = "K", cb = tree_cb("first_sibling") },
				{ key = "J", cb = tree_cb("last_sibling") },

				{ key = "a", cb = tree_cb("create") },
				{ key = "dd", cb = tree_cb("trash") },
				{ key = "c", cb = tree_cb("copy") },
				{ key = "<Leader>x", cb = tree_cb("cut") },
				{ key = "<Leader>p", cb = tree_cb("paste") },
				{ key = "r", cb = tree_cb("rename") },

				{ key = "y", cb = tree_cb("copy_name") },
				{ key = "Y", cb = tree_cb("copy_path") },
				{ key = "gy", cb = tree_cb("copy_absolute_path") },

				{ key = "[c", cb = tree_cb("prev_git_item") },
				{ key = "]c", cb = tree_cb("next_git_item") },

				{ key = "I", cb = tree_cb("toggle_ignored") },
				{ key = "H", cb = tree_cb("toggle_dotfiles") },
				{ key = "g?", cb = tree_cb("toggle_help") },

				{ key = "<Tab>", cb = tree_cb("preview") },
				{ key = "<Leader>o", cb = tree_cb("system_open") },
			},
		},
		number = false,
		relativenumber = false,
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
