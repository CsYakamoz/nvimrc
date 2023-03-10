local lualine = require("lualine")

local diagnostics = {
	"diagnostics",
	sources = { "coc" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = true,
}

local trailing_space = {
	function()
		local ignored_list = { "help", "gitcommit" }
		local ft = vim.bo.filetype
		for _, value in ipairs(ignored_list) do
			if ft == value then
				return ""
			end
		end

		local space = vim.fn.search([[\s\+$]], "nwc")
		return space ~= 0 and string.format("[%d]trailing", space) or ""
	end,
	color = "DiagnosticError",
}

local diff = {
	"diff",
	colored = true,
	cond = function()
		return vim.fn.winwidth(0) > 80
	end,
}

local mode = {
	"mode",
	fmt = function(str)
		return str:sub(1, 1)
	end,
	padding = { left = 1, right = 0 },
}

local location = {
	"location",
	padding = { left = 0, right = 1 },
}

local function indent()
	if vim.o.expandtab then
		return "SW:" .. vim.o.shiftwidth
	else
		return "TS:" .. vim.o.tabstop
	end
end

lualine.setup({
	options = {
		component_separators = "",
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = { "alpha", "NvimTree", "Outline", "coctree" },
		},
	},
	sections = {
		lualine_a = { mode },
		lualine_b = { "filename" },
		lualine_c = { diff },
		lualine_x = { trailing_space, diagnostics },
		lualine_y = { "filetype", indent, "encoding", "progress" },
		lualine_z = { location },
	},
})
