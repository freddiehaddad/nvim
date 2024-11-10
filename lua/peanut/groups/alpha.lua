local M = {}

function M.highlight(palette, opts)
    return {
        AlphaHeader = { fg = palette.fg1 },
        AlphaButtons = { fg = palette.fg1 },
    }
end

return M
