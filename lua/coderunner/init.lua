local M = {}

local js_extensions = { "js" }

M.run_code = function()
	local file_extension = vim.fn.expand("%:e") -- Get file extension
	local cmd = ""

	if file_extension == "py" then
		cmd = require("coderunner.python").get_command()
	elseif file_extension == "java" then
		cmd = require("coderunner.java").get_command()
	elseif file_extension == js_extensions then
		cmd = require("coderunner.node").get_command()
	elseif file_extension == "cpp" then
		cmd = require("coderunner.cpp").get_command()
	end

	if cmd ~= "" then
		-- Open terminal in a split and run the command
		vim.cmd(":belowright split | resize 15 | terminal " .. cmd)
	else
		print("No runner configured for this filetype")
	end
end

return M
