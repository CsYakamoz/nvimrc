local keymap = require("user.keymap")
local path = require("plenary.path")
local nvim_tree = require("nvim-tree")

keymap.set("n", "<F4>", ":NvimTreeFindFile<CR>", keymap.opts)
keymap.set("n", "<M-4>", ":NvimTreeFindFile<CR>", keymap.opts)

local function resize()
	local wider = 1 - (vim.g.cs_nvim_tree_resize or 0)

	local columns = vim.o.columns
	local col = math.floor(columns * 0.17)
	if wider == 1 then
		col = math.floor(vim.o.columns / 3)
	end

	nvim_tree.resize(col)
	vim.api.nvim_set_var("cs_nvim_tree_resize", wider)
end

local function getDir(node)
	local dir = node["absolute_path"]
	local isDir = node["fs_stat"]["type"] == "directory"

	if not isDir then
		dir = path.new(dir):parent().filename
	end

	return dir
end

local function search_text(node)
	local dir = getDir(node)
	print(type(dir))
	vim.cmd([[Telescope live_grep cwd=]] .. dir)
end

local function search_file(node)
	local dir = getDir(node)
	vim.cmd([[Telescope find_files cwd=]] .. dir)
end

local mapping_list = {
	{ key = "x", action = "close_node" },
	{ key = "X", action = "collapse_all" },
	{ key = "<C-r>", action = "refresh" },
	{ key = "C", action = "cd" },
	{ key = "u", action = "dir_up" },

	{ key = { "o", "<CR>" }, action = "edit" },
	{ key = { "<C-s>", "<C-w><C-s>" }, action = "split" },
	{ key = { "<C-v>", "<C-w><C-v>" }, action = "vsplit" },
	{ key = { "<C-t>", "<C-w><C-t>" }, action = "tabnew" },

	{ key = "p", action = "parent_node" },
	{ key = "<C-k>", action = "prev_sibling" },
	{ key = "<C-j>", action = "next_sibling" },
	{ key = "K", action = "first_sibling" },
	{ key = "J", action = "last_sibling" },

	{ key = "a", action = "create" },
	{ key = "dd", action = "trash" },
	{ key = "c", action = "copy" },
	{ key = "<Leader>x", action = "cut" },
	{ key = "<Leader>p", action = "paste" },
	{ key = "r", action = "rename" },
	{ key = ".", action = "run_file_command" },

	{ key = "y", action = "copy_name" },
	{ key = "Y", action = "copy_path" },
	{ key = "gy", action = "copy_absolute_path" },

	{ key = "[c", action = "prev_git_item" },
	{ key = "]c", action = "next_git_item" },

	{ key = "I", action = "toggle_ignored" },
	{ key = "H", action = "toggle_dotfiles" },
	{ key = "U", action = "toggle_custom" },
	{ key = "g?", action = "toggle_help" },

	{ key = "<Tab>", action = "preview" },
	{ key = "<Leader>o", action = "system_open" },

	{ key = "<C-a>", action = "resize", action_cb = resize },
	{ key = "<Leader>sg", action = "search_text", action_cb = search_text },
	{ key = "<Leader>sf", action = "search_file", action_cb = search_file },

	{ key = "f", action = "live_filter" },
	{ key = "F", action = "clear_live_filter" },
}

nvim_tree.setup({
	hijack_netrw = false,
	sync_root_with_cwd = true,
	filters = {
		custom = { "vendor", "node_modules" },
	},
	view = {
		width = "17%",
		preserve_window_proportions = true,
		mappings = {
			custom_only = true,
			list = mapping_list,
		},
		signcolumn = "no",
	},
	actions = {
		open_file = {
			window_picker = {
				chars = "ASDHJKL",
			},
		},
	},
	renderer = {
		highlight_git = true,
		group_empty = true,
		full_name = true,
		icons = {
			glyphs = {
				git = {
					staged = "Ꮥ",
					untracked = "Ü",
				},
			},
		},
	},
	trash = {
		cmd = "trash-put",
	},
})
