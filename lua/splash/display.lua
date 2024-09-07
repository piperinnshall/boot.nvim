---@class splash.Display
local M = {}

--- @param aligned_ascii string[]
--- @param aligned_content_arr splash.Opts.Theme.Content[]
local function display(aligned_ascii, aligned_content_arr)
    vim.api.nvim_buf_set_lines(0, 0, -1, false, aligned_ascii)

    local start_highlight = 0
    for _, aligned_content in ipairs(aligned_content_arr) do
        local color = aligned_content.color
        vim.api.nvim_set_hl(0, color, { fg = '#' .. color })
        for i = start_highlight, start_highlight + #aligned_content.ascii do
            vim.api.nvim_buf_add_highlight(0, -1, color, i, 0, -1)
        end
        start_highlight = start_highlight + #aligned_content.ascii
    end
end

--- @param aligned_content_arr splash.Opts.Theme.Content[]
function M.setup(aligned_content_arr)
    local aligned_ascii = {}

    for _, content in ipairs(aligned_content_arr) do
        local aligned_content = vim.deepcopy(content)
        for _, line in ipairs(aligned_content.ascii) do
            table.insert(aligned_ascii, line)
        end
    end

    vim.bo.modifiable = true
    display(aligned_ascii, aligned_content_arr)
    vim.bo.modifiable = false
end

return M

