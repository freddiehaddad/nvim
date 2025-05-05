-- Peanut Colorscheme
--
-- Based off of Jellybean
--
-- Auto reload while customizing theme
--
-- :autocmd BufWritePost <buffer> source %

-- Reset
vim.cmd("highlight clear")
vim.cmd("syntax reset")
vim.o.background = "dark"
vim.o.termguicolors = true
vim.g.colors_name = "peanut"

local util = {}

util.bg = "#000000"
util.fg = "#ffffff"

local function rgb(c)
    c = string.lower(c)
    return { tonumber(c:sub(2, 3), 16), tonumber(c:sub(4, 5), 16), tonumber(c:sub(6, 7), 16) }
end

function util.blend(foreground, alpha, background)
    alpha = type(alpha) == "string" and (tonumber(alpha, 16) / 0xff) or alpha
    local bg = rgb(background)
    local fg = rgb(foreground)

    local blendChannel = function(i)
        local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
        return math.floor(math.min(math.max(0, ret), 255) + 0.5)
    end

    return string.format("#%02x%02x%02x", blendChannel(1), blendChannel(2), blendChannel(3))
end
function util.blend_fg(hex, amount, fg)
    return util.blend(hex, amount, fg or util.fg)
end

util.lighten = util.blend_fg

function util.blend_bg(hex, amount, bg)
    return util.blend(hex, amount, bg or util.bg)
end
util.darken = util.blend_bg

-- Palette (standard)
local palette = {
    --stylua: ignore start
    foreground    = "#e8e8d3",
    background    = "#151515",

    grey          = "#888888",
    grey_one      = "#1c1c1c",
    grey_two      = "#f0f0f0",
    grey_three    = "#333333",
    regent_grey   = "#9098A0",
    scorpion      = "#606060",
    cod_grey      = "#101010",
    tundora       = "#404040",
    zambezi       = "#605958",
    silver_rust   = "#ccc5c4",
    silver        = "#c7c7c7",
    alto          = "#dddddd",
    gravel        = "#403c41",
    boulder       = "#777777",
    cocoa_brown   = "#302028",
    grey_chateau  = "#a0a8b0",
    bright_grey   = "#384048",
    shuttle_grey  = "#535d66",
    mine_shaft    = "#1f1f1f",
    temptress     = "#40000a",
    bayoux_blue   = "#556779",
    total_white   = "#ffffff",
    total_black   = "#000000",
    cadet_blue    = "#b0b8c0",
    perano        = "#b0d0f0",
    wewak         = "#cc88a3",
    mantis        = "#70b950",
    raw_sienna    = "#d98870",
    highland      = "#799d6a",
    hoki          = "#668799",
    green_smoke   = "#99ad6a",
    costa_del_sol = "#556633",
    biloba_flower = "#c6b6ee",
    morning_glory = "#8fbfdc",
    goldenrod     = "#fad07a",
    ship_cove     = "#8197bf",
    koromiko      = "#e6a75a",
    brandy        = "#dad085",
    old_brick     = "#902020",
    dark_blue     = "#0000df",
    ripe_plum     = "#540063",
    casal         = "#2D7067",
    purple        = "#700089",
    tea_green     = "#d2ebbe",
    dell          = "#437019",
    calypso       = "#2B5B77",
    black_olive   = "#333d1f",
    caput_mortuum = "#561313",

    error         = "#da1c00",
    warning       = "#ffaf00",
    info          = "#87d7ff",
    hint          = "#d7af87",
    ok            = "#afd787",
    --stylua: ignore end
}

palette.cursor_line = {
    bg = util.lighten("#001520", 0.90),
}

palette.cursor_line_nr = {
    fg = palette.silver_rust,
}

palette.git = {
    add = palette.black_olive,
    delete = palette.caput_mortuum,
    change = palette.grey_one,
    text = palette.grey_three,
}

palette.diag = {
    error = palette.error,
    warning = palette.warning,
    info = palette.info,
    hint = palette.hint,
    ok = palette.ok,
}

palette.visual = palette.tundora
palette.none = "NONE"

palette.float_bg = palette.cocoa_brown
palette.float_border = palette.zambezi

