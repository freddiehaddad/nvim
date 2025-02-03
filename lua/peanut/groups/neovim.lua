local M = {}

---@diagnostic disable-next-line: unused-local
function M.highlight(palette, opts)
    return {
        Normal = { fg = palette.white1 },
        Bold = { bold = true },
        Italic = { italic = false },

        Added = { fg = palette.green },
        Changed = { fg = palette.yellow },
        Removed = { fg = palette.red },

        NonText = { fg = palette.yellow }, -- Inlay hints

        CursorLine = { bg = palette.bg2 },
        CursorColumn = { link = "CursorLine" },
        CursorLineNr = { fg = palette.blue1 },
        CursorLineSign = { link = "SignColumn" },
        CursorLineFold = { link = "FoldColumn" },

        MatchParen = { fg = palette.blue1 },

        LineNr = { fg = palette.accent },
        LineNrAbove = { link = "LineNr" },
        LineNrBelow = { link = "LineNr" },

        SignColumn = { fg = palette.blue1 },
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

        Folded = { bg = palette.bg2, fg = palette.blue1 },
        QuickFixLine = { fg = palette.accent },

        Pmenu = { fg = palette.white1, bg = palette.bg2 },
        PmenuSel = { bg = palette.bg3 },
        PmenuKind = { link = "Pmenu" },
        PmenuKindSel = { link = "PmenuSel" },
        PmenuExtra = { link = "Pmenu" },
        PmenuExtraSel = { link = "PmenuSel" },
        PmenuThumb = { bg = palette.bg3 },
        PmenuSbar = { bg = palette.bg2 },

        Special = { fg = palette.blue2 },

        -- information
        Title = { fg = palette.white2, bold = true },
        Icon = { fg = palette.accent },

        -- files / folders
        Directory = { fg = palette.blue2 },

        -- Highlight groups haven't seen used but are defined.
        Error = { bg = palette.red, fg = palette.bg1 },
        NvimInternalError = { link = "Error" },
        Question = { fg = palette.blue2 },
        VisualNC = { fg = "#ff0000" },
    }
end

return M
