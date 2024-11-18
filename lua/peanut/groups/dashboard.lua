local M = {}

function M.highlight(palette, opts)
    return {
        DashboardHeader = { fg = palette.fg5 },
        DashboardFooter = { fg = palette.fg5 },

        -- Doom theme
        DashboardDesc = { fg = palette.fg3 },
        DashboardKey = { fg = palette.fg3 },
        DashboardIcon = { fg = palette.fg3 },
        DashboardShortCut = { fg = palette.fg3 },
    }
end

return M
