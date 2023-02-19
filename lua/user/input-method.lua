-- Requirement:
-- MacOS: im-select
-- Unix: fcitx-remote, link: https://wiki.archlinux.org/index.php/Fcitx_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)#Vim

local auto = false
local input_toggle = 0
local method_to_en = nil
local restore_method = nil

if vim.g.os == "mac" and vim.fn.executable("im-select") == 1 then
	auto = true

	local original_method = ""
	local abc = "com.apple.keylayout.ABC"
	local getMethod = function()
		return vim.fn.trim(vim.fn.system("im-select"))
	end

	method_to_en = function()
		local method = getMethod()

		if method ~= abc then
			input_toggle = 1
			original_method = method

			vim.fn.system("im-select " .. abc)
		end
	end

	restore_method = function()
		local method = getMethod()

		if method == abc and input_toggle == 1 then
			input_toggle = 0

			vim.fn.system("im-select " .. original_method)
		end
	end
end

if vim.g.os == "linux" and vim.fn.executable("fcitx-remote") == 1 then
	auto = true

	local getMethod = function()
		return vim.api.trim(vim.api.system("fcitx-remote"))
	end

	-- `fcitx-remote`: 0 for close, 1 for inactive, 2 for active
	method_to_en = function()
		local input_status = getMethod()

		if input_status == "2" then
			input_toggle = 1

			vim.api.system("fcitx-remote -c")
		end
	end

	restore_method = function()
		local input_status = getMethod()

		if input_status ~= "2" and input_toggle == 1 then
			input_toggle = 0
			vim.api.system("fcitx-remote -o")
		end
	end
end

if auto then
	vim.opt.ttimeoutlen = 150

	vim.api.nvim_create_augroup("InputMethod", { clear = true })
	vim.api.nvim_create_autocmd(
		"InsertLeave",
		{ group = "InputMethod", pattern = "*", callback = method_to_en }
	)
	vim.api.nvim_create_autocmd(
		"InsertEnter",
		{ group = "InputMethod", pattern = "*", callback = restore_method }
	)
end
