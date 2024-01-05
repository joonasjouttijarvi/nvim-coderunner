local M = {}

M.get_command = function()
    local file_path = vim.fn.expand('%:p')
    return string.format("python3 %s", file_path)
end

return M
