local mutchar = require("mutchar")
local filters = require("mutchar.filters")

mutchar.setup({
	["go"] = {
		rules = {
			{ ";", " :=" },
		},
		filter = {
			{ nil },
		},
		one_to_one = true,
	},
})
