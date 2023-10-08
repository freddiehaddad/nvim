local M = {}

---@diagnostic disable-next-line: unused-local
function M.highlight(palette, opts)
    return {
        Normal = { fg = palette.white },
        Bold = { bold = false },
        Italic = { italic = false },

        Added = { fg = palette.blue },
        Changed = { fg = palette.black },
        Removed = { fg = palette.red },

        NonText = { fg = palette.accent }, -- Inlay hints

        CursorLine = { bg = palette.bg2 },
        CursorColumn = { link = "CursorLine" },
        CursorLineNr = { fg = palette.black },
        CursorLineSign = { link = "SignColumn" },
        CursorLineFold = { link = "FoldColumn" },

        MatchParen = { fg = palette.accent },

        LineNr = { fg = palette.accent },
        LineNrAbove = { link = "LineNr" },
        LineNrBelow = { link = "LineNr" },

        SignColumn = { fg = palette.accent },
        FoldColumn = { link = "SignColumn" },

        WinSeparator = { fg = palette.bg1 },

        Search = { bg = palette.accent },
        CurSearch = { link = "Search" },
        IncSearch = { link = "Search" },

        Visual = { link = "Search" },
        VisualNOS = { link = "Visual" },

        NormalFloat = { bg = palette.bg2 },
        FloatBorder = { fg = palette.accent, bg = palette.bg2 },
        FloatTitle = { bg = palette.bg2 },

        Folded = { bg = palette.accent, fg = palette.white },
        QuickFixLine = { fg = palette.white },

        Pmenu = { fg = palette.white, bg = palette.bg2 },
        PmenuSel = { fg = palette.white, bg = palette.bg3 },
        PmenuKind = { link = "Pmenu" },
        PmenuKindSel = { link = "PmenuSel" },
        PmenuExtra = { link = "Pmenu" },
        PmenuExtraSel = { link = "PmenuSel" },
        PmenuThumb = { bg = palette.accent },
        PmenuSbar = { bg = palette.bg2 },

        Special = { fg = palette.white },

        -- information
        Title = { fg = palette.white },
        Icon = { fg = palette.accent },

        -- files / folders
        Directory = { fg = palette.white },

        -- Highlight groups haven't seen used but are defined.
        Error = { bg = palette.red, fg = palette.bg1 },
        NvimInternalError = { link = "Error" },
        Question = { fg = palette.white },
        Conceal = { fg = palette.white },
    }
end

return M
