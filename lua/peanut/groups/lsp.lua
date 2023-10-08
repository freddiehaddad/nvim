local M = {}

---@diagnostic disable-next-line: unused-local
function M.highlight(palette, opts)
    return {
        DiagnosticOk = { fg = palette.white },
        DiagnosticError = { fg = palette.magenta },
        DiagnosticHint = { fg = palette.cyan },
        DiagnosticInfo = { fg = palette.blue },
        DiagnosticWarn = { fg = palette.red },
    }
end

return M
