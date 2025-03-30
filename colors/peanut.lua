-- Peanut Colorscheme
--
-- :autocmd BufWritePost <buffer> source %

--stylua: ignore
vim.g.colors_palette = {
    bg         = { dim = "#000000", bright = "#1d1d12" },
    cursorline = { dim = "#1e1010", bright = "#46462b" },

    search     = { dim = "#372e17", bright = "#4b2222" },
    msearch    = { dim = "#66663e", bright = "#66663e" },

    black      = { dim = "#4e4b42", bright = "#69665a", bg = "#424038" },
    red        = { dim = "#cda074", bright = "#d4ae88", bg = "#5a3d20" },
    green      = { dim = "#9e7a58", bright = "#ad8c6e", bg = "#4e3d2c" },
    yellow     = { dim = "#c0a064", bright = "#c8ad7a", bg = "#574523" },
    blue       = { dim = "#a14b31", bright = "#c15a3b", bg = "#5e2c1d" },
    magenta    = { dim = "#734c4d", bright = "#8d5e5f", bg = "#493132" },
    cyan       = { dim = "#979797", bright = "#a5a5a5", bg = "#3d3d3d" },
    white      = { dim = "#a6a18d", bright = "#b2ae9d", bg = "#454236" },
}

local palette = vim.g.colors_palette
local hl = vim.api.nvim_set_hl

-- Custom highlights
hl(0, "Icon", { fg = palette.black.bright })

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

hl(0, "Error", { fg = palette.red.bright })
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
hl(0, "Constant", { fg = palette.red.bright })
hl(0, "Delimiter", { fg = palette.black.dim })
hl(0, "Directory", { fg = palette.blue.bright })
hl(0, "Function", { fg = palette.cyan.dim })
hl(0, "Identifier", { fg = palette.magenta.dim })
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

hl(0, "@variable", { fg = palette.magenta.bright })
