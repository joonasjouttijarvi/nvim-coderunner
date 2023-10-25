M.run_code = function()
    local file_extension = vim.fn.expand('%:e') -- Get file extension
    local filename = vim.fn.expand('%:p')

    local cmd = ""

    if file_extension == "py" then
        cmd = "python3 " .. filename
    elseif file_extension == "js" or file_extension == "jsx" then
        cmd = "node " .. filename
    elseif file_extension == "java" then
        local options = {
            "1. javac",
            "2. maven"
        }
        local choice = vim.fn.inputlist(options)
        if choice == 1 then
            cmd = "javac " .. filename .. " && java " .. vim.fn.expand('%:r')
        elseif choice == 2 then
            cmd = "mvn compile exec:java"
        else
            return
        end
    end

    if cmd ~= "" then
        vim.cmd(":belowright split | resize 15 | terminal " .. cmd)
    else
        print("No runner configured for this file extension.")
    end
end
