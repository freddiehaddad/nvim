local M = {}

---@diagnostic disable-next-line: unused-local
function M.highlight(palette, opts)
    return {
        Normal = { fg = palette.fg2 },
        Bold = { bold = true },
        Italic = { italic = false },

        Added = { fg = palette.fg3 },
        Changed = { fg = palette.fg4 },
        Removed = { fg = palette.fg5 },
        NonText = { fg = palette.fg1 },

        CursorLine = { bg = palette.bg2 },
        CursorColumn = { link = "CursorLine" },
        CursorLineNr = { fg = palette.fg1 },
        CursorLineSign = { link = "SignColumn" },
        CursorLineFold = { link = "FoldColumn" },

        MatchParen = { fg = palette.fg5 },

        LineNr = { fg = palette.bg4 },
        LineNrAbove = { link = "LineNr" },
        LineNrBelow = { link = "LineNr" },

        SignColumn = { fg = palette.fg1 },
        FoldColumn = { link = "SignColumn" },

        WinSeparator = { fg = palette.bg1 },

        Search = { bg = palette.bg4 },
        CurSearch = { link = "Search" },
        IncSearch = { link = "Search" },

        Visual = { link = "Search" },
        VisualNOS = { link = "Visual" },

        NormalFloat = { bg = palette.bg2 },
        FloatBorder = { fg = palette.fg1, bg = palette.bg2 },

        Pmenu = { fg = palette.fg2, bg = palette.bg2 },
        PmenuSel = { bg = palette.bg3 },
        PmenuKind = { link = "Pmenu" },
        PmenuKindSel = { link = "PmenuSel" },
        PmenuExtra = { link = "Pmenu" },
        PmenuExtraSel = { link = "PmenuSel" },
        PmenuThumb = { bg = palette.bg3 },
        PmenuSbar = { bg = palette.bg2 },

        Special = { fg = palette.fg1 },

        -- information
        Title = { fg = palette.fg2, bold = true },
        Icon = { fg = palette.fg1 },

        -- files / folders
        Directory = { fg = palette.fg1 },

        -- Highlight groups haven't seen used but are defined.
        Error = { bg = palette.fg5, fg = palette.bg1 },
        NvimInternalError = { link = "Error" },
        Question = { fg = palette.fg1 },
        VisualNC = { fg = "#ff0000" },
    }
end

return M
