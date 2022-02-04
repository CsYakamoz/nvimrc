local lualine = require("lualine")

local diagnostics = {
	"diagnostics",
	sources = { "coc" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = true,
}

local function trailing_space()
	local space = vim.fn.search([[\s\+$]], "nwc")
	return space ~= 0 and string.format("[%d]trailing", space) or ""
end

local diff = {
	"diff",
	colored = true,
	cond = function()
		return vim.fn.winwidth(0) > 80
	end,
}

local function coc_status()
	local status = vim.g.coc_status

	if status == nil then
		return ""
	end

	return status:match("^%s*(.-)%s*$")
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { {
			"mode",
			fmt = function(str)
				return str:sub(1, 1)
			end,
		} },
		lualine_b = { "filename", coc_status, diff },
		lualine_c = {},
		lualine_x = { { trailing_space, color = "WarningMsg" }, diagnostics },
		lualine_y = { "filetype", "encoding", "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
