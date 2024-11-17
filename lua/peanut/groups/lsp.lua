local M = {}

function M.highlight(palette, opts)
    return {
        DiagnosticOk = { fg = palette.fg2 },
        DiagnosticError = { link = 'ErrorMsg' },
        DiagnosticHint = { fg = palette.fg1 },
        DiagnosticInfo = { fg = palette.fg4 },
        DiagnosticWarn = { link = 'WarningMsg' },
    }
end

return M
