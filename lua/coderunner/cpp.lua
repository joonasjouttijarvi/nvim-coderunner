local M = {}

M.get_command = function()
	local file_name = vim.fn.expand("%:t:r") -- Get file name without extension
	local cmd = "g++ " .. file_name .. ".cpp -o " .. file_name .. " && ./" .. file_name
	return cmd
end
return M
