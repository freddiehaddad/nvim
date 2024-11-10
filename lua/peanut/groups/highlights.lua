local M = {}

function M.highlight(palette, opts)
    return {
        Normal = { fg = palette.fg1 },
        Bold = { bold = true },
        Italic = { italic = false },

        CursorLine = { bg = palette.bg2 },
        CursorColumn = { link = 'CursorLine' },
        CursorLineNr = { fg = palette.bg4 },

        LineNr = { fg = palette.bg3 },
        LineNrAbove = { link = 'LineNr' },
        LineNrBelow = { link = 'LineNr' },

        SignColumn = { fg = palette.bg4 },
        FoldColumn = { link = 'SignColumn' },

        CursorLineSign = { link = 'SignColumn' },
        CursorLineFold = { link = 'FoldColumn' },

        WinSeparator = { fg = palette.bg1 },

        Search = { bg = palette.bg4 },
        CurSearch = { link = 'Search' },
        IncSearch = { link = 'CurSearch' },

        Visual = { link = 'Search' },
        -- VisualNC
        VisualNOS = { link = 'Visual' },

        Pmenu = { fg = palette.fg1, bg = palette.bg2 },
        PmenuSel = { bg = palette.bg3 },
        PmenuKind = { link = 'Pmenu' },
        PmenuKindSel = { link = 'PmenuSel' },
        PmenuExtra = { link = 'Pmenu' },
        PmenuExtraSel = { link = 'PmenuSel' },
        PmenuSbar = { link = 'Pmenu' },

        DiffAdd = { fg = palette.fg1 },
        DiffChange = { fg = palette.fg2 },
        DiffDelete = { fg = palette.fg3 },
        DiffText = { fg = palette.fg4 },

        Boolean = { link = 'Normal' },
        Character = { link = 'Normal' },
        Comment = { fg = palette.bg4 },
        Conditional = { link = 'Normal' },
        Constant = { link = 'Normal' },
        Delimiter = { link = 'Normal' },
        Float = { link = 'Normal' },
        Function = { link = 'Normal' },
        Identifier = { link = 'Normal' },
        Number = { link = 'Normal' },
        Operator = { link = 'Normal' },
        Special = { link = 'Normal' },
        String = { fg = palette.fg3 },
        Statement = { link = 'Normal' },
        Variable = { link = 'Normal' },
    }
end

return M
