local M = {}

M.run = function()
    local file_path = vim.fn.expand('%:p')
    local relative_path = vim.fn.fnamemodify(file_path, ':~:.')
    local class_name = relative_path:gsub("src/main/java/", ""):gsub("/", "."):gsub(".java$", "")

    -- Use Maven to compile and run the class
    local cmd = string.format("mvn exec:java -Dexec.mainClass=%s", class_name)
    vim.cmd(":belowright split | resize 15 | terminal " .. cmd)
end

return M
