local M = {}

function M.highlight(palette, opts)
    return {
        AlphaHeader = { fg = palette.fg4 },
        AlphaButtons = { fg = palette.fg2 },
    }
end

return M
