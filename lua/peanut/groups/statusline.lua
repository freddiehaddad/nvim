local M = {}

function M.highlight(palette, opts)
    return {
        StatusLine = { fg = palette.fg4 },
        StatusLineNC = { link = 'StatusLine' },
        StatusLineSeparator = { link = 'StatusLine' },
        StatusLineTerm = { link = 'StatusLine' },
        StatusLineTermNC = { link = 'StatusLine' },
    }
end

return M
