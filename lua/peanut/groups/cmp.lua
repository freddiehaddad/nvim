local M = {}

function M.highlight(palette, opts)
    return {
        CmpItemAbbr = { fg = palette.fg2 },
        CmpItemAbbrDeprecated = { fg = palette.fg2 },
        CmpItemAbbrMatch = { fg = palette.fg2 },
        CmpItemAbbrMatchFuzzy = { fg = palette.fg2 },
        CmpItemMenu = { fg = palette.fg2 },
        CmpItemKind = { fg = palette.fg2 },
    }
end

return M
