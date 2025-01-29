local M = {}

---@diagnostic disable-next-line: unused-local
function M.highlight(palette, opts)
    return {
        DiagnosticOk = { fg = palette.green },
        DiagnosticError = { link = "ErrorMsg" },
        DiagnosticHint = { fg = palette.blue },
        DiagnosticInfo = { fg = palette.yellow },
        DiagnosticWarn = { link = "WarningMsg" },
    }
end

return M
