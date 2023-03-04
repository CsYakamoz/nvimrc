local toggleterm = require("toggleterm")

toggleterm.setup({
	open_mapping = [[<M-j>]],
	direction = "float",
	float_opts = {
		border = "curved",
	},
})

local function cd()
	local path = vim.fn.expand("%:p:h")
	if vim.fn.isdirectory(path) == false then
		vim.notify("path does not exist or is not a directory: " .. path, "error")
		return
	end

	local cmd = "ToggleTerm dir=" .. path .. " direction=float"
	vim.cmd(cmd)
end

vim.api.nvim_create_user_command("CD", cd, {})
