local M = {}

---@diagnostic disable-next-line: unused-local
function M.highlight(palette, opts)
    return {
        Normal = { fg = palette.white },
        Bold = { bold = true },
        Italic = { italic = false },

        Added = { fg = palette.green },
        Changed = { fg = palette.yellow },
        Removed = { fg = palette.red },
        NonText = { fg = palette.blue },

        CursorLine = { bg = palette.bg2 },
        CursorColumn = { link = "CursorLine" },
        CursorLineNr = { fg = palette.blue },
        CursorLineSign = { link = "SignColumn" },
        CursorLineFold = { link = "FoldColumn" },

        MatchParen = { fg = palette.red },

        LineNr = { fg = palette.accent },
        LineNrAbove = { link = "LineNr" },
        LineNrBelow = { link = "LineNr" },

        SignColumn = { fg = palette.blue },
        FoldColumn = { link = "SignColumn" },

        WinSeparator = { fg = palette.bg1 },

        Search = { bg = palette.accent },
        CurSearch = { link = "Search" },
        IncSearch = { link = "Search" },

        Visual = { link = "Search" },
        VisualNOS = { link = "Visual" },

        NormalFloat = { bg = palette.bg2 },
        FloatBorder = { fg = palette.blue, bg = palette.bg2 },
        FloatTitle = { bg = palette.bg2 },

        Folded = { bg = palette.bg2, fg = palette.blue },
        QuickFixLine = { fg = palette.yellow },

        Pmenu = { fg = palette.white, bg = palette.bg2 },
        PmenuSel = { bg = palette.bg3 },
        PmenuKind = { link = "Pmenu" },
        PmenuKindSel = { link = "PmenuSel" },
        PmenuExtra = { link = "Pmenu" },
        PmenuExtraSel = { link = "PmenuSel" },
        PmenuThumb = { bg = palette.bg3 },
        PmenuSbar = { bg = palette.bg2 },

        Special = { fg = palette.blue },

        -- information
        Title = { fg = palette.white, bold = true },
        Icon = { fg = palette.blue },

        -- files / folders
        Directory = { fg = palette.blue },

        -- Highlight groups haven't seen used but are defined.
        Error = { bg = palette.red, fg = palette.bg1 },
        NvimInternalError = { link = "Error" },
        Question = { fg = palette.blue },
        VisualNC = { fg = "#ff0000" },
    }
end

return M
