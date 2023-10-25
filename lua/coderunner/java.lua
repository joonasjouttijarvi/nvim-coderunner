local M = {}

M.get_command = function()
    local file_path = vim.fn.expand("%:p")
    local relative_path = vim.fn.fnamemodify(file_path, ":~:.")
    local class_name = relative_path:gsub("src/main/java/", ""):gsub("/", "."):gsub(".java$", "")

    local options = {
        "1. javac",
        "2. maven",
    }
    local choice = vim.fn.inputlist(options)

    if choice == 1 then
        return string.format("javac %s && java %s", file_path, vim.fn.expand("%:r"))
    elseif choice == 2 then
        return string.format("mvn exec:java -Dexec.mainClass=%s", class_name)
    else
        return ""
    end
end

return M
