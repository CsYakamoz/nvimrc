require("neoscroll").setup({ easing_function = "quadratic" })

local t = {}
t["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "70", [['sine']] } }
t["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "70", [['sine']] } }
t["<C-b>"] = {
	"scroll",
	{ "-vim.api.nvim_win_get_height(0)", "true", "100", [['circular']] },
}
t["<C-f>"] = {
	"scroll",
	{ "vim.api.nvim_win_get_height(0)", "true", "100", [['circular']] },
}
t["<C-y>"] = { "scroll", { "-0.10", "false", "100", nil } }
t["<C-e>"] = { "scroll", { "0.10", "false", "100", nil } }
t["zt"] = { "zt", { "100" } }
t["zz"] = { "zz", { "100" } }
t["zb"] = { "zb", { "100" } }

require("neoscroll.config").set_mappings(t)
