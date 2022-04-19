local configs = require("nvim-treesitter.configs")

configs.setup({
	ensure_installed = "all",
	ignore_install = {}, -- List of parsers to ignore installing (for "all")
	highlight = {
		enable = true,
		disable = { "bash" },
	},
	-- andymass/vim-matchup: Tree-sitter integration
	matchup = {
		enable = true,
	},
})
