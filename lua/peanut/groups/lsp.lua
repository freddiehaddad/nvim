local M = {}

---@diagnostic disable-next-line: unused-local
function M.highlight(palette, opts)
    return {
        DiagnosticOk = { fg = palette.green },
        DiagnosticError = { fg = palette.red },
        DiagnosticHint = { fg = palette.yellow },
        DiagnosticInfo = { fg = palette.yellow },
        DiagnosticWarn = { fg = palette.red },
    }
end

return M
