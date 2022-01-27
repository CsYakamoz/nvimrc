local lualine = require("lualine")
local gps = require("nvim-gps")

gps.setup()

local config = lualine.get_config()
config.sections.lualine_c = { { gps.get_location, cond = gps.is_available } }

lualine.setup(config)
