local M = {}

function M.highlight(palette, opts)
    return {
        StatusLine = { link = 'CursorLineNr' },
        StatusLineNC = { link = 'StatusLine' },
        StatusLineSeparator = { link = 'StatusLine' },
        StatusLineTerm = { link = 'StatusLine' },
        StatusLineTermNC = { link = 'StatusLine' },

	FelineComponent = { link = 'StatusLine' },
    }
end

return M
