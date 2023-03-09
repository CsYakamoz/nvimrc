local mutchar = require("mutchar")
local filters = require("mutchar.filters")

mutchar.setup({
	["go"] = {
		rules = {
			{ ";", ":=" },
		},
		filter = {
			nil,
		},
		one_to_one = true,
	},
	["php"] = {
		rules = {
			{ "-", "->" },
		},
		filter = {
			filters.non_space_before,
		},
		one_to_one = true,
	},
})
