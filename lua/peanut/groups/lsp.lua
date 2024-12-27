local M = {}

---@diagnostic disable-next-line: unused-local
function M.highlight(palette, opts)
    return {
        DiagnosticOk = { fg = palette.fg3 },
        DiagnosticError = { link = "ErrorMsg" },
        DiagnosticHint = { fg = palette.fg1 },
        DiagnosticInfo = { fg = palette.fg4 },
        DiagnosticWarn = { link = "WarningMsg" },
    }
end

return M
