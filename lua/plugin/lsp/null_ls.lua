local null_ls = require("null-ls")

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	fallback_severity = vim.diagnostic.severity.INFO,
	sources = {
		formatting.prettier.with({
			prefer_local = "node_modules/.bin",
		}),
		formatting.goimports,
		formatting.stylua,
		formatting.shfmt.with({
			extra_args = { "-i", "2", "-ci" },
		}),

		diagnostics.eslint.with({
			prefer_local = "node_modules/.bin",
		}),
		diagnostics.shellcheck,
		diagnostics.cspell.with({
			prefer_local = "node_modules/.bin"
		}),
	},
})
