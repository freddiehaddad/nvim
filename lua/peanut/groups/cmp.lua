local M = {}

function M.highlight(palette, opts)
    return {
        CmpItemAbbr = { fg = palette.fg1 },
        CmpItemAbbrDeprecated = { fg = palette.fg1 },
        CmpItemAbbrMatch = { fg = palette.fg1 },
        CmpItemAbbrMatchFuzzy = { fg = palette.fg1 },
        CmpItemMenu = { fg = palette.fg1 },
        CmpItemKind = { fg = palette.fg1 },
    }
end

return M
