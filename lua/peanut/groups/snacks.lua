local M = {}

---@diagnostic disable-next-line: unused-local
function M.highlight(palette, opts)
    return {
        SnacksNotifierHistory = { bg = palette.bg2 },
        -- SnacksNormal	NormalFloat	-- Normal for the float window
        -- SnacksWinBar	Title	-- Title of the window
        -- SnacksBackdrop	none	-- Backdrop
        -- SnacksNormalNC	NormalFloat	-- Normal for non-current windows
        -- SnacksWinBarNC	SnacksWinBar	-- Title for non-current windows
        -- SnacksScratchKey	DiagnosticVirtualText	-- Keymap help in the footer
        -- SnacksScratchDesc	DiagnosticInfo	-- Keymap help desc in the footer
        SnacksNotifierInfo = { fg = palette.yellow, bg = palette.bg2 },
        SnacksNotifierWarn = { fg = palette.red, bg = palette.bg2 },
        SnacksNotifierDebug = { fg = palette.yellow, bg = palette.bg2 },
        SnacksNotifierError = { fg = palette.red, bg = palette.bg2 },
        SnacksNotifierTrace = { fg = palette.yellow, bg = palette.bg2 },
        SnacksNotifierIconInfo = { link = "SnacksNotifierInfo" },
        SnacksNotifierIconWarn = { link = "SnacksNotifierWarn" },
        SnacksNotifierIconDebug = { link = "SnacksNotifierDebug" },
        SnacksNotifierIconError = { link = "SnacksNotifierError" },
        SnacksNotifierIconTrace = { link = "SnacksNotifierTrace" },
        SnacksNotifierTitleInfo = { link = "SnacksNotifierInfo" },
        SnacksNotifierTitleWarn = { link = "SnacksNotifierWarn" },
        SnacksNotifierTitleDebug = { link = "SnacksNotifierDebug" },
        SnacksNotifierTitleError = { link = "SnacksNotifierError" },
        SnacksNotifierTitleTrace = { link = "SnacksNotifierTrace" },
        SnacksNotifierBorderInfo = { link = "SnacksNotifierInfo" },
        SnacksNotifierBorderWarn = { link = "SnacksNotifierWarn" },
        SnacksNotifierBorderDebug = { link = "SnacksNotifierDebug" },
        SnacksNotifierBorderError = { link = "SnacksNotifierError" },
        SnacksNotifierBorderTrace = { link = "SnacksNotifierTrace" },
        -- SnacksNotifierFooterInfo	DiagnosticInfo	-- Footer for Info notification
        -- SnacksNotifierFooterWarn	DiagnosticWarn	-- Footer for Warn notification
        -- SnacksNotifierFooterDebug	DiagnosticHint	-- Footer for Debug notification
        -- SnacksNotifierFooterError	DiagnosticError	-- Footer for Error notification
        -- SnacksNotifierFooterTrace	DiagnosticHint	-- Footer for Trace notification
        -- SnacksDashboardNormal	Normal	-- Normal for the dashboard
        -- SnacksDashboardDesc	Special	-- Description text in dashboard
        -- SnacksDashboardFile	Special	-- Dashboard file items
        -- SnacksDashboardDir	NonText	-- Directory items
        -- SnacksDashboardFooter	Title	-- Dashboard footer text
        -- SnacksDashboardHeader	Title	-- Dashboard header text
        -- SnacksDashboardIcon	Special	-- Dashboard icons
        -- SnacksDashboardKey	Number	-- Keybind text
        -- SnacksDashboardTerminal	SnacksDashboardNormal	-- Terminal text
        -- SnacksDashboardSpecial	Special	-- Special elements
        -- SnacksDashboardTitle	Title	-- Title text
    }
end

return M
