local M = {}

function M.highlight(palette, opts)
    return {
        NeotestPassed = { link = 'Normal' },
        NeotestFailed = { link = 'Normal' },
        NeotestRunning = { link = 'Normal' },
        NeotestSkipped = { link = 'Normal' },
        NeotestTest = { link = 'Normal' },
        NeotestNamespace = { link = 'Normal' },
        NeotestFocused = { link = 'Normal' },
        NeotestFile = { link = 'Normal' },
        NeotestDir = { link = 'Normal' },
        NeotestIndent = { link = 'Normal' },
        NeotestExpandMarker = { link = 'Normal' },
        NeotestAdapterName = { link = 'Normal' },
        NeotestWinSelect = { link = 'Normal' },
        NeotestMarked = { link = 'Normal' },
        NeotestTarget = { link = 'Normal' },
        NeotestWatching = { link = 'Normal' },
        NeotestUnknown = { link = 'Normal' },
    }
end

return M
