local M = {}

function M.highlight(palette, opts)
    return {
        -- TODO:
        -- Need to identify these highlight groups
        VisualNC = { fg = '#ff0000' },
        -- TODO:

        Normal = { fg = palette.fg1 },
        Bold = { bold = true },
        Italic = { italic = false },

        CursorLine = { bg = palette.bg2 },
        CursorColumn = { link = 'CursorLine' },
        CursorLineNr = { fg = palette.bg5 },
        CursorLineSign = { link = 'SignColumn' },
        CursorLineFold = { link = 'FoldColumn' },

        MatchParen = { fg = palette.fg4 },

        LineNr = { fg = palette.bg4 },
        LineNrAbove = { link = 'LineNr' },
        LineNrBelow = { link = 'LineNr' },

        SignColumn = { fg = palette.bg5 },
        FoldColumn = { link = 'SignColumn' },

        WinSeparator = { fg = palette.bg1 },

        Search = { bg = palette.bg2 },
        CurSearch = { link = 'Search' },
        IncSearch = { link = 'CurSearch' },

        Visual = { link = 'Search' },
        VisualNOS = { link = 'Visual' },

        NormalFloat = { bg = palette.bg2 },
        FloatBorder = { fg = palette.bg4, bg = palette.bg2 },

        Pmenu = { fg = palette.fg1, bg = palette.bg2 },
        PmenuSel = { bg = palette.bg4 },
        PmenuKind = { link = 'Pmenu' },
        PmenuKindSel = { link = 'PmenuSel' },
        PmenuExtra = { link = 'Pmenu' },
        PmenuExtraSel = { link = 'PmenuSel' },
        PmenuThumb = { bg = palette.bg3 },
        PmenuSbar = { bg = palette.bg2 },

        -- information
        Title = { fg = palette.fg1, bold = true },
        Icon = { fg = palette.bg5 },

        -- files / folders
        Directory = { fg = palette.fg4 },
    }
end

return M
