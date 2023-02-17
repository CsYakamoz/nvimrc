vim.notify = require("notify")

-- Refer: https://github.com/neoclide/coc.nvim/wiki/Nvim-notifications-integration

local coc_diag_record = {}

local function reset_coc_diag_record(window)
	coc_diag_record = {}
end

local function coc_diag_notify(msg, level)
	local notify_opts = {
		title = "LSP Diagnostics",
		timeout = 500,
		on_close = reset_coc_diag_record,
	}

	-- if coc_diag_record is not {} then add it to notify_opts to key called "replace"
	if coc_diag_record ~= {} then
		notify_opts["replace"] = coc_diag_record.id
	end

	coc_diag_record = vim.notify(msg, level, notify_opts)
end

local function coc_diagnostic_change_notify()
	local info = vim.b.coc_diagnostic_info
	if info == nil then
		return
	end

	local level = "info"
	if (info.warning or 0) ~= 0 then
		level = "warn"
	end
	if (info.error or 0) ~= 0 then
		level = "error"
	end

	local msgList = {}
	if (info.error or 0) ~= 0 then
		table.insert(msgList, " Errors: " .. tostring(info.error))
	end
	if (info.warning or 0) ~= 0 then
		table.insert(msgList, " Warnings: " .. tostring(info.warning))
	end
	if (info.information or 0) ~= 0 then
		table.insert(msgList, " Infos: " .. tostring(info.information))
	end

	local msg = table.concat(msgList, "\n")
	if string.len(msg) == 0 then
		msg = " All OK"
	end

	coc_diag_notify(msg, level)
end

vim.api.nvim_create_autocmd("User", {
	desc = "Show Diagnostics Change from Coc",
	pattern = "CocDiagnosticChange",
	callback = coc_diagnostic_change_notify,
})
