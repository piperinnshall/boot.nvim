---@class boot.Trek
local M = {}

function M.setup()
    if vim.api.nvim_buf_get_name(0) ~= '' then
        return
    end

    ---@type boot.Opts.Theme.Content
    local content_arr = require'boot.config'.opts.theme.content

    ---@type boot.Opts.Theme.Content[]
    local aligned_content_arr = require'boot.align'.setup(content_arr)

    require'boot.window'.setup()

    require'boot.display'.setup(aligned_content_arr)
end

return M
