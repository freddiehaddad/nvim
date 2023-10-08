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

        NonText = { fg = palette.yellow }, -- Inlay hints

        CursorLine = { bg = palette.bg2 },
        CursorColumn = { link = "CursorLine" },
        CursorLineNr = { fg = palette.blue },
        CursorLineSign = { link = "SignColumn" },
        CursorLineFold = { link = "FoldColumn" },

        MatchParen = { fg = palette.black },

        LineNr = { fg = palette.accent },
        LineNrAbove = { link = "LineNr" },
        LineNrBelow = { link = "LineNr" },

        SignColumn = { fg = palette.accent },
        FoldColumn = { link = "SignColumn" },

        WinSeparator = { fg = palette.bg2 },

        Search = { bg = palette.accent },
        CurSearch = { link = "Search" },
        IncSearch = { link = "Search" },

        Visual = { link = "Search" },
        VisualNOS = { link = "Visual" },

        NormalFloat = { bg = palette.bg2 },
        FloatBorder = { fg = palette.accent, bg = palette.bg2 },
        FloatTitle = { bg = palette.bg2 },

        Folded = { bg = palette.bg2, fg = palette.accent },
        QuickFixLine = { fg = palette.accent },

        Pmenu = { fg = palette.white, bg = palette.bg2 },
        PmenuSel = { bg = palette.bg3 },
        PmenuKind = { link = "Pmenu" },
        PmenuKindSel = { link = "PmenuSel" },
        PmenuExtra = { link = "Pmenu" },
        PmenuExtraSel = { link = "PmenuSel" },
        PmenuThumb = { bg = palette.bg3 },
        PmenuSbar = { bg = palette.bg2 },

        Special = { fg = palette.white },

        -- information
        Title = { fg = palette.white, bold = true },
        Icon = { fg = palette.accent },

        -- files / folders
        Directory = { fg = palette.blue },

        -- Highlight groups haven't seen used but are defined.
        Error = { bg = palette.red, fg = palette.bg1 },
        NvimInternalError = { link = "Error" },
        Question = { fg = palette.blue },
        Conceal = { fg = palette.black },
    }
end

return M
