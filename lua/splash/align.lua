---@class splash.Align
local M = {}

---@param content splash.Opts.Theme.Content
---@return splash.Opts.Theme.Content
local function align(content)
    local aligned_content = vim.deepcopy(content)
    aligned_content.ascii = {}

    local ascii = content.ascii
    local alignment = content.alignment
    local padding = content.padding
    local width = vim.api.nvim_win_get_width(0)

    for _ = 1, padding do
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

---@param content splash.Opts.Theme.Content[]
---@return splash.Opts.Theme.Content[]
function M.setup(content)
    local aligned_content = {}

    for _, item in ipairs(content) do
        local aligned_item = align(item)
        table.insert(aligned_content, aligned_item)
    end

    return aligned_content
end

return M

