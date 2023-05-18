local configs = require("nvim-treesitter.configs")

local highlight_disabl_list = { "bash", "ini" }
local function whether_disable_highlight(lang, buf)
	for _, val in ipairs(highlight_disabl_list) do
		if lang == val then
			return true
		end
	end

	local max_filesize = 100 * 1024 -- 100 KB
	local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
	if ok and stats and stats.size > max_filesize then
		return true
	end
end

configs.setup({
	ensure_installed = "all",
	ignore_install = {}, -- List of parsers to ignore installing (for "all")
	highlight = {
		enable = true,
		disable = whether_disable_highlight,
	},
	textobjects = {
		select = {
			enable = true,
			keymaps = {
				["i,"] = "@parameter.inner",
				["a,"] = "@parameter.outer",
			},
		},
	},
	-- andymass/vim-matchup: Tree-sitter integration
	matchup = {
		enable = true,
	},
})
