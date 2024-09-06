---@class splash.Splash
local M = {}

function M.setup()
    -- if vim.api.nvim_buf_get_name(0) ~= '' then
        -- return
    -- end
    require'splash.window'.setup()

    ---@type splash.Opts.Theme.Content
    local content_arr = require'splash.config'.opts.theme.content

    ---@type splash.Opts.Theme.Content[]
    local aligned_content_arr = require'splash.align'.setup(content_arr)

    require'splash.draw'.setup(aligned_content_arr)
end

return M
