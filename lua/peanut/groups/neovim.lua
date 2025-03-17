local M = {}

---@diagnostic disable-next-line: unused-local
function M.highlight(palette, opts)
    return {
        Normal = { fg = palette.white },
        Bold = { bold = false },
        Italic = { italic = false },

        Added = { fg = palette.blue },
        Changed = { fg = palette.cyan },
        Removed = { fg = palette.red },

        NonText = { fg = palette.accent }, -- Inlay hints

        CursorLine = { bg = palette.cl1 },
        CursorColumn = { link = "CursorLine" },
        CursorLineNr = { fg = palette.white },
        CursorLineSign = { link = "SignColumn" },
        CursorLineFold = { link = "FoldColumn" },

        MatchParen = { fg = palette.cyan },

        LineNr = { fg = palette.accent },
        LineNrAbove = { link = "LineNr" },
        LineNrBelow = { link = "LineNr" },

        SignColumn = { fg = palette.accent },
        FoldColumn = { fg = "#ff0000", bg = "#ff0000" },
        Folded = { bg = palette.bg2 },
        QuickFixLine = { fg = palette.white },

        WinSeparator = { fg = palette.bg1 },

        Search = { bg = palette.search },
        CurSearch = { link = "Search" },
        IncSearch = { link = "Search" },

        Visual = { link = "Search" },
        VisualNOS = { link = "Visual" },

        NormalFloat = { bg = palette.bg2 },
        FloatBorder = { fg = palette.accent, bg = palette.bg2 },
        FloatTitle = { bg = palette.bg2 },

        Pmenu = { fg = palette.white, bg = palette.bg2 },
        PmenuSel = { fg = palette.white, bg = palette.cl2 },
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
        MoreMsg = { fg = palette.blue },
        ModeMsg = { fg = palette.cyan },

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