-- Palette (muted)
-- local palette = {
--     --stylua: ignore start
--     foreground    = "#c2beb0", -- Desaturated muted foreground
--     background    = "#101010", -- Slightly warmer muted background
--
--     grey          = "#7a7a7a", -- Less saturated grey
--     grey_one      = "#1e1e1c", -- Warmer grey
--     grey_two      = "#e9e5dc", -- Muted off-white
--     grey_three    = "#302e2c", -- Warmer dark grey
--     regent_grey   = "#8a8c91", -- Less saturated
--     scorpion      = "#585855", -- Desaturated
--     cod_grey      = "#121210", -- Warmer dark
--     tundora       = "#3c3b38", -- Warmer mid-tone
--     zambezi       = "#58534f", -- Less saturated brown-grey
--     silver_rust   = "#c2bdb8", -- Desaturated light tone
--     silver        = "#bebebe", -- Desaturated silver
--     alto          = "#d8d4ca", -- Muted light tone
--     gravel        = "#3c3936", -- Warmer dark tone
--     boulder       = "#6f6f6c", -- Desaturated mid-grey
--     cocoa_brown   = "#2c2824", -- Warmer brown
--     grey_chateau  = "#93989c", -- Desaturated blue-grey
--     bright_grey   = "#353b3e", -- Desaturated blue-grey
--     shuttle_grey  = "#4d5459", -- Desaturated blue-grey
--     mine_shaft    = "#1d1c1a", -- Warmer dark
--     temptress     = "#38100a", -- Desaturated dark red
--     bayoux_blue   = "#4f5c69", -- Desaturated blue
--     total_white   = "#d1cdc6", -- Warm white muted
--     total_black   = "#0d0c0b", -- Warm black
--     cadet_blue    = "#a5acb1", -- Desaturated blue
--     perano        = "#a6c3d9", -- Desaturated light blue
--     wewak         = "#bd8695", -- Desaturated pink
--     mantis        = "#6aa84c", -- Desaturated green
--     raw_sienna    = "#c88a77", -- Desaturated orange
--     highland      = "#73916a", -- Desaturated green
--     hoki          = "#617b87", -- Desaturated blue
--     green_smoke   = "#909c6e", -- Desaturated yellow-green
--     costa_del_sol = "#4e5a3a", -- Desaturated olive
--     biloba_flower = "#b8aed3", -- Desaturated purple
--     morning_glory = "#83adc3", -- Desaturated light blue
--     goldenrod     = "#e8c88c", -- Desaturated gold
--     ship_cove     = "#7a8aa6", -- Desaturated blue
--     koromiko      = "#d8a16c", -- Desaturated orange
--     brandy        = "#c9c08c", -- Desaturated yellow
--     old_brick     = "#893124", -- Desaturated brick red
--     dark_blue     = "#1e1e7a", -- Desaturated dark blue
--     ripe_plum     = "#4a1c4f", -- Desaturated plum
--     casal         = "#2a5c56", -- Desaturated teal
--     purple        = "#5c1e68", -- Desaturated purple
--     tea_green     = "#c5d3b2", -- Desaturated light green
--     dell          = "#3c5c25", -- Desaturated forest green
--     calypso       = "#28505f", -- Desaturated teal
--     black_olive   = "#2e3824", -- Desaturated olive green
--     caput_mortuum = "#4d201b", -- Desaturated maroon
--
--     error         = "#cc4d4d", -- Desaturated red
--     warning       = "#d9a45a", -- Desaturated orange
--     info          = "#7db7cc", -- Desaturated blue
--     hint          = "#c0a48c", -- Desaturated tan
--     ok            = "#98b67c", -- Desaturated green
--     --stylua: ignore end
-- }

-- palette.cursor_line = {
--     bg = util.lighten(palette.background, 0.85),
-- }
--
-- palette.cursor_line_nr = {
--     fg = palette.silver_rust,
-- }
--
-- palette.git = {
--     add = palette.black_olive, -- Less saturated
--     delete = palette.caput_mortuum, -- Less saturated
--     change = palette.grey_one,
--     text = palette.grey_three,
-- }
--
-- palette.diag = {
--     error = palette.error,
--     warning = palette.warning,
--     info = palette.info,
--     hint = palette.hint,
--     ok = palette.ok,
-- }
--
-- palette.visual = palette.tundora
-- palette.none = "NONE"
--
-- palette.float_bg = palette.cocoa_brown
-- palette.float_border = palette.zambezi

-- Highlights
local hl = vim.api.nvim_set_hl
local c = palette

-- Create colors palette
local index = 0
for name, color in pairs(c) do
    if type(color) == "string" and name ~= "none" then
        hl(0, string.format("%02d_%s", index, name), { fg = color, bg = color })
        index = index + 1
    end
end

