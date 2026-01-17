function mdn_create_note(title)
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    
    math.randomseed(tonumber(tostring(os.time()):reverse():sub(1, 9)))

    local id = vim.fn.sha256(title)
    local file_name = string.sub(tostring(id), 0, 16) .. ".md"

    if #title ~= 0 then
        vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { "[[" .. title .. "]]" })

        vim.cmd("edit " .. file_name)
        vim.api.nvim_buf_set_lines(0, 0, -1, false, {
            "# " .. title, "",
            "TAGS: ",
            "",""
        })
        vim.cmd("normal! G$")
    end
end
