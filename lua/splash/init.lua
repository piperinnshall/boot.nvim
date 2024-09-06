---@class splash
---@field private global_opt table<string, any> 
local M = {}

---@param opts? splash.Opts  
function M.setup(opts)
    require'splash.config'.setup(opts)
    print('working')
end

return M

