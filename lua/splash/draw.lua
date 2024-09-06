---@class splash.Draw
local M = {}


---@param aligned_content splash.Opts.Theme.Content
local function draw(aligned_content)

    local color = aligned_content.color

    vim.api.nvim_buf_set_lines(0, 0, -1, false, aligned_content.ascii)

end

---@param aligned_content splash.Opts.Theme.Content[] 
function M.setup(aligned_content)
    vim.bo.modifiable = true
    for _, item in ipairs(aligned_content) do
        draw(item)
    end
    vim.bo.modifiable = false
end

return M
