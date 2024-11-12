local M = {}

function M.highlight(palette, opts)
    return {
        DiagnosticOk = { fg = palette.fg2 },
        DiagnosticError = { fg = palette.fg3 },
        DiagnosticHint = { fg = palette.fg1 },
        DiagnosticInfo = { fg = palette.fg4 },
        DiagnosticWarn = { fg = palette.fg3 },
    }
end

return M
