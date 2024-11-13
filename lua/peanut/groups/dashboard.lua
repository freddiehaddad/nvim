local M = {}

function M.highlight(palette, opts)
    return {
        DashboardHeader = { fg = palette.fg4 },
        DashboardFooter = { fg = palette.fg4 },

        -- Doom theme
        DashboardDesc = { fg = palette.fg2 },
        DashboardKey = { fg = palette.fg2 },
        DashboardIcon = { fg = palette.fg2 },
        DashboardShortCut = { fg = palette.fg2 },
    }
end

return M
