---@class splash.Config: splash.Opts
local M = {}

---@class splash.Opts
local defaults = {
    ---@type string
    theme = 'neovim',
    directory = nil, -- lua.startup.themes by default
}

---@param opts? splash.Opts  
function M.setup(opts)
    if opts then
        defaults = vim.tbl_deep_extend('force', defaults, opts)
    end
end
