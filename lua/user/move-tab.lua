local keymap = require("user.keymap")

local tabpagenr = vim.fn.tabpagenr

--- @param direction "left"|"right"
local move_tab = function(direction)
	return function()
		local count = tabpagenr("$")
		if count < 2 then
			return
		end

		local target
		if direction == "left" then
			if tabpagenr() == 1 then
				target = "$"
			else
				target = "-"
			end
		elseif direction == "right" then
			if tabpagenr() == count then
				target = "0"
			else
				target = "+"
			end
		end

		vim.cmd(string.format("tabmove %s", target))
	end
end

keymap.set("n", "<M-h>", move_tab("left"), keymap.opts())
keymap.set("n", "<M-l>", move_tab("right"), keymap.opts())
