-- Peanut Colorscheme
--
-- Dim
-- https://coolors.co/4e4b42-cd9474-9e7a58-c0a064-a14b31-875a5b-979797-a6a18d
--
-- Bright
-- https://coolors.co/635f54-d9af96-b6997c-d0b88b-c56244-a57879-adadad-b7b3a4
--
-- Backgrounds
-- https://coolors.co/37352f-4b2d1b-413325-48391e-4e2518-3d2929-333333-39372d
--
-- Auto reload while customizing theme
-- :autocmd BufWritePost <buffer> source %

local palette = {
    --stylua: ignore start
    bg         = { dim = "#000000", bright = "#1c1c16" },
    cursorline = { dim = "#171c17", bright = "#464630" },

    search     = { dim = "#372e17", bright = "#4b2222" },
    msearch    = { dim = "#66663e", bright = "#66663e" },

    black      = { dim = "#4e4b42", bright = "#635f54", bg = "#37352f" }, -- color 0  8
    red        = { dim = "#cd9474", bright = "#d9af96", bg = "#4b2d1b" }, -- color 1  9
    green      = { dim = "#9e7a58", bright = "#b6997c", bg = "#413325" }, -- color 2 10
    yellow     = { dim = "#c0a064", bright = "#d0b88b", bg = "#48391e" }, -- color 3 11
    blue       = { dim = "#a14b31", bright = "#c56244", bg = "#4e2518" }, -- color 4 12
    magenta    = { dim = "#875a5b", bright = "#a57879", bg = "#3d2929" }, -- color 5 13
    cyan       = { dim = "#979797", bright = "#adadad", bg = "#333333" }, -- color 6 14
    white      = { dim = "#a6a18d", bright = "#b7b3a4", bg = "#39372d" }, -- color 7 15
    --stylua: ignore end
}

local hl = vim.api.nvim_set_hl

-- Palette
hl(0, "Color0", { fg = palette.black.dim })
hl(0, "Color8", { fg = palette.black.bright })
hl(0, "Color16", { bg = palette.black.bg })
hl(0, "Color1", { fg = palette.red.dim })
hl(0, "Color9", { fg = palette.red.bright })
hl(0, "Color17", { bg = palette.red.bg })
hl(0, "Color2", { fg = palette.green.dim })
hl(0, "Color10", { fg = palette.green.bright })
hl(0, "Color18", { bg = palette.green.bg })
hl(0, "Color3", { fg = palette.yellow.dim })
hl(0, "Color11", { fg = palette.yellow.bright })
hl(0, "Color19", { bg = palette.yellow.bg })
hl(0, "Color4", { fg = palette.blue.dim })
hl(0, "Color12", { fg = palette.blue.bright })
hl(0, "Color20", { bg = palette.blue.bg })
hl(0, "Color5", { fg = palette.magenta.dim })
hl(0, "Color13", { fg = palette.magenta.bright })
hl(0, "Color21", { bg = palette.magenta.bg })
hl(0, "Color6", { fg = palette.cyan.dim })
hl(0, "Color14", { fg = palette.cyan.bright })
hl(0, "Color22", { bg = palette.cyan.bg })
hl(0, "Color7", { fg = palette.white.dim })
hl(0, "Color15", { fg = palette.white.bright })
hl(0, "Color23", { bg = palette.white.bg })

-- Custom highlights
hl(0, "Icon", { fg = palette.black.bright })

hl(0, "Info", { fg = palette.cyan.bright, bg = palette.cyan.bg })
hl(0, "Warn", { fg = palette.yellow.bright, bg = palette.yellow.bg })
hl(0, "Error", { fg = palette.red.bright, bg = palette.red.bg })
hl(0, "Debug", { fg = palette.magenta.bright, bg = palette.magenta.bg })
hl(0, "Trace", { fg = palette.yellow.bright, bg = palette.yellow.bg })

hl(0, "MSearchBright", { bg = palette.msearch.bright })

-- Neovim highlights
hl(0, "Normal", { fg = palette.white.dim })

hl(0, "Conceal", { fg = palette.black.dim })
hl(0, "Ignore", {})
hl(0, "Title", { fg = palette.white.bright })
hl(0, "Underlined", { underline = true })

hl(0, "QuickFixLine", { bg = palette.search.dim })

hl(0, "Added", { fg = palette.green.dim })
hl(0, "Changed", { fg = palette.yellow.dim })
hl(0, "Removed", { fg = palette.red.bright })
hl(0, "DiffAdd", { fg = palette.green.dim })
hl(0, "DiffChange", { fg = palette.yellow.dim })
hl(0, "DiffDelete", { fg = palette.red.dim })
hl(0, "DiffText", { bg = palette.cursorline.bright })

hl(0, "ModeMsg", { fg = palette.green.bright })
hl(0, "MoreMsg", { fg = palette.cyan.bright })
hl(0, "ErrorMsg", { fg = palette.red.bright })
hl(0, "WarningMsg", { fg = palette.yellow.bright })
hl(0, "Question", { fg = palette.cyan.bright })

hl(0, "Folded", { bg = palette.black.bg })
hl(0, "FoldColumn", { fg = palette.magenta.dim })

