local mutchar = require("mutchar")
local filters = require("mutchar.filters")

mutchar.setup({
	["go"] = {
		rules = {
			{ ";", " :=" },
			{ ",", " <-" },
		},
		filter = {
			{ nil },
			{ filters.go_arrow_symbol },
		},
		one_to_one = true,
	},
})
