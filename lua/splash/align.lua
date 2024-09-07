---@class splash.Align
local M = {}

---@param content splash.Opts.Theme.Content
---@return splash.Opts.Theme.Content
local function align(content)
    local aligned_content = vim.deepcopy(content)
    aligned_content.ascii = {}

    local vertical_padding = content.vertical_padding
    local ascii = content.ascii
    local alignment = content.alignment

    local width = vim.api.nvim_win_get_width(0)

    for _ = 1, vertical_padding do
        table.insert(aligned_content.ascii, "")
    end

    for _, line in ipairs(ascii) do
        local line_width = vim.fn.strdisplaywidth(line)
        if alignment == 'center' then
            local spaces = math.max(0, math.floor((width - line_width) / 2))
            table.insert(aligned_content.ascii, string.rep(" ", spaces) .. line)
        elseif alignment == 'right' then
            local spaces = math.max(0, width - line_width)
            table.insert(aligned_content.ascii, string.rep(" ", spaces) .. line)
        elseif alignment == 'left' then
            table.insert(aligned_content.ascii, line)
        end
    end

    return aligned_content
end

---@param content_arr splash.Opts.Theme.Content[]
---@return splash.Opts.Theme.Content[]
function M.setup(content_arr)
    local aligned_content_arr = {}

    for _, content in ipairs(content_arr) do
        local aligned_content = align(content)
        table.insert(aligned_content_arr, aligned_content)
    end

    return aligned_content_arr
end

return M

