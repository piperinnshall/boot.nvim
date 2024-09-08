---@class boot.Config: boot.Opts
local M = {}

-- Define the class for options
---@class boot.Opts
---@field directory string
---@field theme boot.Opts.Theme

-- Define the theme class
---@class boot.Opts.Theme
---@field [1] string
---@field content boot.Opts.Theme.Content[] 

-- Define the content class
---@class boot.Opts.Theme.Content
---@field ascii string[]
---@field color string
---@field vertical_padding number
---@field alignment 'left' | 'right' | 'center'

-- Define the defaults table with explicit typing
---@type boot.Opts
local defaults = {
    directory = 'boot.themes',
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

---@type boot.Opts
M.opts = nil

---@param opts boot.Opts
function M.setup(opts)
    ---@type boot.Opts
    local defaults_copy = vim.deepcopy(defaults)
    M.opts = vim.tbl_extend('force', defaults_copy, opts or {})

    if not opts or not opts.theme or not opts.theme.content then
        local path = M.opts.directory .. '.' .. M.opts.theme[1]

        ---@type boot.Opts.Theme.Content[]
        local theme_content_arr = require(path) or {}

        M.opts.theme.content = {}
        for _, content in ipairs(theme_content_arr) do
            local defaults_copies = vim.deepcopy(defaults)
            local opts_theme_content = vim.tbl_extend('force', defaults_copies.theme.content[1], content or {})
            table.insert(M.opts.theme.content, opts_theme_content)
        end
    end
end

return M

