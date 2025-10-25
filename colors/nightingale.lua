-- Nightingale colorscheme for Neovim (Lua version)
-- Based on the Nightingale VS Code theme
-- https://github.com/bfrangi/vscode-nightingale-theme

local M = {}

-- Color palette
local colors = {
  none = 'NONE',
  bg = '#202020',
  bg_dark = '#1a1a1a',
  bg_darker = '#181818',
  bg_light = '#2e2e2e',
  bg_lighter = '#363636',
  bg_visual = '#323232',
  bg_select = '#283c57',
  fg = '#ffffff',
  fg_dim = '#DCD7BA',
  fg_dimmer = '#C8C093',
  fg_comment = '#727169',
  fg_inactive = '#585858',
  
  -- ANSI colors
  black = '#1F1F28',
  red = '#e14c4c',
  green = '#89c471',
  yellow = '#ffd13b',
  blue = '#5690ac',
  magenta = '#957FB8',
  cyan = '#9CABCA',
  white = '#DCD7BA',
  
  bright_black = '#2A2A37',
  bright_red = '#FF5D62',
  bright_green = '#aed97a',
  bright_yellow = '#E6C384',
  bright_blue = '#81c0da',
  bright_magenta = '#D27E99',
  bright_cyan = '#A3D4D5',
  bright_white = '#DCD7BA',
  
  -- Syntax colors
  orange = '#FFA066',
  orange_light = '#ffaca3',
  orange_dim = '#eeab91',
  peach = '#f5a284',
  salmon = '#FF9488',
  gold = '#E6C384',
  gold_dim = '#d7ba7d',
  cream = '#e8e4ca',
  beige = '#d6bf9a',
  string_green = '#98BB6C',
  teal = '#7cd0bf',
  sky_blue = '#85a8da',
  light_blue = '#7ebcfd',
  purple = '#a584c0',
  pink = '#D27E99',
  error_red = '#E82424',
  warning_orange = '#FF9E3B',
  diff_green = '#76946A',
  diff_red = '#C34043',
  diff_orange = '#DCA561',
}

-- Helper function to set highlights
local function hl(group, opts)
  opts = opts or {}
  local cmd = 'highlight ' .. group
  
  if opts.fg then cmd = cmd .. ' guifg=' .. opts.fg end
  if opts.bg then cmd = cmd .. ' guibg=' .. opts.bg end
  if opts.style then 
    cmd = cmd .. ' gui=' .. opts.style
    cmd = cmd .. ' cterm=' .. opts.style
  end
  if opts.sp then cmd = cmd .. ' guisp=' .. opts.sp end
  
  vim.cmd(cmd)
end

