-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("config-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank({ timeout = 50 })
    end,
})

--
vim.api.nvim_create_autocmd("TermOpen", {
    desc = "Set options for terminals",
    group = vim.api.nvim_create_augroup("config-terminal-settings", { clear = true }),
    callback = function()
        vim.api.nvim_set_option_value("number", false, { scope = "local" })
        vim.api.nvim_set_option_value("relativenumber", false, { scope = "local" })
    end,
})