-- core
hl(0, "Normal", { bg = c.background, fg = c.foreground })
hl(0, "NormalFloat", { bg = c.float_bg })
hl(0, "NormalNC", { fg = c.foreground })
hl(0, "FloatBorder", { bg = palette.float_bg, fg = c.float_bg }) -- hide the border
hl(0, "FloatTitle", { bg = c.float_bg, fg = c.morning_glory })
hl(0, "ColorColumn", { bg = c.total_black })
hl(0, "Conceal", { fg = c.morning_glory })
hl(0, "Cursor", { bg = c.alto, fg = c.background })
hl(0, "CurSearch", { bg = c.koromiko, fg = c.mine_shaft })
hl(0, "IncSearch", { bg = c.koromiko, fg = c.mine_shaft })
hl(0, "CursorColumn", { bg = c.grey_one })
hl(0, "CursorLine", { bg = c.cursor_line.bg })
hl(0, "CursorLineNr", { bg = c.cursor_line_nr.bg })
hl(0, "Directory", { fg = c.brandy })
hl(0, "DiffAdd", { bg = c.git.add })
hl(0, "DiffChange", { bg = c.git.change })
hl(0, "DiffDelete", { bg = c.git.delete })
hl(0, "DiffText", { bg = c.git.text })
hl(0, "Error", { fg = c.error })
hl(0, "ErrorMsg", { fg = c.error })
hl(0, "VertSplit", { fg = c.gravel })
hl(0, "Folded", { fg = c.grey_chateau, bg = c.bright_grey })
hl(0, "FoldColumn", { fg = c.shuttle_grey })
hl(0, "SignColumn", { fg = c.boulder })
hl(0, "LineNr", { fg = c.zambezi })
hl(0, "MatchParen", { fg = c.wewak, bold = true })
hl(0, "NonText", { fg = c.scorpion })
hl(0, "Pmenu", { bg = c.grey_three })
hl(0, "PmenuKind", { fg = c.regent_grey })
hl(0, "PmenuSel", { bg = c.calypso, bold = true })
hl(0, "PmenuThumb", { bg = c.regent_grey })
hl(0, "Question", { fg = c.mantis })
hl(0, "QuickFixLine", { bg = c.bright_grey })
hl(0, "Search", { fg = c.wewak, bg = c.cocoa_brown })
hl(0, "SpecialKey", { fg = c.tundora, bg = c.grey_one })
hl(0, "SpellBad", { sp = c.error, undercurl = true })
hl(0, "SpellCap", { sp = c.old_brick, undercurl = true })
hl(0, "SpellLocal", { sp = c.hoki, undercurl = true })
hl(0, "SpellRare", { sp = c.hoki, undercurl = true })
hl(0, "StatusLine", { fg = c.zambezi })
hl(0, "StatusLineNC", { link = "StatusLine" })
hl(0, "TabLine", { fg = c.cadet_blue })
hl(0, "TabLineFill", { fg = c.regent_grey })
hl(0, "TabLineSel", { fg = c.mantis })
hl(0, "Title", { fg = c.mantis })
hl(0, "Visual", { bg = c.visual })
hl(0, "WinBar", { bg = c.visual })
hl(0, "WinBarNC", { bg = c.visual })
hl(0, "WinSeparator", { fg = c.grey_one })

hl(0, "Added", { fg = c.mantis })
hl(0, "Changed", { fg = c.koromiko })
hl(0, "Removed", { fg = c.old_brick })

hl(0, "GitSignsAddVirtLnInLine", { bg = c.git.add })
hl(0, "GitSignsChangeVirtLnInLine", { bg = c.git.change })
hl(0, "GitSignsDeleteVirtLnInLine", { bg = c.git.delete })

hl(0, "ModeMsg", { fg = c.highland })
hl(0, "MoreMsg", { fg = c.info })
hl(0, "WarningMsg", { fg = c.diag.warning })

hl(0, "DiagnosticError", { fg = c.diag.error })
hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = c.diag.error })
hl(0, "DiagnosticWarn", { fg = c.diag.warning })
hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = c.diag.warning })
hl(0, "DiagnosticInfo", { fg = c.diag.info })
hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = c.diag.info })
hl(0, "DiagnosticHint", { fg = c.diag.hint })
hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = c.diag.hint })
hl(0, "DiagnosticOk", { fg = c.diag.ok })
hl(0, "DiagnosticUnderlineOk", { undercurl = true, sp = c.diag.ok })
hl(0, "DiagnosticUnnecessary", { fg = c.grey, undercurl = true })

-- syntax
hl(0, "Bold", { bold = true })
hl(0, "Comment", { fg = c.grey })
hl(0, "Constant", { fg = c.raw_sienna })
hl(0, "Define", { fg = c.ship_cove })
hl(0, "Delimiter", { fg = c.hoki })
hl(0, "Error", { bg = c.error })
hl(0, "Exception", { fg = c.wewak })
hl(0, "Function", { fg = util.lighten(c.goldenrod, 0.9) })
hl(0, "Identifier", { fg = c.foreground })
hl(0, "Include", { fg = c.perano, italic = true })
hl(0, "Italic", { italic = true })
hl(0, "Operator", { fg = c.perano })
hl(0, "PreProc", { fg = c.ship_cove })
hl(0, "Property", { fg = c.foreground, italic = true })
hl(0, "Special", { fg = c.biloba_flower })
hl(0, "SpecialChar", { fg = c.raw_sienna })
hl(0, "Statement", { fg = c.morning_glory })
hl(0, "String", { fg = c.green_smoke })
hl(0, "Structure", { fg = c.morning_glory })
hl(0, "Todo", { fg = c.silver })
hl(0, "Type", { fg = c.koromiko, italic = true })
hl(0, "Underlined", { undercurl = true })
hl(0, "Variable", { fg = c.alto })

-- LSP
hl(0, "LspDiagnosticsDefaultError", { fg = c.error })
hl(0, "LspDiagnosticsDefaultWarning", { fg = c.koromiko })
hl(0, "LspDiagnosticsDefaultInformation", { fg = c.perano })
hl(0, "LspDiagnosticsDefaultHint", { fg = c.tea_green })
hl(0, "LspReferenceRead", { bg = c.cocoa_brown })
hl(0, "LspReferenceWrite", { bg = c.cocoa_brown })
hl(0, "LspReferenceText", { bg = c.cocoa_brown })

