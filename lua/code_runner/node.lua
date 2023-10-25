local M = {}

M.run = function()
    local file_path = vim.fn.expand('%:p')
    local cmd = string.format("node %s", file_path)

    vim.cmd(':belowright split | resize 15 | terminal' .. cmd)
end

return M
