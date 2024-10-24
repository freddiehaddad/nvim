local M = {}

function M.highlight(palette, opts)
    return {
        StatusLine = { fg = palette.gray },
        StatusLineNC = { fg = palette.alt_bg },
        StatusLineSeparator = { fg = palette.bg },
        StatusLineTerm = { fg = palette.bg },
        StatusLineTermNC = { fg = palette.bg },
    }
end

return M