function M.setup()
  -- Reset existing highlighting
  vim.cmd('highlight clear')
  if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
  end
  
  vim.g.colors_name = 'nightingale'
  vim.o.background = 'dark'
  
  -- Editor UI
  hl('Normal', { fg = colors.fg, bg = colors.bg })
  hl('NormalFloat', { fg = colors.fg_dim, bg = colors.bg_light })
  hl('NormalNC', { fg = colors.fg, bg = colors.bg })
  hl('Cursor', { fg = colors.bg, bg = colors.fg_dim })
  hl('CursorLine', { bg = colors.bg_lighter })
  hl('CursorLineNr', { fg = colors.fg_dim, style = 'bold' })
  hl('LineNr', { fg = colors.fg_inactive })
  hl('SignColumn', { bg = colors.bg })
  hl('ColorColumn', { bg = colors.bg_lighter })
  hl('Visual', { bg = colors.bg_visual })
  hl('VisualNOS', { bg = colors.bg_visual })
  
  -- Search and matching
  hl('IncSearch', { fg = colors.bg, bg = colors.warning_orange })
  hl('Search', { fg = colors.bg, bg = colors.warning_orange })
  hl('CursorColumn', { bg = colors.bg_lighter })
  hl('MatchParen', { bg = '#6363634d', style = 'underline' })
  
  -- Status line
  hl('StatusLine', { fg = colors.fg_dim, bg = '#282828' })
  hl('StatusLineNC', { fg = colors.fg_dimmer, bg = '#282828' })
  hl('WildMenu', { fg = colors.fg_dim, bg = '#333333' })
  
  -- Tab line
  hl('TabLine', { fg = colors.fg_dimmer, bg = colors.bg_light })
  hl('TabLineFill', { bg = colors.bg_darker })
  hl('TabLineSel', { fg = colors.fg_dim, bg = colors.bg, style = 'bold' })
  
  -- Windows and splits
  hl('VertSplit', { fg = '#1b1b1b', bg = colors.bg })
  hl('WinSeparator', { fg = '#1b1b1b', bg = colors.bg })
  
  -- Popups
  hl('Pmenu', { fg = colors.fg_dim, bg = colors.bg_light })
  hl('PmenuSel', { fg = colors.fg_dim, bg = '#383838' })
  hl('PmenuSbar', { bg = colors.bg_light })
  hl('PmenuThumb', { bg = '#585858' })
  
  -- Folding
  hl('Folded', { fg = colors.fg_comment, bg = colors.bg_light })
  hl('FoldColumn', { fg = colors.fg_inactive, bg = colors.bg })
  
  -- Diff
  hl('DiffAdd', { bg = '#2B3328' })
  hl('DiffChange', { bg = colors.bg_lighter })
  hl('DiffDelete', { fg = colors.diff_red, bg = '#2B3328' })
  hl('DiffText', { bg = '#373737' })
  
  -- Git signs
  hl('GitSignsAdd', { fg = colors.diff_green })
  hl('GitSignsChange', { fg = colors.diff_orange })
  hl('GitSignsDelete', { fg = colors.diff_red })
  
  -- Messages
  hl('ErrorMsg', { fg = colors.error_red, style = 'bold' })
  hl('WarningMsg', { fg = colors.warning_orange })
  hl('ModeMsg', { fg = colors.fg_dim })
  hl('MoreMsg', { fg = colors.bright_green })
  hl('Question', { fg = colors.light_blue })
  
  -- Diagnostics
  hl('DiagnosticError', { fg = colors.error_red })
  hl('DiagnosticWarn', { fg = colors.warning_orange })
  hl('DiagnosticInfo', { fg = colors.light_blue })
  hl('DiagnosticHint', { fg = colors.teal })
  hl('DiagnosticUnderlineError', { style = 'underline', sp = colors.error_red })
  hl('DiagnosticUnderlineWarn', { style = 'underline', sp = colors.warning_orange })
  hl('DiagnosticUnderlineInfo', { style = 'underline', sp = colors.light_blue })
  hl('DiagnosticUnderlineHint', { style = 'underline', sp = colors.teal })
  
  -- Spelling
  hl('SpellBad', { style = 'undercurl', sp = colors.error_red })
  hl('SpellCap', { style = 'undercurl', sp = colors.warning_orange })
  hl('SpellLocal', { style = 'undercurl', sp = colors.cyan })
  hl('SpellRare', { style = 'undercurl', sp = colors.magenta })
  
  -- Basic syntax
  hl('Comment', { fg = colors.fg_comment, style = 'italic' })
  hl('Constant', { fg = colors.peach })
  hl('String', { fg = colors.string_green })
  hl('Character', { fg = colors.string_green })
  hl('Number', { fg = colors.salmon, style = 'italic' })
  hl('Boolean', { fg = colors.salmon, style = 'italic' })
  hl('Float', { fg = colors.salmon, style = 'italic' })
  
  hl('Identifier', { fg = colors.cream })
  hl('Function', { fg = colors.sky_blue, style = 'italic' })
  
  hl('Statement', { fg = '#569cd6' })
  hl('Conditional', { fg = colors.purple, style = 'italic,bold' })
  hl('Repeat', { fg = colors.purple, style = 'italic,bold' })
  hl('Label', { fg = colors.purple, style = 'italic,bold' })
  hl('Operator', { fg = '#f1c57e' })
  hl('Keyword', { fg = '#569cd6' })
  hl('Exception', { fg = colors.purple, style = 'italic,bold' })
  
  hl('PreProc', { fg = colors.sky_blue })
  hl('Include', { fg = '#569cd6' })
  hl('Define', { fg = colors.sky_blue })
  hl('Macro', { fg = colors.sky_blue })
  hl('PreCondit', { fg = colors.sky_blue })
  
  hl('Type', { fg = colors.teal })
  hl('StorageClass', { fg = '#569cd6' })
  hl('Structure', { fg = colors.teal })
  hl('Typedef', { fg = colors.teal })
  
  hl('Special', { fg = colors.orange })
  hl('SpecialChar', { fg = colors.gold_dim })
  hl('Tag', { fg = colors.sky_blue })
  hl('Delimiter', { fg = colors.fg })
  hl('SpecialComment', { fg = colors.fg_comment, style = 'italic' })
  hl('Debug', { fg = colors.error_red })
  
  hl('Underlined', { style = 'underline' })
  hl('Ignore', { fg = colors.fg_comment })
  hl('Error', { fg = colors.error_red })
  hl('Todo', { fg = colors.warning_orange, bg = colors.bg, style = 'bold' })
  
  -- Treesitter highlights
  hl('@attribute', { fg = colors.teal })
  hl('@boolean', { fg = colors.salmon, style = 'italic' })
  hl('@character', { fg = colors.string_green })
  hl('@comment', { fg = colors.fg_comment, style = 'italic' })
  hl('@conditional', { fg = colors.purple, style = 'italic,bold' })
  hl('@constant', { fg = colors.peach })
  hl('@constant.builtin', { fg = colors.peach })
  hl('@constant.macro', { fg = colors.peach })
  hl('@constructor', { fg = colors.teal })
  hl('@error', { fg = colors.error_red })
  hl('@exception', { fg = colors.purple, style = 'italic,bold' })
  hl('@field', { fg = colors.beige })
  hl('@float', { fg = colors.salmon, style = 'italic' })
  hl('@function', { fg = colors.sky_blue, style = 'italic' })
  hl('@function.builtin', { fg = colors.sky_blue, style = 'italic' })
  hl('@function.macro', { fg = colors.sky_blue, style = 'italic' })
  hl('@include', { fg = '#569cd6' })
  hl('@keyword', { fg = '#569cd6' })
  hl('@keyword.function', { fg = colors.purple, style = 'italic,bold' })
  hl('@keyword.operator', { fg = colors.purple, style = 'italic,bold' })
  hl('@keyword.return', { fg = colors.purple, style = 'italic,bold' })
  hl('@label', { fg = colors.purple, style = 'italic,bold' })
  hl('@method', { fg = colors.sky_blue, style = 'italic' })
  hl('@namespace', { fg = colors.teal })
  hl('@number', { fg = colors.salmon, style = 'italic' })
  hl('@operator', { fg = '#f1c57e' })
  hl('@parameter', { fg = colors.cream })
  hl('@property', { fg = colors.beige })
  hl('@punctuation.bracket', { fg = colors.fg })
  hl('@punctuation.delimiter', { fg = colors.fg })
  hl('@punctuation.special', { fg = colors.orange })
  hl('@repeat', { fg = colors.purple, style = 'italic,bold' })
  hl('@string', { fg = colors.string_green })
  hl('@string.escape', { fg = colors.gold_dim })
  hl('@string.regex', { fg = '#ff8585' })
  hl('@string.special', { fg = colors.gold_dim })
  hl('@tag', { fg = colors.sky_blue })
  hl('@tag.attribute', { fg = colors.teal, style = 'italic' })
  hl('@tag.delimiter', { fg = '#808080' })
  hl('@text', { fg = colors.fg })
  hl('@text.emphasis', { style = 'italic' })
  hl('@text.strong', { style = 'bold' })
  hl('@text.underline', { style = 'underline' })
  hl('@text.title', { fg = colors.string_green, style = 'bold' })
  hl('@text.literal', { fg = '#9a9a9a' })
  hl('@text.uri', { fg = colors.light_blue, style = 'underline' })
  hl('@type', { fg = colors.teal })
  hl('@type.builtin', { fg = colors.teal })
  hl('@variable', { fg = colors.cream })
  hl('@variable.builtin', { fg = '#f1c57e', style = 'italic' })
  
  -- LSP semantic tokens
  hl('LspParameter', { fg = colors.cream })
  hl('LspVariable', { fg = colors.cream })
  hl('LspProperty', { fg = colors.beige })
  hl('LspEnumMember', { fg = colors.peach })
  hl('LspFunction', { fg = colors.sky_blue, style = 'italic' })
  hl('LspMethod', { fg = colors.sky_blue, style = 'italic' })
  hl('LspClass', { fg = colors.teal })
  hl('LspStruct', { fg = colors.teal })
  hl('LspInterface', { fg = colors.teal })
  hl('LspEnum', { fg = colors.teal })
  hl('LspTypeParameter', { fg = colors.teal })
  hl('LspNamespace', { fg = colors.teal })
  
  -- HTML
  hl('htmlTag', { fg = '#808080' })
  hl('htmlEndTag', { fg = '#808080' })
  hl('htmlTagName', { fg = '#769acc' })
  hl('htmlArg', { fg = colors.teal, style = 'italic' })
  hl('htmlString', { fg = '#ffa994' })
  hl('htmlBold', { style = 'bold' })
  hl('htmlItalic', { style = 'italic' })
  
  -- CSS
  hl('cssClassName', { fg = colors.gold })
  hl('cssIdentifier', { fg = colors.gold, style = 'italic' })
  hl('cssProp', { fg = '#81b9f1' })
  hl('cssAttr', { fg = colors.salmon })
  hl('cssUnitDecorators', { fg = colors.salmon, style = 'italic' })
  
  -- JavaScript/TypeScript
  hl('jsFunction', { fg = '#569cd6' })
  hl('jsFuncCall', { fg = colors.sky_blue, style = 'italic' })
  hl('jsObjectKey', { fg = colors.orange_light })
  hl('jsThis', { fg = '#f1c57e', style = 'italic' })
  hl('typescriptBraces', { fg = colors.fg })
  hl('typescriptParens', { fg = colors.fg })
  hl('typescriptObjectLabel', { fg = colors.orange_light })
  
  -- Markdown
  hl('markdownH1', { fg = colors.string_green, style = 'bold' })
  hl('markdownH2', { fg = colors.string_green, style = 'bold' })
  hl('markdownH3', { fg = colors.string_green, style = 'bold' })
  hl('markdownH4', { fg = colors.string_green, style = 'bold' })
  hl('markdownH5', { fg = colors.string_green, style = 'bold' })
  hl('markdownH6', { fg = colors.string_green, style = 'bold' })
  hl('markdownHeadingDelimiter', { fg = colors.string_green, style = 'bold' })
  hl('markdownCode', { fg = '#ffbd7b' })
  hl('markdownCodeBlock', { fg = '#9a9a9a' })
  hl('markdownCodeDelimiter', { fg = '#9a9a9a' })
  hl('markdownBlockquote', { fg = colors.magenta, style = 'italic' })
  hl('markdownListMarker', { fg = '#6796e6', style = 'bold' })
  hl('markdownUrl', { fg = colors.yellow })
  hl('markdownLinkText', { fg = colors.yellow })
  hl('markdownBold', { style = 'bold' })
  hl('markdownItalic', { style = 'italic' })
  
  -- JSON
  hl('jsonKeyword', { fg = colors.pink })
  hl('jsonString', { fg = colors.string_green })
  hl('jsonNumber', { fg = colors.salmon, style = 'italic' })
  
  -- Python
  hl('pythonBuiltin', { fg = colors.sky_blue, style = 'italic' })
  hl('pythonFunction', { fg = colors.sky_blue, style = 'italic' })
  hl('pythonDecorator', { fg = colors.orange })
  hl('pythonDecoratorName', { fg = colors.orange })
  
  -- Telescope
  hl('TelescopeBorder', { fg = '#585858' })
  hl('TelescopePromptBorder', { fg = '#585858' })
  hl('TelescopeResultsBorder', { fg = '#585858' })
  hl('TelescopePreviewBorder', { fg = '#585858' })
  hl('TelescopeSelection', { bg = '#333333' })
  hl('TelescopeSelectionCaret', { fg = colors.sky_blue })
  hl('TelescopeMatching', { fg = colors.warning_orange, style = 'bold' })
  
  -- NvimTree
  hl('NvimTreeNormal', { fg = colors.fg_dim, bg = '#202020' })
  hl('NvimTreeFolderName', { fg = colors.fg_dim })
  hl('NvimTreeFolderIcon', { fg = colors.sky_blue })
  hl('NvimTreeOpenedFolderName', { fg = colors.fg_dim, style = 'bold' })
  hl('NvimTreeRootFolder', { fg = colors.magenta, style = 'bold' })
  hl('NvimTreeGitDirty', { fg = colors.diff_orange })
  hl('NvimTreeGitNew', { fg = colors.diff_green })
  hl('NvimTreeGitDeleted', { fg = colors.diff_red })
  
  -- Which-key
  hl('WhichKey', { fg = colors.sky_blue })
  hl('WhichKeyGroup', { fg = colors.magenta })
  hl('WhichKeyDesc', { fg = colors.fg_dim })
  hl('WhichKeySeparator', { fg = colors.fg_comment })
  hl('WhichKeyFloat', { fg = colors.fg_dim, bg = colors.bg_light })
  
  -- Indent-blankline
  hl('IndentBlanklineChar', { fg = '#303030' })
  hl('IndentBlanklineContextChar', { fg = '#525252' })
  
  -- Terminal colors
  vim.g.terminal_color_0 = colors.black
  vim.g.terminal_color_1 = colors.red
  vim.g.terminal_color_2 = colors.green
  vim.g.terminal_color_3 = colors.yellow
  vim.g.terminal_color_4 = colors.blue
  vim.g.terminal_color_5 = colors.magenta
  vim.g.terminal_color_6 = colors.cyan
  vim.g.terminal_color_7 = colors.white
  vim.g.terminal_color_8 = colors.bright_black
  vim.g.terminal_color_9 = colors.bright_red
  vim.g.terminal_color_10 = colors.bright_green
  vim.g.terminal_color_11 = colors.bright_yellow
  vim.g.terminal_color_12 = colors.bright_blue
  vim.g.terminal_color_13 = colors.bright_magenta
  vim.g.terminal_color_14 = colors.bright_cyan
  vim.g.terminal_color_15 = colors.bright_white
end

return M
