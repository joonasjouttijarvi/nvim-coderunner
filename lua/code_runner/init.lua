local M = {}

M.run_code = function()
    local file_extension = vim.fn.expand('%:e') -- Get file extension

    if file_extension == "py" then
        require('coderunner.python').run()
    elseif file_extension == "java" then
        require('coderunner.java').run()
    else
        print("No runner configured for this file extension.")
    end
end

return M
