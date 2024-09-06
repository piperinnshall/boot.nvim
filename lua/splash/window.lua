---@class splash.Window
local M = {}

function M.setup()
    vim.cmd('enew')
    vim.bo.buftype = 'nofile'
    vim.bo.filetype = 'startup'
    vim.cmd([[setlocal nonu nornu nolist]])
end

return M
