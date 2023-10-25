local M = {}

M.run = function()
    local file_path = vim.fn.expand('%:p')
    local cmd = string.format("python3 %s", file_path)

    -- Open terminal in a split and run the Python file
    vim.cmd(":belowright split | resize 15 | terminal " .. cmd)
end

return M
