local M = {}

function M.highlight(palette, opts)
    return {
        DiagnosticOk = { fg = palette.fg3 },
        DiagnosticError = { link = 'ErrorMsg' },
        DiagnosticHint = { fg = palette.fg2 },
        DiagnosticInfo = { fg = palette.fg5 },
        DiagnosticWarn = { link = 'WarningMsg' },
    }
end

return M