-- semantic tokens
hl(0, "@lsp.type.boolean", { link = "@boolean" })
hl(0, "@lsp.type.builtinType", { link = "@type.builtin" })
hl(0, "@lsp.type.comment", { link = "@comment" })
hl(0, "@lsp.type.decorator", {})
hl(0, "@lsp.type.decorator.rust", {})
hl(0, "@lsp.type.deriveHelper", { link = "@attribute" })
hl(0, "@lsp.type.enum", { link = "@type" })
hl(0, "@lsp.type.enumMember", { link = "@constant" })
hl(0, "@lsp.type.escapeSequence", { link = "@string.escape" })
hl(0, "@lsp.type.formatSpecifier", { link = "SpecialChar" })
hl(0, "@lsp.type.generic", { link = "@variable" })
hl(0, "@lsp.type.keyword", { link = "@keyword" })
hl(0, "@lsp.type.keyword.go", {})
hl(0, "@lsp.type.lifetime", { link = "@keyword.storage" })
hl(0, "@lsp.type.namespace", { link = "@module" })
hl(0, "@lsp.type.namespace.go", { fg = c.alto, italic = true })
hl(0, "@lsp.type.namespace.python", { link = "@module" })
hl(0, "@lsp.type.number", { link = "@number" })
hl(0, "@lsp.type.operator", { link = "@operator" })
hl(0, "@lsp.type.parameter", { link = "@variable.parameter" })
hl(0, "@lsp.type.property", { link = "@property" })
hl(0, "@lsp.type.property.terraform", { italic = true })
hl(0, "@lsp.type.selfKeyword", { link = "@variable.builtin" })
hl(0, "@lsp.type.selfTypeKeyword", { link = "@variable.builtin" })
hl(0, "@lsp.type.string", {}) -- use treesitter styles for string
hl(0, "@lsp.type.typeAlias", { link = "@type.definition" })
hl(0, "@lsp.type.variable", {}) -- use treesitter styles for regular variable
hl(0, "@lsp.typemod.class.defaultLibrary", { link = "@type.builtin" })
hl(0, "@lsp.typemod.class.defaultLibrary.python", { italic = true })
hl(0, "@lsp.typemod.enum.defaultLibrary", { link = "@type.builtin" })
hl(0, "@lsp.typemod.enumMember.defaultLibrary", { link = "@constant.builtin" })
hl(0, "@lsp.typemod.function.defaultLibrary", { link = "@function.builtin" })
hl(0, "@lsp.typemod.keyword.async", { link = "@keyword.coroutine" })
hl(0, "@lsp.typemod.keyword.injected", { link = "@keyword" })
hl(0, "@lsp.typemod.macro.defaultLibrary", { link = "@function.builtin" })
hl(0, "@lsp.typemod.method.defaultLibrary", { link = "@function.builtin" })
hl(0, "@lsp.typemod.method.defaultLibrary.rust", { link = "Function" })
hl(0, "@lsp.typemod.operator.injected", { link = "@operator" })
hl(0, "@lsp.typemod.string.injected", { link = "@string" })
hl(0, "@lsp.typemod.struct.defaultLibrary", { link = "@type.builtin" })
hl(0, "@lsp.typemod.struct.defaultLibrary.rust", { link = "Type" })
hl(0, "@lsp.type.builtinType.rust", { link = "Type" })
hl(0, "@lsp.typemod.variable.callable", { link = "@function" })
hl(0, "@lsp.typemod.variable.defaultLibrary", { link = "@variable.builtin" })
hl(0, "@lsp.typemod.variable.injected", { link = "@variable" })
hl(0, "@lsp.typemod.variable.static", { link = "@constant" })

hl(0, "LspKindArray", { link = "@punctuation.bracket" })
hl(0, "LspKindBoolean", { link = "@boolean" })
hl(0, "LspKindClass", { link = "@type" })
hl(0, "LspKindColor", { link = "Special" })
hl(0, "LspKindConstant", { link = "@constant" })
hl(0, "LspKindConstructor", { link = "@constructor" })
hl(0, "LspKindEnum", { link = "@lsp.type.enum" })
hl(0, "LspKindEnumMember", { link = "@lsp.type.enumMember" })
hl(0, "LspKindEvent", { link = "Special" })
hl(0, "LspKindField", { link = "@variable.member" })
hl(0, "LspKindFile", { link = "Normal" })
hl(0, "LspKindFolder", { link = "Directory" })
hl(0, "LspKindFunction", { link = "@function" })
hl(0, "LspKindInterface", { link = "@lsp.type.interface" })
hl(0, "LspKindKey", { link = "@variable.member" })
hl(0, "LspKindKeyword", { link = "@lsp.type.keyword" })
hl(0, "LspKindMethod", { link = "@function.method" })
hl(0, "LspKindModule", { link = "@module" })
hl(0, "LspKindNamespace", { link = "@module" })
hl(0, "LspKindNull", { link = "@constant.builtin" })
hl(0, "LspKindNumber", { link = "@number" })
hl(0, "LspKindObject", { link = "@constant" })
hl(0, "LspKindOperator", { link = "@operator" })
hl(0, "LspKindPackage", { link = "@module" })
hl(0, "LspKindProperty", { link = "@property" })
hl(0, "LspKindReference", { link = "@markup.link" })
hl(0, "LspKindSnippet", { link = "Conceal" })
hl(0, "LspKindString", { link = "@string" })
hl(0, "LspKindStruct", { link = "@lsp.type.struct" })
hl(0, "LspKindText", { link = "@markup" })
hl(0, "LspKindTypeParameter", { link = "@lsp.type.typeParameter" })
hl(0, "LspKindUnit", { link = "@lsp.type.struct" })
hl(0, "LspKindValue", { link = "@string" })
hl(0, "LspKindVariable", { link = "@variable" })

