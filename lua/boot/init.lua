---@class boot
local M = {}

require'boot.autocmds'

---@param opts boot.Opts
function M.setup(opts)
    require'boot.config'.setup(opts)
end

return M

