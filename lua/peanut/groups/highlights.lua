local M = {}

function M.highlight(palette, opts)
    return {
        -- TODO:
        -- Need to identify these highlight groups
        PmenuThumb = { fg = '#ff0000' },
        VisualNC = { fg = '#ff0000' },
        -- TODO:

        Normal = { fg = palette.fg1 },
        Bold = { bold = true },
        Italic = { italic = false },

        CursorLine = { bg = palette.bg2 },
        CursorColumn = { link = 'CursorLine' },
        CursorLineNr = { fg = palette.bg4 },
        CursorLineSign = { link = 'SignColumn' },
        CursorLineFold = { link = 'FoldColumn' },

        --MatchParen     xxx cterm=bold,underline gui=bold guibg=NvimDarkGrey4

        LineNr = { fg = palette.bg3 },
        LineNrAbove = { link = 'LineNr' },
        LineNrBelow = { link = 'LineNr' },

        SignColumn = { fg = palette.bg4 },
        FoldColumn = { link = 'SignColumn' },

        WinSeparator = { fg = palette.bg1 },

        Search = { bg = palette.bg2 },
        CurSearch = { link = 'Search' },
        IncSearch = { link = 'CurSearch' },

        Visual = { link = 'Search' },
        VisualNOS = { link = 'Visual' },

        NormalFloat = { bg = palette.bg2 },
        Pmenu = { fg = palette.fg1, bg = palette.bg2 },
        PmenuSel = { bg = palette.bg3 },
        PmenuKind = { link = 'Pmenu' },
        PmenuKindSel = { link = 'PmenuSel' },
        PmenuExtra = { link = 'Pmenu' },
        PmenuExtraSel = { link = 'PmenuSel' },
        PmenuSbar = { link = 'Pmenu' },

        Title = { fg = palette.fg1, bold = true },
        Icon = { fg = palette.bg4 },

        -- files / folders
        Directory = { fg = palette.fg4 },

        -- code
        Type = { fg = palette.fg1 },
        Boolean = { fg = palette.fg1 },
        Character = { fg = palette.fg1 },
        Float = { fg = palette.fg1 },

        Constant = { fg = palette.fg3 },
        Identifier = { fg = palette.fg3 },
        Number = { fg = palette.fg3 },
        String = { fg = palette.fg3 },

        Struct = { fg = palette.fg2 },
        Structure = { link = 'Struct' },

        Keyword = { fg = palette.fg2 },

        Todo = { fg = palette.fg1 },
        Conditional = { fg = palette.bg4 },
        Delimiter = { fg = palette.bg4 },
        Operator = { fg = palette.bg4 },
        Comment = { fg = palette.bg4 },

        Exception = { fg = palette.fg1 },
        Function = { fg = palette.fg2 },
        Statement = { fg = palette.fg3 },
        Variable = { fg = palette.fg4 },

        Label = { fg = palette.bg3 },

        Special = { link = 'Normal' },
        Repeat = { link = 'Normal' },
        Include = { link = 'Normal' },
        PreProc = { link = 'Normal' },
        Define = { link = 'Normal' },
        Macro = { link = 'Normal' },
        PreCondit = { link = 'Normal' },
        StorageClass = { link = 'Normal' },
        Typedef = { link = 'Normal' },
        Method = { link = 'Normal' },
    }
end

return M