-- treesitter
hl(0, "@annotation", { link = "PreProc" })
hl(0, "@attribute", { link = "PreProc" })
hl(0, "@boolean", { link = "Boolean" })
hl(0, "@character", { link = "Character" })
hl(0, "@character.printf", { link = "SpecialChar" })
hl(0, "@character.special", { link = "SpecialChar" })
hl(0, "@comment", { link = "Comment" })
hl(0, "@constant", { link = "Constant" })
hl(0, "@constant.builtin", { link = "Define" })
hl(0, "@constant.macro", { link = "Define" })
hl(0, "@constructor.python", { link = "Type" })
hl(0, "@diff.delta", { link = "DiffChange" })
hl(0, "@diff.minus", { link = "DiffDelete" })
hl(0, "@diff.plus", { link = "DiffAdd" })
hl(0, "@function", { link = "Function" })
hl(0, "@function.builtin", { link = "Special" })
hl(0, "@function.call", { link = "@function" })
hl(0, "@function.macro", { link = "Macro" })
hl(0, "@function.method", { link = "Function" })
hl(0, "@function.htmldjango", { link = "Function" })
hl(0, "@function.method.call", { link = "@function.method" })
hl(0, "@keyword", { fg = c.biloba_flower })
hl(0, "@keyword.conditional", { link = "Conditional" })
hl(0, "@keyword.conditional.htmldjango", { link = "@function.method" })
hl(0, "@keyword.coroutine", { link = "@keyword" })
hl(0, "@keyword.debug", { link = "Debug" })
hl(0, "@keyword.directive", { link = "PreProc" })
hl(0, "@keyword.directive.define", { link = "Define" })
hl(0, "@keyword.exception", { link = "Exception" })
hl(0, "@keyword.function", { fg = c.biloba_flower }) -- For keywords used to define a function.
hl(0, "@keyword.function.go", { fg = c.biloba_flower }) -- For keywords used to define a function.
hl(0, "@keyword.import", { link = "Include" })
hl(0, "@keyword.import.python", { fg = c.biloba_flower })
hl(0, "@keyword.operator", { link = "@operator" })
hl(0, "@keyword.repeat", { link = "Repeat" })
hl(0, "@keyword.return", { fg = c.wewak })
hl(0, "@keyword.return.go", { fg = c.wewak })
hl(0, "@keyword.storage", { link = "StorageClass" })
hl(0, "@label", { fg = c.morning_glory }) -- For labels: `label:` in C and `:label:` in Lua.
hl(0, "@markup", { link = "@none" })
hl(0, "@markup.emphasis", { italic = true })
hl(0, "@markup.environment", { link = "Macro" })
hl(0, "@markup.environment.name", { link = "Type" })
hl(0, "@markup.heading", { link = "Title" })
hl(0, "@markup.raw.markdown_inline", { fg = c.koromiko })
hl(0, "@markup.heading.1.markdown", { link = "RenderMarkdownH1Bg" })
hl(0, "@markup.heading.2.markdown", { link = "RenderMarkdownH2Bg" })
hl(0, "@markup.heading.3.markdown", { link = "RenderMarkdownH3Bg" })
hl(0, "@markup.heading.4.markdown", { link = "RenderMarkdownH4Bg" })
hl(0, "@markup.heading.5.markdown", { link = "RenderMarkdownH5Bg" })
hl(0, "@markup.heading.6.markdown", { link = "RenderMarkdownH6Bg" })
hl(0, "@markup.italic", { italic = true })
hl(0, "@markup.link", { fg = c.tea_green })
hl(0, "@markup.link.label", { link = "SpecialChar" })
hl(0, "@markup.link.label.symbol", { link = "Identifier" })
hl(0, "@markup.link.url", { link = "Underlined" })
hl(0, "@markup.list", { fg = c.morning_glory }) -- For special punctutation that does not fall in the categories before.
hl(0, "@markup.list.checked", { fg = c.tea_green }) -- For brackets and parens.
hl(0, "@markup.list.markdown", { fg = c.raw_sienna, bold = true })
hl(0, "@markup.list.unchecked", { fg = c.ship_cove }) -- For brackets and parens.
hl(0, "@markup.math", { link = "Special" })
hl(0, "@markup.raw", { link = "String" })
hl(0, "@markup.strikethrough", { strikethrough = true })
hl(0, "@markup.strong", { fg = c.wewak, bold = true })
hl(0, "@markup.underline", { underline = true })
hl(0, "@module", { link = "Include" })
hl(0, "@module.go", { link = "Indentifier" })
hl(0, "@module.builtin", { fg = c.wewak }) -- Variable names that are defined by the languages, like `this` or `self`.
hl(0, "@namespace.builtin", { link = "@variable.builtin" })
hl(0, "@none", {})
hl(0, "@number", { link = "Number" })
hl(0, "@number.float", { link = "Float" })
hl(0, "@operator", { link = "Operator" })
hl(0, "@property", { link = "Property" })
hl(0, "@property.toml", { link = "Operator" })
hl(0, "@punctuation.bracket", { fg = c.morning_glory }) -- For brackets and parens.
hl(0, "@punctuation.delimiter", { fg = c.morning_glory }) -- For delimiters ie: `.`
hl(0, "@punctuation.special", { link = "SpecialChar" })
hl(0, "@punctuation.special.markdown", { fg = c.raw_sienna }) -- For special symbols (e.g. `{}` in string interpolation)
hl(0, "@punctuation.special.htmldjango", { fg = c.raw_sienna })
hl(0, "@string", { link = "String" })
hl(0, "@string.documentation", { link = "@comment" })
hl(0, "@string.escape", { fg = c.biloba_flower }) -- For escape characters within a string.
hl(0, "@string.regexp", { fg = c.morning_glory }) -- For regexes.
hl(0, "@tag", { link = "Label" })
hl(0, "@tag.attribute", { link = "@property" })
hl(0, "@tag.delimiter", { link = "Delimiter" })
hl(0, "@tag.delimiter.tsx", { fg = util.blend_bg(c.morning_glory, 0.7) })
hl(0, "@tag.tsx", { fg = c.morning_glory })
hl(0, "@tag.jsx", { fg = c.morning_glory })
hl(0, "@tag.javascript", { fg = c.morning_glory })
hl(0, "@type", { link = "Type" })
hl(0, "@type.builtin", { fg = util.blend_bg(c.morning_glory, 0.8) })
hl(0, "@type.builtin.python", { fg = util.blend_bg(c.morning_glory, 0.8) })
hl(0, "@type.definition", { link = "Typedef" })
hl(0, "@type.qualifier", { link = "@keyword" })
hl(0, "@variable", { fg = c.foreground }) -- Any variable name that does not have another highlight.
hl(0, "@variable.member", { fg = c.alto }) -- For fields.
hl(0, "@variable.parameter", { fg = c.silver_rust, italic = true }) -- For parameters of a function.
hl(0, "@variable.parameter.builtin", { fg = util.blend_fg(c.old_brick, 0.8) }) -- For builtin parameters of a function, e.g. "..." or Smali's p[1-99]

