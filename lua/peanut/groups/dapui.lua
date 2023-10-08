local M = {}

---@diagnostic disable-next-line: unused-local
function M.highlight(palette, opts)
    return {
        DapStoppedLine = { bg = palette.accent },
        DapUINormal = { link = "Normal" },
        DapUIVariable = { link = "Variable" },
        DapUIScope = { link = "Normal" },
        DapUIType = { link = "Type" },
        DapUIValue = { link = "Identifier" },
        DapUIModifiedValue = { link = "Todo" },
        DapUIDecoration = { link = "Operator" },
        DapUIThread = { link = "Normal" },
        DapUIStoppedThread = { link = "Normal" },
        DapUIFrameName = { link = "Normal" },
        DapUISource = { link = "Normal" },
        DapUILineNumber = { link = "LineNr" },
        DapUIFloatNormal = { link = "NormalFloat" },
        DapUIFloatBorder = { link = "Normal" },
        DapUIWatchesEmpty = { link = "Normal" },
        DapUIWatchesValue = { link = "Normal" },
        DapUIWatchesError = { link = "Normal" },
        DapUIBreakpointsPath = { link = "Normal" },
        DapUIBreakpointsInfo = { link = "Normal" },
        DapUIBreakpointsCurrentLine = { link = "Normal" },
        DapUIBreakpointsLine = { link = "DapUILineNumber" },
        DapUIBreakpointsDisabledLine = { link = "Normal" },
        DapUICurrentFrameName = { link = "DapUIBreakpointsCurrentLine" },
        DapUIStepOver = { link = "Normal" },
        DapUIStepInto = { link = "Normal" },
        DapUIStepBack = { link = "Normal" },
        DapUIStepOut = { link = "Normal" },
        DapUIStop = { link = "Normal" },
        DapUIPlayPause = { link = "Normal" },
        DapUIRestart = { link = "Normal" },
        DapUIUnavailable = { link = "Normal" },
        DapUIWinSelect = { link = "Normal" },
        DapUIEndofBuffer = { link = "EndofBuffer" },
    }
end

return M