hl(0, "LineNr", { fg = palette.white.dim })
hl(0, "LineNrAbove", { fg = palette.black.dim })
hl(0, "LineNrBelow", { fg = palette.black.dim })

hl(0, "CurSearch", { bg = palette.search.bright })
hl(0, "IncSearch", { bg = palette.search.dim })
hl(0, "MatchParen", { fg = palette.magenta.bright })
hl(0, "Search", { bg = palette.search.dim })
hl(0, "Substitute", { bg = palette.search.dim })
hl(0, "Visual", { bg = palette.search.dim })
hl(0, "VisualNOS", { bg = palette.black.bright })

hl(0, "lCursor", { link = "Cursor" })
hl(0, "Cursor", {})
hl(0, "ColorColumn", { bg = palette.red.bg })
hl(0, "CursorColumn", { link = "CursorLine" })
hl(0, "CursorLine", { bg = palette.cursorline.dim })
hl(0, "CursorLineNr", { fg = palette.blue.dim })
hl(0, "SignColumn", {})
hl(0, "TermCursor", { bg = palette.cursorline.dim })

hl(0, "FloatBorder", { fg = palette.black.dim, bg = palette.bg.bright })
hl(0, "FloatFooter", { link = "FloatTitle" })
hl(0, "FloatTitle", { fg = palette.white.bright, bg = palette.bg.bright })
hl(0, "FloatShadow", {})
hl(0, "FloatShadowThrough", {})
hl(0, "NormalFloat", { link = "Pmenu" })
hl(0, "Pmenu", { bg = palette.bg.bright })
hl(0, "PmenuKind", { link = "Icon" })
hl(0, "PmenuSbar", { link = "Pmenu" })
hl(0, "PmenuSel", { bg = palette.cursorline.bright })
hl(0, "PmenuThumb", { bg = palette.msearch.dim })

hl(0, "StatusLine", {})
hl(0, "StatusLineNC", {})
hl(0, "WinBar", {})
hl(0, "WinBarNC", {})
hl(0, "WinSeparator", {})

hl(0, "NvimInternalError", { bg = palette.red.bright, fg = palette.black.dim })

hl(0, "SpellBad", { fg = palette.red.bright, bg = palette.red.bg })
hl(0, "SpellCap", { fg = palette.yellow.bright, bg = palette.yellow.bg })
hl(0, "SpellLocal", { fg = palette.green.bright, bg = palette.green.bg })
hl(0, "SpellRare", { fg = palette.cyan.bright, bg = palette.cyan.bg })

hl(0, "DiagnosticError", { fg = palette.red.bright })
hl(0, "DiagnosticHint", { fg = palette.magenta.bright })
hl(0, "DiagnosticInfo", { fg = palette.cyan.bright })
hl(0, "DiagnosticOk", { fg = palette.green.bright })
hl(0, "DiagnosticWarn", { fg = palette.yellow.bright })
hl(0, "DiagnosticUnderlineError", { fg = palette.red.bright, undercurl = true })
hl(0, "DiagnosticUnderlineHint", { fg = palette.magenta.bright, undercurl = true })
hl(0, "DiagnosticUnderlineInfo", { fg = palette.cyan.bright, undercurl = true })
hl(0, "DiagnosticUnderlineOk", { fg = palette.green.bright, undercurl = true })
hl(0, "DiagnosticUnderlineWarn", { fg = palette.yellow.bright, undercurl = true })
hl(0, "DiagnosticDeprecated", { fg = palette.red.bright, strikethrough = true })

hl(0, "RedrawDebugClear", { bg = palette.yellow.bg })
hl(0, "RedrawDebugComposed", { bg = palette.green.bg })
hl(0, "RedrawDebugNormal", { bg = palette.white.bg })
hl(0, "RedrawDebugRecompose", { bg = palette.red.bg })

hl(0, "Character", { fg = palette.green.bright })
hl(0, "Comment", { fg = palette.black.bright })
hl(0, "Constant", { fg = palette.yellow.bright })
hl(0, "Delimiter", { fg = palette.black.dim })
hl(0, "Directory", { fg = palette.blue.bright })
hl(0, "Function", { fg = palette.yellow.dim })
hl(0, "Identifier", { fg = palette.cyan.dim })
hl(0, "Keyword", { fg = palette.blue.dim })
hl(0, "NonText", { fg = palette.black.bright })
hl(0, "Number", { link = "Constant" })
hl(0, "Operator", { fg = palette.black.bright })
hl(0, "PreProc", { fg = palette.yellow.dim })
hl(0, "Special", { fg = palette.black.dim })
hl(0, "SpecialKey", { fg = palette.black.dim })
hl(0, "SpecialComment", { fg = palette.black.dim })
hl(0, "Statement", { fg = palette.magenta.dim })
hl(0, "String", { fg = palette.green.dim })
hl(0, "Todo", { link = "SpecialComment" })
hl(0, "Type", { fg = palette.blue.dim })

-- treesitter highlights
hl(0, "@module", { fg = palette.magenta.bright })
hl(0, "@variable", { fg = palette.white.dim })
hl(0, "@function.builtin", { fg = palette.yellow.bright })

-- semantic tokens
