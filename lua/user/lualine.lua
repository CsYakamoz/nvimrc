local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
	update_in_insert = false,
	always_visible = true,
}

local function trailing_space()
	local space = vim.fn.search([[\s\+$]], "nwc")
	return space ~= 0 and string.format("[%d]trailing", space) or ""
end

local diff = {
	"diff",
	colored = false,
	symbols = { added = " ", modified = " ", removed = " " },
	cond = hide_in_width,
}

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
		lualine_b = { "filename", diff },
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
