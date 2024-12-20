local M = {}

function M.highlight(palette, opts)
    return {
        -- TODO:
        -- Need to identify these highlight groups
        VisualNC = { fg = '#ff0000' },
        -- TODO:

        Normal = { fg = palette.fg2 },
        Bold = { bold = true },
        Italic = { italic = false },

        Added = { fg = palette.fg2 },
        Changed = { fg = palette.fg3 },
        Removed = { fg = palette.fg4 },
        NonText = { fg = palette.fg5 },

        CursorLine = { bg = palette.bg2 },
        CursorColumn = { link = 'CursorLine' },
        CursorLineNr = { fg = palette.fg1 },
        CursorLineSign = { link = 'SignColumn' },
        CursorLineFold = { link = 'FoldColumn' },

        MatchParen = { fg = palette.fg5 },

        LineNr = { fg = palette.fg1 },
        LineNrAbove = { link = 'LineNr' },
        LineNrBelow = { link = 'LineNr' },

        SignColumn = { fg = palette.fg1 },
        FoldColumn = { link = 'SignColumn' },

        WinSeparator = { fg = palette.bg1 },

        Search = { bg = palette.bg4 },
        CurSearch = { link = 'Search' },
        IncSearch = { link = 'Search' },

        Visual = { link = 'Search' },
        VisualNOS = { link = 'Visual' },

        NormalFloat = { bg = palette.bg2 },
        FloatBorder = { fg = palette.fg1, bg = palette.bg2 },

        Pmenu = { fg = palette.fg2, bg = palette.bg2 },
        PmenuSel = { bg = palette.bg3 },
        PmenuKind = { link = 'Pmenu' },
        PmenuKindSel = { link = 'PmenuSel' },
        PmenuExtra = { link = 'Pmenu' },
        PmenuExtraSel = { link = 'PmenuSel' },
        PmenuThumb = { bg = palette.bg3 },
        PmenuSbar = { bg = palette.bg2 },

        Special = { fg = palette.fg1 },

        -- information
        Title = { fg = palette.fg2, bold = true },
        Icon = { fg = palette.fg1 },

        -- files / folders
        Directory = { fg = palette.fg5 },
    }
end

return M
