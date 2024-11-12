local M = {}

function M.highlight(palette, opts)
    return {
        NeotestPassed = { link = 'DiagnosticOk' },
        NeotestFailed = { link = 'DiagnosticError' },
        NeotestRunning = { link = 'DiagnosticInfo' },
        NeotestSkipped = { link = 'DiagnosticHint' },
        NeotestTest = { link = 'Function' },
        NeotestNamespace = { link = 'Normal' },
        NeotestFocused = { link = 'DiagnosticInfo' },
        NeotestFile = { link = 'Normal' },
        NeotestDir = { link = 'Directory' },
        NeotestIndent = { link = 'Normal' },
        NeotestExpandMarker = { link = 'Normal' },
        NeotestAdapterName = { link = 'Title' },
        NeotestWinSelect = { link = 'Normal' },
        NeotestMarked = { link = 'Normal' },
        NeotestTarget = { link = 'Normal' },
        NeotestWatching = { link = 'Normal' },
        NeotestUnknown = { link = 'DiagnosticError' },
    }
end

return M
