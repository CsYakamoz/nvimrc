local indent_blankline = require("indent_blankline")

indent_blankline.setup({
	char = "│",
	-- char = "┊",
	-- context_char = "│",
	use_treesitter = true,
	show_current_context = true,

	show_end_of_line = false,
	disable_with_nolist = true,

	buftype_exclude = { "terminal" },
	filetype_exclude = {
		"help",
		"git",
		"markdown",
		"snippets",
		"text",
		"gitconfig",
		"alpha",
		"NvimTree",
	},
})
