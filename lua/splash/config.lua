---@class splash.Config: splash.Opts
local M = {}

-- Define the class for options
---@class splash.Opts
---@field directory string
---@field theme splash.Opts.Theme

-- Define the theme class
---@class splash.Opts.Theme
---@field [1] string
---@field content splash.Opts.Theme.Content[] 

-- Define the content class
---@class splash.Opts.Theme.Content
---@field ascii string[]
---@field color string
---@field vertical_padding number
---@field alignment 'left' | 'right' | 'center'

-- Define the defaults table with explicit typing
---@type splash.Opts
local defaults = {
    directory = 'splash.themes',
    theme = {
        'neovim',
        content = {
            {
                ascii = {},
                color = '000000',
                vertical_padding = 0,
                alignment = 'center',
            },
        },
    },
}

---@type splash.Opts
M.opts = nil

---@param opts splash.Opts
function M.setup(opts)
    ---@type splash.Opts
    local defaults_copy = vim.deepcopy(defaults)
    M.opts = vim.tbl_extend('force', defaults_copy, opts or {})

    if not opts or not opts.theme or not opts.theme.content then
        local path = M.opts.directory .. '.' .. M.opts.theme[1]

        ---@type splash.Opts.Theme.Content[]
        local theme_content_arr = require(path) or {}

        M.opts.theme.content = {}
        for _, content in ipairs(theme_content_arr) do
            local defaults_copy = vim.deepcopy(defaults)
            local opts_theme_content = vim.tbl_extend('force', defaults_copy.theme.content[1], content or {})
            table.insert(M.opts.theme.content, opts_theme_content)
        end
    end
end

return M

