local function get_num_unsaved_buffers()
    local buffers = vim.api.nvim_list_bufs()
    local unsaved_count = 0

    for _, buffer in ipairs(buffers) do
        local is_loaded = vim.api.nvim_buf_is_loaded(buffer)
        if is_loaded then
            local is_unsaved = vim.api.nvim_get_option_value("modified", { buf = buffer })
            unsaved_count = unsaved_count + (is_unsaved and 1 or 0)
        end
    end

    return unsaved_count
end

local function set_tabline_str()
    local n = get_num_unsaved_buffers()
    if n == 0 then
        vim.opt.showtabline = 0 -- Hide the tabline
        return ""
    end

    vim.opt.showtabline = 2 -- Show the tabline
    return n .. " unsaved buffers"
end

vim.api.nvim_create_autocmd({ "BufModifiedSet", "BufNewFile", "BufWritePost" }, {
    desc = "Update tabline after editing text",
    group = vim.api.nvim_create_augroup("config-tabline", { clear = true }),
    callback = set_tabline_str,
})
