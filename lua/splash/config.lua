---@class splash.Config: splash.Opts
local M = {}

---@class splash.Opts
local defaults = {
    directory = 'splash.themes',
    theme = {
        name = 'neovim',
        ---@class splash.Opts.Theme.Content[]
        content = {
            ---@class splash.Opts.Theme.Content
            ---@field alignment 'left' | 'right' | 'center'
            ---@field padding number
            ---@field color string
            ---@field ascii string[]
            {
                alignment = 'left',
                padding = 0,
                color = 'ffffff',
                ascii = {},
            },
        },
    },
}

---@type splash.Opts
M.opts = nil

---@param opts splash.Opts
function M.setup(opts)
    M.opts = vim.tbl_deep_extend('force', {}, defaults, opts or {})

    local path = M.opts.directory .. '.' .. M.opts.theme.name
    local theme_content = require(path) or {}
    M.opts.theme.content = vim.tbl_deep_extend('force', M.opts.theme.content, theme_content)

end

return M
