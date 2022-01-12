local M = {}

-- TODO: backfill this to template
M.setup = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		-- disable virtual text
		virtual_text = false,
		-- show signs
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
		vim.lsp.handlers.signature_help,
		{ border = "rounded" }
	)
end

local function lsp_highlight_document(client)
	-- Set autocommands conditional on server_capabilities
	if client.resolved_capabilities.document_highlight then
		vim.api.nvim_exec(
			[[
		augroup lsp_document_highlight
			autocmd! * <buffer>
			autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
			autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
			autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()

			autocmd CursorHold <buffer> lua vim.diagnostic.open_float({ scope = "cursor" })
		augroup END
		]],
			false
		)
	end
end

local keymap = require("user.keymap")
local function lsp_keymap(bufnr)
	keymap.bmap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", keymap.opts)
	keymap.bmap(bufnr, "n", "gd", "<cmd>Telescope lsp_definitions<CR>", keymap.opts)
	keymap.bmap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", keymap.opts)
	keymap.bmap(bufnr, "n", "<leader>gi", "<cmd>Telescope lsp_implementations<CR>", keymap.opts)
	keymap.bmap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", keymap.opts)
	keymap.bmap(bufnr, "n", "gr", "<cmd>Telescope lsp_references<CR>", keymap.opts)
	keymap.bmap(bufnr, "n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", keymap.opts)
	keymap.bmap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", keymap.opts)
	keymap.bmap(bufnr, "n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", keymap.opts)
end

local disable_formatting_list = { "tsserver", "gopls" }

M.on_attach = function(client, bufnr)
	for _, v in pairs(disable_formatting_list) do
		if client.name == v then
			client.resolved_capabilities.document_formatting = false
			client.resolved_capabilities.document_range_formatting = false
			break
		end
	end

	lsp_keymap(bufnr)
	lsp_highlight_document(client)

	require("lsp_signature").on_attach({
		hi_parameter = "IncSearch",
	}, bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local cmp_nvim_lsp = require("cmp_nvim_lsp")

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