-- JSON
hl(0, "@property.json", { fg = c.morning_glory })

-- JSX/TSX
hl(0, "@tag.builtin.tsx", { fg = c.morning_glory })

-- GO
hl(0, "@keyword.coroutine.go", { link = "Exception" })

-- Rust
hl(0, "@keyword.import.rust", { fg = c.biloba_flower })
hl(0, "@character.rust", { link = "String" })

hl(0, "TreesitterContext", { bg = c.grey_one })
hl(0, "TreesitterContextLineNumber", { fg = c.zambezi, bg = c.grey_one })
hl(0, "TreesitterContextBottom", { underline = true, sp = c.grey_three })

--
-- Plugins
--

-- Blink
hl(0, "BlinkCmpDoc", { bg = c.grey_three, fg = c.perano })
hl(0, "BlinkCmpDocBorder", { bg = c.grey_three, fg = c.grey_three })
hl(0, "BlinkCmpGhostText", { link = "Comment" })
hl(0, "BlinkCmpDocSeparator", { bg = c.grey_three, fg = c.biloba_flower })
hl(0, "BlinkCmpKindArray", { link = "LspKindArray" })
hl(0, "BlinkCmpKindBoolean", { link = "LspKindBoolean" })
hl(0, "BlinkCmpKindClass", { link = "LspKindClass" })
hl(0, "BlinkCmpKindCodeium", { bg = "NONE", fg = c.biloba_flower })
hl(0, "BlinkCmpKindColor", { link = "LspKindColor" })
hl(0, "BlinkCmpKindConstant", { link = "LspKindConstant" })
hl(0, "BlinkCmpKindConstructor", { link = "LspKindConstructor" })
hl(0, "BlinkCmpKindCopilot", { bg = "NONE", fg = c.biloba_flower })
hl(0, "BlinkCmpKindDefault", { bg = "NONE", fg = c.biloba_flower })
hl(0, "BlinkCmpKindEnum", { link = "LspKindEnum" })
hl(0, "BlinkCmpKindEnumMember", { link = "LspKindEnumMember" })
hl(0, "BlinkCmpKindEvent", { link = "LspKindEvent" })
hl(0, "BlinkCmpKindField", { link = "LspKindField" })
hl(0, "BlinkCmpKindFile", { link = "LspKindFile" })
hl(0, "BlinkCmpKindFolder", { link = "LspKindFolder" })
hl(0, "BlinkCmpKindFunction", { link = "LspKindFunction" })
hl(0, "BlinkCmpKindInterface", { link = "LspKindInterface" })
hl(0, "BlinkCmpKindKey", { link = "LspKindKey" })
hl(0, "BlinkCmpKindKeyword", { link = "LspKindKeyword" })
hl(0, "BlinkCmpKindMethod", { link = "LspKindMethod" })
hl(0, "BlinkCmpKindModule", { link = "LspKindModule" })
hl(0, "BlinkCmpKindNamespace", { link = "LspKindNamespace" })
hl(0, "BlinkCmpKindNull", { link = "LspKindNull" })
hl(0, "BlinkCmpKindNumber", { link = "LspKindNumber" })
hl(0, "BlinkCmpKindObject", { link = "LspKindObject" })
hl(0, "BlinkCmpKindOperator", { link = "LspKindOperator" })
hl(0, "BlinkCmpKindPackage", { link = "LspKindPackage" })
hl(0, "BlinkCmpKindProperty", { link = "LspKindProperty" })
hl(0, "BlinkCmpKindReference", { link = "LspKindReference" })
hl(0, "BlinkCmpKindSnippet", { link = "LspKindSnippet" })
hl(0, "BlinkCmpKindString", { link = "LspKindString" })
hl(0, "BlinkCmpKindStruct", { link = "LspKindStruct" })
hl(0, "BlinkCmpKindSupermaven", { bg = "NONE", fg = c.biloba_flower })
hl(0, "BlinkCmpKindTabNine", { bg = "NONE", fg = c.biloba_flower })
hl(0, "BlinkCmpKindText", { link = "LspKindText" })
hl(0, "BlinkCmpKindTypeParameter", { link = "LspKindTypeParameter" })
hl(0, "BlinkCmpKindUnit", { link = "LspKindUnit" })
hl(0, "BlinkCmpKindValue", { link = "LspKindValue" })
hl(0, "BlinkCmpKindVariable", { link = "LspKindVariable" })
hl(0, "BlinkCmpLabel", { bg = "NONE", fg = c.raw_sienna })
hl(0, "BlinkCmpLabelDeprecated", { bg = "NONE", fg = c.hoki, strikethrough = true })
hl(0, "BlinkCmpLabelMatch", { bg = "NONE", fg = c.morning_glory })
hl(0, "BlinkCmpMenu", { bg = c.grey_three, fg = c.biloba_flower })
hl(0, "BlinkCmpMenuBorder", { bg = c.grey_three, fg = c.grey_three })
hl(0, "BlinkCmpSignatureHelp", { bg = c.grey_three, fg = c.biloba_flower })
hl(0, "BlinkCmpSignatureHelpBorder", { bg = c.grey_three, fg = c.grey_three })

