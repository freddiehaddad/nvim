local M = {}

local P = require('rust_inspired.palette')

local function hi(group, opts)
  opts = opts or {}
  vim.api.nvim_set_hl(0, group, opts)
end

local function setup_terminal()
  -- Set terminal palette to match VS Code terminal colors
  vim.g.terminal_color_0  = P.bg        -- black
  vim.g.terminal_color_1  = P.red       -- red
  vim.g.terminal_color_2  = P.green     -- green
  vim.g.terminal_color_3  = P.yellow    -- yellow
  vim.g.terminal_color_4  = P.blue      -- blue
  vim.g.terminal_color_5  = P.magenta   -- magenta
  vim.g.terminal_color_6  = P.cyan      -- cyan
  vim.g.terminal_color_7  = P.fg        -- white
  vim.g.terminal_color_8  = P.bright_black
  vim.g.terminal_color_9  = P.bright_red
  vim.g.terminal_color_10 = P.bright_green
  vim.g.terminal_color_11 = P.bright_yellow
  vim.g.terminal_color_12 = P.bright_blue
  vim.g.terminal_color_13 = P.bright_magenta
  vim.g.terminal_color_14 = P.bright_cyan
  vim.g.terminal_color_15 = P.bright_white
end

local function setup_editor()
  vim.o.termguicolors = true
  vim.o.background = 'dark'
  -- Clear for safety before applying
  if vim.fn.exists('g:colors_name') == 1 then
    vim.cmd('highlight clear')
  end
  vim.g.colors_name = 'rust_inspired'
end

local function highlights()
  -- UI
  hi('Normal',       { fg = P.fg, bg = P.bg })
  hi('NormalNC',     { fg = P.fg, bg = P.bg })
  hi('LineNr',       { fg = P.lnum, bg = P.bg })
  hi('CursorLine',   { bg = P.line })
  hi('CursorLineNr', { fg = P.fg, bg = P.bg, bold = true })
  hi('SignColumn',   { bg = P.bg })
  hi('VertSplit',    { fg = P.bg, bg = P.bg }) -- no visible splits (no borders)
  hi('WinSeparator', { fg = P.bg, bg = P.bg }) -- Neovim 0.7+ window separator
  hi('ColorColumn',  { bg = P.bg_alt })
  hi('FoldColumn',   { fg = P.lnum, bg = P.bg })
  hi('Folded',       { fg = P.fg, bg = P.bg_alt })
  hi('StatusLine',   { fg = P.fg, bg = P.accent })
  hi('StatusLineNC', { fg = P.fg, bg = P.bg_alt })
  hi('TabLine',      { fg = P.lnum, bg = P.bg_alt })
  hi('TabLineSel',   { fg = P.fg, bg = P.bg })
  hi('TabLineFill',  { bg = P.bg_alt })
  hi('Pmenu',        { fg = P.fg, bg = P.bg_alt })
  hi('PmenuSel',     { fg = P.fg, bg = P.line })
  hi('PmenuSbar',    { bg = P.bg_alt })
  hi('PmenuThumb',   { bg = P.lnum })
  hi('NormalFloat',  { fg = P.fg, bg = P.bg_alt })
  hi('FloatBorder',  { fg = P.bg, bg = P.bg_alt }) -- hide float borders
  hi('Visual',       { bg = P.select })
  hi('Search',       { bg = P.accent })
  hi('IncSearch',    { bg = P.accent_alt, fg = P.white })
  hi('MatchParen',   { fg = P.accent, bold = true })
  hi('Whitespace',   { fg = P.lnum })
  hi('NonText',      { fg = P.lnum })

  -- Diagnostics
  hi('DiagnosticError', { fg = P.red })
  hi('DiagnosticWarn',  { fg = P.bright_yellow })
  hi('DiagnosticInfo',  { fg = P.blue })
  hi('DiagnosticHint',  { fg = P.cyan })
  hi('DiagnosticUnderlineError', { undercurl = true, sp = P.red })
  hi('DiagnosticUnderlineWarn',  { undercurl = true, sp = P.bright_yellow })
  hi('DiagnosticUnderlineInfo',  { undercurl = true, sp = P.blue })
  hi('DiagnosticUnderlineHint',  { undercurl = true, sp = P.cyan })

  -- Git/Gutter
  hi('DiffAdd',    { bg = '#10220e' })
  hi('DiffChange', { bg = '#2a1f14' })
  hi('DiffDelete', { bg = '#2a0e0e' })
  hi('DiffText',   { bg = '#3a2a1a' })
  hi('GitSignsAdd',    { fg = P.green })
  hi('GitSignsChange', { fg = P.bright_red })
  hi('GitSignsDelete', { fg = P.red })

  -- Syntax core
  hi('Comment',   { fg = '#93a1a1', italic = true })
  hi('Keyword',   { fg = P.accent, bold = true })
  hi('Statement', { fg = P.accent, bold = true })
  hi('Conditional',{ fg = P.accent, bold = true })
  hi('Repeat',    { fg = P.accent, bold = true })
  hi('Operator',  { fg = P.orange })
  hi('String',    { fg = P.green })
  hi('Number',    { fg = P.magenta })
  hi('Boolean',   { fg = P.magenta })
  hi('Character', { fg = P.magenta })
  hi('Function',  { fg = P.yellow, bold = true })
  hi('Identifier',{ fg = P.fg })
  hi('Type',      { fg = P.blue, bold = true })
  hi('StorageClass', { fg = P.blue, bold = true })
  hi('Structure', { fg = P.blue, bold = true })
  hi('Constant',  { fg = P.magenta })
  hi('PreProc',   { fg = P.violet })
  hi('Include',   { fg = P.violet })
  hi('Define',    { fg = P.red, bold = true })
  hi('Macro',     { fg = P.red, bold = true })
  hi('Delimiter', { fg = P.grey })

  -- Treesitter (if installed)
  hi('@comment',    { link = 'Comment' })
  hi('@keyword',    { link = 'Keyword' })
  hi('@operator',   { link = 'Operator' })
  hi('@string',     { link = 'String' })
  hi('@number',     { link = 'Number' })
  hi('@boolean',    { link = 'Boolean' })
  hi('@character',  { link = 'Character' })
  hi('@function',   { link = 'Function' })
  hi('@constructor',{ link = 'Function' })
  hi('@type',       { link = 'Type' })
  hi('@variable',   { link = 'Identifier' })
  hi('@parameter',  { link = 'Identifier' })
  hi('@property',   { fg = P.fg })

  -- LSP
  hi('LspReferenceText',  { bg = P.line })
  hi('LspReferenceRead',  { bg = P.line })
  hi('LspReferenceWrite', { bg = P.line })
end

function M.load()
  setup_editor()
  setup_terminal()
  highlights()
end

return M
