local keymap = require("user.keymap")

local nvim_tree = require("nvim-tree")
local api = require("nvim-tree.api")

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

local function get_dir(node)
	local dir = node.absolute_path
	local isDir = node.fs_stat.type == "directory"

	if not isDir then
		dir = vim.fn.fnamemodify(dir, ":h")
	end

	return dir
end

local function search_text()
	local node = api.tree.get_node_under_cursor()
	local dir = get_dir(node)

	require("telescope.builtin").live_grep({ cwd = dir })
end

local function search_file()
	local node = api.tree.get_node_under_cursor()
	local dir = get_dir(node)

	require("telescope.builtin").find_files({ cwd = dir })
end

-- Migrating To on_attach: https://github.com/nvim-tree/nvim-tree.lua/wiki/Migrating-To-on_attach
local on_attach = function(bufnr)
	local opts = function(desc)
		return {
			desc = "nvim-tree: " .. desc,
			buffer = bufnr,
			noremap = true,
			silent = true,
			nowait = true,
		}
	end

	-- open
	vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
	vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
	vim.keymap.set("n", "O", api.tree.expand_all, opts("Expand All"))

	-- close
	vim.keymap.set(
		"n",
		"x",
		api.node.navigate.parent_close,
		opts("Close Directory")
	)
	vim.keymap.set("n", "X", api.tree.collapse_all, opts("Collapse"))

	-- refresh
	vim.keymap.set("n", "<C-r>", api.tree.reload, opts("Refresh"))

	-- change root
	vim.keymap.set("n", "C", api.tree.change_root_to_node, opts("CD"))
	vim.keymap.set("n", "u", api.tree.change_root_to_parent, opts("Up"))

	-- where to open file
	vim.keymap.set(
		"n",
		"<C-s>",
		api.node.open.horizontal,
		opts("Open: Horizontal Split")
	)
	vim.keymap.set(
		"n",
		"<C-w><C-s>",
		api.node.open.horizontal,
		opts("Open: Horizontal Split")
	)
	vim.keymap.set(
		"n",
		"<C-v>",
		api.node.open.vertical,
		opts("Open: Vertical Split")
	)
	vim.keymap.set(
		"n",
		"<C-w><C-v>",
		api.node.open.vertical,
		opts("Open: Vertical Split")
	)
	vim.keymap.set("n", "<C-t>", api.node.open.tab, opts("Open: New Tab"))
	vim.keymap.set("n", "<C-w><C-t>", api.node.open.tab, opts("Open: New Tab"))

	-- move cursor
	vim.keymap.set("n", "p", api.node.navigate.parent, opts("Parent Directory"))
	vim.keymap.set(
		"n",
		"<C-k>",
		api.node.navigate.sibling.prev,
		opts("Previous Sibling")
	)
	vim.keymap.set(
		"n",
		"<C-j>",
		api.node.navigate.sibling.next,
		opts("Next Sibling")
	)
	vim.keymap.set(
		"n",
		"K",
		api.node.navigate.sibling.first,
		opts("First Sibling")
	)
	vim.keymap.set("n", "J", api.node.navigate.sibling.last, opts("Last Sibling"))

	-- file operation
	vim.keymap.set("n", "a", api.fs.create, opts("Create"))
	vim.keymap.set("n", "dd", api.fs.trash, opts("Trash"))
	vim.keymap.set("n", "c", api.fs.copy.node, opts("Copy"))
	vim.keymap.set("n", "<Leader>x", api.fs.cut, opts("Cut"))
	vim.keymap.set("n", "<Leader>p", api.fs.paste, opts("Paste"))
	vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))

	-- copy name, relative_path, absolute_path
	vim.keymap.set("n", "y", api.fs.copy.filename, opts("Copy Name"))
	vim.keymap.set(
		"n",
		"Y",
		api.fs.copy.relative_path,
		opts("Copy Relative Path")
	)
	vim.keymap.set(
		"n",
		"gy",
		api.fs.copy.absolute_path,
		opts("Copy Absolute Path")
	)

	-- git
	vim.keymap.set("n", "[c", api.node.navigate.git.prev, opts("Prev Git"))
	vim.keymap.set("n", "]c", api.node.navigate.git.next, opts("Next Git"))

	-- toggle hidden file
	vim.keymap.set(
		"n",
		"I",
		api.tree.toggle_gitignore_filter,
		opts("Toggle Git Ignore")
	)
	vim.keymap.set(
		"n",
		"H",
		api.tree.toggle_hidden_filter,
		opts("Toggle Dotfiles")
	)
	vim.keymap.set("n", "U", api.tree.toggle_custom_filter, opts("Toggle Hidden"))

	-- utils
	vim.keymap.set("n", "g?", api.tree.toggle_help, opts("Help"))
	vim.keymap.set("n", "<Tab>", api.node.open.preview, opts("Open Preview"))
	vim.keymap.set("n", "<Leader>o", api.node.run.system, opts("Run System"))
	vim.keymap.set("n", ".", api.node.run.cmd, opts("Run Command"))

	-- filter
	vim.keymap.set("n", "f", api.live_filter.start, opts("Filter"))
	vim.keymap.set("n", "F", api.live_filter.clear, opts("Clean Filter"))

	-- diagnostic
	vim.keymap.set(
		"n",
		"[d",
		api.node.navigate.diagnostics.prev,
		opts("Prev Diagnostic")
	)
	vim.keymap.set(
		"n",
		"]d",
		api.node.navigate.diagnostics.next,
		opts("Next Diagnostic")
	)

	-- custom action
	vim.keymap.set("n", "<C-a>", resize, opts("Resize"))
	vim.keymap.set("n", "<Leader>sg", search_text, opts("Search Text"))
	vim.keymap.set("n", "<Leader>sf", search_file, opts("Search File"))
end

nvim_tree.setup({
	hijack_netrw = false,
	sync_root_with_cwd = true,
	on_attach = on_attach,
	filters = {
		custom = { "vendor", "node_modules" },
	},
	view = {
		width = "17%",
		preserve_window_proportions = true,
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