-- GitSigns
hl(0, "GitSignsAdd", { fg = c.mantis })
hl(0, "GitSignsChange", { fg = c.koromiko })
hl(0, "GitSignsDelete", { fg = c.old_brick })

-- Lazy
hl(0, "LazyNormal", { bg = c.float_bg, fg = c.alto })
hl(0, "LazyButton", { bg = util.lighten(c.float_bg, 0.90), fg = c.alto })
hl(0, "LazyButtonActive", { link = "IncSearch" })
hl(0, "LazyProgressDone", { bold = true, fg = c.raw_sienna })
hl(0, "LazyProgressTodo", { bold = true, fg = c.ship_cove })
hl(0, "LazySpecial", {})

-- Mason
hl(0, "MasonHeader", { link = "FloatTitle" })
hl(0, "MasonNormal", { bg = c.float_bg, fg = c.alto })
hl(0, "MasonMutedBlock", { bg = util.lighten(c.float_bg, 0.90), fg = c.alto })
hl(0, "MasonHighlightBlockBold", { link = "IncSearch" })

-- Neotest
hl(0, "NeotestPassed", { link = "DiagnosticOk" })
hl(0, "NeotestFailed", { link = "DiagnosticError" })
hl(0, "NeotestRunning", { link = "DiagnosticInfo" })
hl(0, "NeotestSkipped", { link = "DiagnosticHint" })
hl(0, "NeotestTest", { link = "Function" })
hl(0, "NeotestNamespace", { link = "@module" })
hl(0, "NeotestFocused", { link = "DiagnosticInfo" })
hl(0, "NeotestFile", { link = "Normal" })
hl(0, "NeotestDir", { link = "Directory" })
hl(0, "NeotestAdapterName", { link = "Title" })
hl(0, "NeotestWinSelect", { link = "Normal" })
hl(0, "NeotestMarked", { link = "Identifier" })
hl(0, "NeotestTarget", { link = "Normal" })
hl(0, "NeotestWatching", { link = "Normal" })
hl(0, "NeotestUnknown", { link = "DiagnosticError" })
hl(0, "NeotestBorder", { link = "LineNr" })
hl(0, "NeotestIndent", { link = "LineNr" })
hl(0, "NeotestExpandMarker", { link = "LineNr" })

-- Snacks
hl(0, "SnacksDashboardNormal", { bg = c.background })
hl(0, "SnacksDashboardDesc", { bg = c.background, fg = c.biloba_flower })
hl(0, "SnacksDashboardFile", { bg = c.background, fg = c.koromiko })
hl(0, "SnacksDashboardDir", { bg = c.background, fg = c.perano })
hl(0, "SnacksDashboardFooter", { bg = c.background, fg = c.biloba_flower })
hl(0, "SnacksDashboardHeader", { bg = c.background, fg = c.perano })
hl(0, "SnacksDashboardIcon", { bg = c.background, fg = c.raw_sienna })
hl(0, "SnacksDashboardKey", { bg = c.background, fg = c.wewak })
hl(0, "SnacksDashboardTerminal", { bg = c.background })
hl(0, "SnacksDashboardSpecial", { bg = c.background, fg = c.goldenrod })
hl(0, "SnacksDashboardTitle", { bg = c.background, fg = c.perano })

