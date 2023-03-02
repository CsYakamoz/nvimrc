local wilder = require("wilder")
wilder.setup({ modes = { ":", "/", "?" } })

-- https://github.com/gelguy/wilder.nvim#customising-the-pipeline
wilder.set_option("pipeline", {
	wilder.branch(
		wilder.cmdline_pipeline({
			-- sets the language to use, 'vim' and 'python' are supported
			language = "python",
			-- 0 turns off fuzzy matching
			-- 1 turns on fuzzy matching
			-- 2 partial fuzzy matching (match does not have to begin with the same first letter)
			fuzzy = 1,
		}),
		wilder.python_search_pipeline({
			-- can be set to wilder#python_fuzzy_delimiter_pattern() for stricter fuzzy matching
			pattern = wilder.python_fuzzy_pattern(),
			-- omit to get results in the order they appear in the buffer
			sorter = wilder.python_difflib_sorter(),
			-- can be set to 're2' for performance, requires pyre2 to be installed
			-- see :h wilder#python_search() for more details
			engine = "re",
		})
	),
})

-- https://github.com/gelguy/wilder.nvim#customising-the-pipeline
-- https://github.com/gelguy/wilder.nvim#popupmenu-borders
wilder.set_option(
	"renderer",
	wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
		highlighter = wilder.basic_highlighter(),
		highlights = {
			border = "Normal", -- highlight to use for the border
		},
		-- 'single', 'double', 'rounded' or 'solid'
		-- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details
		border = "rounded",
		left = { " ", wilder.popupmenu_devicons() },
		right = { " ", wilder.popupmenu_scrollbar() },
	}))
)
