---@class splash
local M = {}

require'splash.autocmds'

---@param opts splash.Opts
function M.setup(opts)
    require'splash.config'.setup(opts)
end

return M