hl(0, "SnacksInputNormal", { link = "NormalFloat" })
hl(0, "SnacksInputBorder", { fg = c.zambezi, bg = c.float_bg })
hl(0, "SnacksInputTitle", { link = "FloatTitle" })

hl(0, "SnacksNotifierHistory", { link = "NormalFloat" })

hl(0, "SnacksNotifierInfo", { fg = c.cod_grey, bg = c.diag.info })
hl(0, "SnacksNotifierIconInfo", { fg = c.cod_grey, bg = c.diag.info })
hl(0, "SnacksNotifierBorderInfo", { fg = c.diag.info, bg = c.diag.info })
hl(0, "SnacksNotifierTitleInfo", { fg = c.cod_grey, bg = c.diag.info })

hl(0, "SnacksNotifierWarn", { fg = c.cod_grey, bg = c.diag.warning })
hl(0, "SnacksNotifierIconWarn", { fg = c.cod_grey, bg = c.diag.warning })
hl(0, "SnacksNotifierBorderWarn", { fg = c.diag.warning, bg = c.diag.warning })
hl(0, "SnacksNotifierTitleWarn", { fg = c.cod_grey, bg = c.diag.warning })

hl(0, "SnacksNotifierError", { fg = c.cod_grey, bg = c.diag.error })
hl(0, "SnacksNotifierIconError", { fg = c.cod_grey, bg = c.diag.error })
hl(0, "SnacksNotifierBorderError", { fg = c.diag.error, bg = c.diag.error })
hl(0, "SnacksNotifierTitleError", { fg = c.cod_grey, bg = c.diag.error })

hl(0, "SnacksNotifierDebug", { fg = c.cod_grey, bg = c.diag.hint })
hl(0, "SnacksNotifierIconDebug", { fg = c.cod_grey, bg = c.diag.hint })
hl(0, "SnacksNotifierBorderDebug", { fg = c.diag.hint, bg = c.diag.hint })
hl(0, "SnacksNotifierTitleDebug", { fg = c.cod_grey, bg = c.diag.hint })

hl(0, "SnacksNotifierTrace", { fg = c.cod_grey, bg = c.ship_cove })
hl(0, "SnacksNotifierIconTrace", { fg = c.cod_grey, bg = c.ship_cove })
hl(0, "SnacksNotifierBorderTrace", { fg = c.ship_cove, bg = c.ship_cove })
hl(0, "SnacksNotifierTitleTrace", { fg = c.cod_grey, bg = c.ship_cove })

-- Telescope
hl(0, "TelescopeNormal", { bg = c.float_bg })
hl(0, "TelescopePromptNormal", { bg = c.float_bg })
hl(0, "TelescopeResultsNormal", { bg = c.float_bg })
hl(0, "TelescopePreviewLine", { link = "CurSearch" })
hl(0, "TelescopePreviewMatch", { link = "CurSearch" })
hl(0, "TelescopePreviewNormal", { bg = c.float_bg })
hl(0, "TelescopePromptBorder", { fg = c.grey_three, bg = c.float_bg })
hl(0, "TelescopeResultsBorder", { fg = c.grey_three, bg = c.float_bg })
hl(0, "TelescopePreviewBorder", { fg = c.grey_three, bg = c.float_bg })
hl(0, "TelescopePromptPrefix", { fg = c.koromiko, bg = c.float_bg })
hl(0, "TelescopePromptTitle", { fg = c.float_bg, bg = c.koromiko })
hl(0, "TelescopeResultsTitle", { bg = c.perano, fg = c.float_bg, bold = true })
hl(0, "TelescopePreviewTitle", { bg = c.wewak, fg = c.float_bg, bold = true })
hl(0, "TelescopeSelection", { bg = c.calypso })
hl(0, "TelescopeSelectionCaret", { fg = c.koromiko, bg = c.calypso })
hl(0, "TelescopeMultiSelection", { bg = c.shuttle_grey })
hl(0, "TelescopeMatching", { fg = c.koromiko, bold = true })
hl(0, "TelescopePromptCounter", { fg = c.grey, bg = c.float_bg })

-- WhichKey
hl(0, "WhichKey", { bg = c.float_bg })
hl(0, "WhichKeyNormal", { bg = c.float_bg })
hl(0, "WhichKeyBorder", { bg = c.float_bg, fg = c.biloba_flower })
hl(0, "WhichKeyDesc", { fg = c.wewak })
hl(0, "WhichKeyGroup", { fg = c.biloba_flower })
hl(0, "WhichKeySeparator", { fg = c.morning_glory })
hl(0, "WhichKeyTitle", { fg = c.biloba_flower })
hl(0, "WhichKeyValue", { fg = c.morning_glory })
