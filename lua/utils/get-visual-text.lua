return function()
	local start_pos = vim.fn.getpos("'<")
	local line_start = start_pos[2]
	local col_start = start_pos[3]

	local end_pos = vim.fn.getpos("'>")
	local line_end = end_pos[2]
	local col_end = end_pos[3]

	local line_list = vim.fn.getline(line_start, line_end)
	local len = #line_list

	-- if never enter visual mode, the len of lineList is zero
	if len == 0 then
		return ""
	end

	if len == 1 then
		line_list[1] = string.sub(line_list[1], col_start, col_end)
	else
		line_list[1] = string.sub(line_list[1], col_start)
		line_list[#line_list - 1] = string.sub(line_list[#line_list], 1, col_end)
	end

	return table.concat(line_list, "\n")
end
