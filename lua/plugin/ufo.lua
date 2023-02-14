local ufo = require("ufo")
local keymap = require("user.keymap")

local handler = function(virtText, lnum, endLnum, width, truncate)
	local newVirtText = {}
	local suffix = ("  %d "):format(endLnum - lnum)
	local sufWidth = vim.fn.strdisplaywidth(suffix)
	local targetWidth = width - sufWidth
	local curWidth = 0
	for _, chunk in ipairs(virtText) do
		local chunkText = chunk[1]
		local chunkWidth = vim.fn.strdisplaywidth(chunkText)
		if targetWidth > curWidth + chunkWidth then
			table.insert(newVirtText, chunk)
		else
			chunkText = truncate(chunkText, targetWidth - curWidth)
			local hlGroup = chunk[2]
			table.insert(newVirtText, { chunkText, hlGroup })
			chunkWidth = vim.fn.strdisplaywidth(chunkText)
			-- str width returned from truncate() may less than 2nd argument, need padding
			if curWidth + chunkWidth < targetWidth then
				suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
			end
			break
		end
		curWidth = curWidth + chunkWidth
	end
	table.insert(newVirtText, { suffix, "MoreMsg" })
	return newVirtText
end

keymap.set("n", "zR", ufo.openAllFolds)
keymap.set("n", "zM", ufo.closeAllFolds)
keymap.set("n", "zr", ufo.openFoldsExceptKinds)
keymap.set("n", "zm", ufo.closeFoldsWith)
keymap.set("n", "K", function()
	local winid = ufo.peekFoldedLinesUnderCursor()

	if not winid then
		vim.cmd([[call CocShowDocumentation()]])
	end
end)

ufo.setup({
	fold_virt_text_handler = handler,
})
