local M = {}

function M.highlight(palette, opts)
    return {
        StatusLine = { link = 'Normal' },
        StatusLineNC = { link = 'Normal' },
        StatusLineSeparator = { link = 'Normal' },
        StatusLineTerm = { link = 'Normal' },
        StatusLineTermNC = { link = 'Normal' },
    }
end

return M
