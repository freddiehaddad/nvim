local M = {}

---@diagnostic disable-next-line: unused-local
function M.highlight(palette, opts)
    return {
        NeotestPassed = { link = "DiagnosticOk" },
        NeotestFailed = { link = "DiagnosticError" },
        NeotestRunning = { link = "DiagnosticInfo" },
        NeotestSkipped = { link = "DiagnosticWarn" },
        NeotestTest = { link = "Function" },
        NeotestNamespace = { link = "Identifier" },
        NeotestFocused = { link = "DiagnosticInfo" },
        NeotestFile = { link = "Normal" },
        NeotestDir = { link = "Directory" },
        NeotestAdapterName = { link = "Title" },
        NeotestWinSelect = { link = "Normal" },
        NeotestMarked = { link = "Identifier" },
        NeotestTarget = { link = "Normal" },
        NeotestWatching = { link = "Normal" },
        NeotestUnknown = { link = "DiagnosticError" },
        NeotestBorder = { link = "Normal" },
        NeotestIndent = { link = "LineNr" },
        NeotestExpandMarker = { link = "LineNr" },
    }
end

return M
