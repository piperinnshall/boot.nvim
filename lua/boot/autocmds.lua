---@class autocmds

vim.api.nvim_create_autocmd('VimEnter', {
    callback = function()
        require'boot.trek'.setup()
    end,
})
