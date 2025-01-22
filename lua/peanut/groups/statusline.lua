local M = {}

---@diagnostic disable-next-line: unused-local
function M.highlight(palette, opts)
    return {
        StatusLine = { fg = palette.bg4 },
        StatusLineNC = { link = "StatusLine" },
        StatusLineSeparator = { link = "StatusLine" },
        StatusLineTerm = { link = "StatusLine" },
        StatusLineTermNC = { link = "StatusLine" },
    }
end

return M
