local M = {}

---@diagnostic disable-next-line: unused-local
function M.highlight(palette, opts)
    return {
        SnacksBackdrop = { link = "Float" },
        SnacksNotifierHistory = { bg = palette.bg2 },

        -- SnacksNormal	NormalFloat	-- Normal for the float window
        -- SnacksWinBar	Title	-- Title of the window
        -- SnacksBackdrop	none	-- Backdrop
        -- SnacksNormalNC	NormalFloat	-- Normal for non-current windows
        -- SnacksWinBarNC	SnacksWinBar	-- Title for non-current windows
        -- SnacksScratchKey	DiagnosticVirtualText	-- Keymap help in the footer
        -- SnacksScratchDesc	DiagnosticInfo	-- Keymap help desc in the footer
        -- SnacksNotifierInfo	none	-- Notification window for Info
        -- SnacksNotifierWarn	none	-- Notification window for Warn
        -- SnacksNotifierDebug	none	-- Notification window for Debug
        -- SnacksNotifierError	none	-- Notification window for Error
        -- SnacksNotifierTrace	none	-- Notification window for Trace
        -- SnacksNotifierIconInfo	none	-- Icon for Info notification
        -- SnacksNotifierIconWarn	none	-- Icon for Warn notification
        -- SnacksNotifierIconDebug	none	-- Icon for Debug notification
        -- SnacksNotifierIconError	none	-- Icon for Error notification
        -- SnacksNotifierIconTrace	none	-- Icon for Trace notification
        -- SnacksNotifierTitleInfo	none	-- Title for Info notification
        -- SnacksNotifierTitleWarn	none	-- Title for Warn notification
        -- SnacksNotifierTitleDebug	none	-- Title for Debug notification
        -- SnacksNotifierTitleError	none	-- Title for Error notification
        -- SnacksNotifierTitleTrace	none	-- Title for Trace notification
        -- SnacksNotifierBorderInfo	none	-- Border for Info notification
        -- SnacksNotifierBorderWarn	none	-- Border for Warn notification
        -- SnacksNotifierBorderDebug	none	-- Border for Debug notification
        -- SnacksNotifierBorderError	none	-- Border for Error notification
        -- SnacksNotifierBorderTrace	none	-- Border for Trace notification
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
