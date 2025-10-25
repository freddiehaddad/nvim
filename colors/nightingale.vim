" Nightingale colorscheme for Neovim/Vim
" Based on the Nightingale VS Code theme
" https://github.com/bfrangi/vscode-nightingale-theme

" Initialization
hi clear
if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'nightingale'
set background=dark

" Color Palette
let s:none = 'NONE'
let s:bg = '#202020'
let s:bg_dark = '#1a1a1a'
let s:bg_darker = '#181818'
let s:bg_light = '#2e2e2e'
let s:bg_lighter = '#363636'
let s:bg_visual = '#323232'
let s:bg_select = '#283c57'
let s:fg = '#ffffff'
let s:fg_dim = '#DCD7BA'
let s:fg_dimmer = '#C8C093'
let s:fg_comment = '#727169'
let s:fg_inactive = '#585858'

" Terminal ANSI colors
let s:black = '#1F1F28'
let s:red = '#e14c4c'
let s:green = '#89c471'
let s:yellow = '#ffd13b'
let s:blue = '#5690ac'
let s:magenta = '#957FB8'
let s:cyan = '#9CABCA'
let s:white = '#DCD7BA'

let s:bright_black = '#2A2A37'
let s:bright_red = '#FF5D62'
let s:bright_green = '#aed97a'
let s:bright_yellow = '#E6C384'
let s:bright_blue = '#81c0da'
let s:bright_magenta = '#D27E99'
let s:bright_cyan = '#A3D4D5'
let s:bright_white = '#DCD7BA'

" Syntax colors
let s:orange = '#FFA066'
let s:orange_light = '#ffaca3'
let s:orange_dim = '#eeab91'
let s:peach = '#f5a284'
let s:salmon = '#FF9488'
let s:gold = '#E6C384'
let s:gold_dim = '#d7ba7d'
let s:cream = '#e8e4ca'
let s:beige = '#d6bf9a'
let s:string_green = '#98BB6C'
let s:teal = '#7cd0bf'
let s:sky_blue = '#85a8da'
let s:light_blue = '#7ebcfd'
let s:purple = '#a584c0'
let s:pink = '#D27E99'
let s:error_red = '#E82424'
let s:warning_orange = '#FF9E3B'
let s:diff_green = '#76946A'
let s:diff_red = '#C34043'
let s:diff_orange = '#DCA561'

" Helper function
function! s:HL(group, fg, bg, attr)
  let l:attr = a:attr
  if !empty(a:fg)
    exec 'hi ' . a:group . ' guifg=' . a:fg
  endif
  if !empty(a:bg)
    exec 'hi ' . a:group . ' guibg=' . a:bg
  endif
  if !empty(a:attr)
    exec 'hi ' . a:group . ' gui=' . l:attr . ' cterm=' . l:attr
  endif
endfun

" Editor UI
call s:HL('Normal', s:fg, s:bg, s:none)
call s:HL('NormalFloat', s:fg_dim, s:bg_light, s:none)
call s:HL('NormalNC', s:fg, s:bg, s:none)
call s:HL('Cursor', s:bg, s:fg_dim, s:none)
call s:HL('CursorLine', '', s:bg_lighter, s:none)
call s:HL('CursorLineNr', s:fg_dim, '', 'bold')
call s:HL('LineNr', s:fg_inactive, '', s:none)
call s:HL('SignColumn', '', s:bg, s:none)
call s:HL('ColorColumn', '', s:bg_lighter, s:none)
call s:HL('Visual', '', s:bg_visual, s:none)
call s:HL('VisualNOS', '', s:bg_visual, s:none)

" Cursor and selection
call s:HL('IncSearch', s:bg, s:warning_orange, s:none)
call s:HL('Search', s:bg, s:warning_orange, s:none)
call s:HL('CursorColumn', '', s:bg_lighter, s:none)
call s:HL('MatchParen', '', '#6363634d', 'underline')

" Status line
call s:HL('StatusLine', s:fg_dim, '#282828', s:none)
call s:HL('StatusLineNC', s:fg_dimmer, '#282828', s:none)
call s:HL('WildMenu', s:fg_dim, '#333333', s:none)

" Tab line
call s:HL('TabLine', s:fg_dimmer, s:bg_light, s:none)
call s:HL('TabLineFill', '', s:bg_darker, s:none)
call s:HL('TabLineSel', s:fg_dim, s:bg, 'bold')

" Windows and splits
call s:HL('VertSplit', '#1b1b1b', s:bg, s:none)
call s:HL('WinSeparator', '#1b1b1b', s:bg, s:none)

" Popups and floating windows
call s:HL('Pmenu', s:fg_dim, s:bg_light, s:none)
call s:HL('PmenuSel', s:fg_dim, '#383838', s:none)
call s:HL('PmenuSbar', '', s:bg_light, s:none)
call s:HL('PmenuThumb', '', '#585858', s:none)

" Folding
call s:HL('Folded', s:fg_comment, s:bg_light, s:none)
call s:HL('FoldColumn', s:fg_inactive, s:bg, s:none)

" Diff
call s:HL('DiffAdd', '', '#2B3328', s:none)
call s:HL('DiffChange', '', s:bg_lighter, s:none)
call s:HL('DiffDelete', s:diff_red, '#2B3328', s:none)
call s:HL('DiffText', '', '#373737', s:none)

" Git signs
call s:HL('GitSignsAdd', s:diff_green, '', s:none)
call s:HL('GitSignsChange', s:diff_orange, '', s:none)
call s:HL('GitSignsDelete', s:diff_red, '', s:none)

" Messages
call s:HL('ErrorMsg', s:error_red, '', 'bold')
call s:HL('WarningMsg', s:warning_orange, '', s:none)
call s:HL('ModeMsg', s:fg_dim, '', s:none)
call s:HL('MoreMsg', s:bright_green, '', s:none)
call s:HL('Question', s:light_blue, '', s:none)

" Diagnostics
call s:HL('DiagnosticError', s:error_red, '', s:none)
call s:HL('DiagnosticWarn', s:warning_orange, '', s:none)
call s:HL('DiagnosticInfo', s:light_blue, '', s:none)
call s:HL('DiagnosticHint', s:teal, '', s:none)

call s:HL('DiagnosticUnderlineError', '', '', 'underline')
call s:HL('DiagnosticUnderlineWarn', '', '', 'underline')
call s:HL('DiagnosticUnderlineInfo', '', '', 'underline')
call s:HL('DiagnosticUnderlineHint', '', '', 'underline')

" Spelling
call s:HL('SpellBad', '', '', 'undercurl')
call s:HL('SpellCap', '', '', 'undercurl')
call s:HL('SpellLocal', '', '', 'undercurl')
call s:HL('SpellRare', '', '', 'undercurl')

" Syntax
call s:HL('Comment', s:fg_comment, '', 'italic')
call s:HL('Constant', s:peach, '', s:none)
call s:HL('String', s:string_green, '', s:none)
call s:HL('Character', s:string_green, '', s:none)
call s:HL('Number', s:salmon, '', 'italic')
call s:HL('Boolean', s:salmon, '', 'italic')
call s:HL('Float', s:salmon, '', 'italic')

call s:HL('Identifier', s:cream, '', s:none)
call s:HL('Function', s:sky_blue, '', 'italic')

call s:HL('Statement', '#569cd6', '', s:none)
call s:HL('Conditional', s:purple, '', 'italic,bold')
call s:HL('Repeat', s:purple, '', 'italic,bold')
call s:HL('Label', s:purple, '', 'italic,bold')
call s:HL('Operator', '#f1c57e', '', s:none)
call s:HL('Keyword', '#569cd6', '', s:none)
call s:HL('Exception', s:purple, '', 'italic,bold')

call s:HL('PreProc', s:sky_blue, '', s:none)
call s:HL('Include', '#569cd6', '', s:none)
call s:HL('Define', s:sky_blue, '', s:none)
call s:HL('Macro', s:sky_blue, '', s:none)
call s:HL('PreCondit', s:sky_blue, '', s:none)

call s:HL('Type', s:teal, '', s:none)
call s:HL('StorageClass', '#569cd6', '', s:none)
call s:HL('Structure', s:teal, '', s:none)
call s:HL('Typedef', s:teal, '', s:none)

call s:HL('Special', s:orange, '', s:none)
call s:HL('SpecialChar', s:gold_dim, '', s:none)
call s:HL('Tag', s:sky_blue, '', s:none)
call s:HL('Delimiter', s:fg, '', s:none)
call s:HL('SpecialComment', s:fg_comment, '', 'italic')
call s:HL('Debug', s:error_red, '', s:none)

call s:HL('Underlined', '', '', 'underline')
call s:HL('Ignore', s:fg_comment, '', s:none)
call s:HL('Error', s:error_red, '', s:none)
call s:HL('Todo', s:warning_orange, s:bg, 'bold')

" Treesitter highlights
if has('nvim-0.8')
  call s:HL('@attribute', s:teal, '', s:none)
  call s:HL('@boolean', s:salmon, '', 'italic')
  call s:HL('@character', s:string_green, '', s:none)
  call s:HL('@comment', s:fg_comment, '', 'italic')
  call s:HL('@conditional', s:purple, '', 'italic,bold')
  call s:HL('@constant', s:peach, '', s:none)
  call s:HL('@constant.builtin', s:peach, '', s:none)
  call s:HL('@constant.macro', s:peach, '', s:none)
  call s:HL('@constructor', s:teal, '', s:none)
  call s:HL('@error', s:error_red, '', s:none)
  call s:HL('@exception', s:purple, '', 'italic,bold')
  call s:HL('@field', s:beige, '', s:none)
  call s:HL('@float', s:salmon, '', 'italic')
  call s:HL('@function', s:sky_blue, '', 'italic')
  call s:HL('@function.builtin', s:sky_blue, '', 'italic')
  call s:HL('@function.macro', s:sky_blue, '', 'italic')
  call s:HL('@include', '#569cd6', '', s:none)
  call s:HL('@keyword', '#569cd6', '', s:none)
  call s:HL('@keyword.function', s:purple, '', 'italic,bold')
  call s:HL('@keyword.operator', s:purple, '', 'italic,bold')
  call s:HL('@keyword.return', s:purple, '', 'italic,bold')
  call s:HL('@label', s:purple, '', 'italic,bold')
  call s:HL('@method', s:sky_blue, '', 'italic')
  call s:HL('@namespace', s:teal, '', s:none)
  call s:HL('@number', s:salmon, '', 'italic')
  call s:HL('@operator', '#f1c57e', '', s:none)
  call s:HL('@parameter', s:cream, '', s:none)
  call s:HL('@property', s:beige, '', s:none)
  call s:HL('@punctuation.bracket', s:fg, '', s:none)
  call s:HL('@punctuation.delimiter', s:fg, '', s:none)
  call s:HL('@punctuation.special', s:orange, '', s:none)
  call s:HL('@repeat', s:purple, '', 'italic,bold')
  call s:HL('@string', s:string_green, '', s:none)
  call s:HL('@string.escape', s:gold_dim, '', s:none)
  call s:HL('@string.regex', '#ff8585', '', s:none)
  call s:HL('@string.special', s:gold_dim, '', s:none)
  call s:HL('@tag', s:sky_blue, '', s:none)
  call s:HL('@tag.attribute', s:teal, '', 'italic')
  call s:HL('@tag.delimiter', '#808080', '', s:none)
  call s:HL('@text', s:fg, '', s:none)
  call s:HL('@text.emphasis', '', '', 'italic')
  call s:HL('@text.strong', '', '', 'bold')
  call s:HL('@text.underline', '', '', 'underline')
  call s:HL('@text.title', s:string_green, '', 'bold')
  call s:HL('@text.literal', '#9a9a9a', '', s:none)
  call s:HL('@text.uri', s:light_blue, '', 'underline')
  call s:HL('@type', s:teal, '', s:none)
  call s:HL('@type.builtin', s:teal, '', s:none)
  call s:HL('@variable', s:cream, '', s:none)
  call s:HL('@variable.builtin', '#f1c57e', '', 'italic')
endif

" LSP semantic tokens
call s:HL('LspParameter', s:cream, '', s:none)
call s:HL('LspVariable', s:cream, '', s:none)
call s:HL('LspProperty', s:beige, '', s:none)
call s:HL('LspEnumMember', s:peach, '', s:none)
call s:HL('LspFunction', s:sky_blue, '', 'italic')
call s:HL('LspMethod', s:sky_blue, '', 'italic')
call s:HL('LspClass', s:teal, '', s:none)
call s:HL('LspStruct', s:teal, '', s:none)
call s:HL('LspInterface', s:teal, '', s:none)
call s:HL('LspEnum', s:teal, '', s:none)
call s:HL('LspTypeParameter', s:teal, '', s:none)
call s:HL('LspNamespace', s:teal, '', s:none)

" HTML
call s:HL('htmlTag', '#808080', '', s:none)
call s:HL('htmlEndTag', '#808080', '', s:none)
call s:HL('htmlTagName', '#769acc', '', s:none)
call s:HL('htmlArg', s:teal, '', 'italic')
call s:HL('htmlString', '#ffa994', '', s:none)
call s:HL('htmlBold', '', '', 'bold')
call s:HL('htmlItalic', '', '', 'italic')

" CSS
call s:HL('cssClassName', s:gold, '', s:none)
call s:HL('cssIdentifier', s:gold, '', 'italic')
call s:HL('cssProp', '#81b9f1', '', s:none)
call s:HL('cssAttr', s:salmon, '', s:none)
call s:HL('cssUnitDecorators', s:salmon, '', 'italic')

" JavaScript/TypeScript
call s:HL('jsFunction', '#569cd6', '', s:none)
call s:HL('jsFuncCall', s:sky_blue, '', 'italic')
call s:HL('jsObjectKey', s:orange_light, '', s:none)
call s:HL('jsThis', '#f1c57e', '', 'italic')

call s:HL('typescriptBraces', s:fg, '', s:none)
call s:HL('typescriptParens', s:fg, '', s:none)
call s:HL('typescriptObjectLabel', s:orange_light, '', s:none)

" Markdown
call s:HL('markdownH1', s:string_green, '', 'bold')
call s:HL('markdownH2', s:string_green, '', 'bold')
call s:HL('markdownH3', s:string_green, '', 'bold')
call s:HL('markdownH4', s:string_green, '', 'bold')
call s:HL('markdownH5', s:string_green, '', 'bold')
call s:HL('markdownH6', s:string_green, '', 'bold')
call s:HL('markdownHeadingDelimiter', s:string_green, '', 'bold')
call s:HL('markdownCode', '#ffbd7b', '', s:none)
call s:HL('markdownCodeBlock', '#9a9a9a', '', s:none)
call s:HL('markdownCodeDelimiter', '#9a9a9a', '', s:none)
call s:HL('markdownBlockquote', s:magenta, '', 'italic')
call s:HL('markdownListMarker', '#6796e6', '', 'bold')
call s:HL('markdownUrl', s:yellow, '', s:none)
call s:HL('markdownLinkText', s:yellow, '', s:none)
call s:HL('markdownBold', '', '', 'bold')
call s:HL('markdownItalic', '', '', 'italic')

" JSON
call s:HL('jsonKeyword', s:pink, '', s:none)
call s:HL('jsonString', s:string_green, '', s:none)
call s:HL('jsonNumber', s:salmon, '', 'italic')

" Python
call s:HL('pythonBuiltin', s:sky_blue, '', 'italic')
call s:HL('pythonFunction', s:sky_blue, '', 'italic')
call s:HL('pythonDecorator', s:orange, '', s:none)
call s:HL('pythonDecoratorName', s:orange, '', s:none)

" Terminal colors
if has('nvim')
  let g:terminal_color_0 = s:black
  let g:terminal_color_1 = s:red
  let g:terminal_color_2 = s:green
  let g:terminal_color_3 = s:yellow
  let g:terminal_color_4 = s:blue
  let g:terminal_color_5 = s:magenta
  let g:terminal_color_6 = s:cyan
  let g:terminal_color_7 = s:white
  let g:terminal_color_8 = s:bright_black
  let g:terminal_color_9 = s:bright_red
  let g:terminal_color_10 = s:bright_green
  let g:terminal_color_11 = s:bright_yellow
  let g:terminal_color_12 = s:bright_blue
  let g:terminal_color_13 = s:bright_magenta
  let g:terminal_color_14 = s:bright_cyan
  let g:terminal_color_15 = s:bright_white
endif

" Telescope (if installed)
call s:HL('TelescopeBorder', '#585858', '', s:none)
call s:HL('TelescopePromptBorder', '#585858', '', s:none)
call s:HL('TelescopeResultsBorder', '#585858', '', s:none)
call s:HL('TelescopePreviewBorder', '#585858', '', s:none)
call s:HL('TelescopeSelection', '', '#333333', s:none)
call s:HL('TelescopeSelectionCaret', s:sky_blue, '', s:none)
call s:HL('TelescopeMatching', s:warning_orange, '', 'bold')

" NvimTree (if installed)
call s:HL('NvimTreeNormal', s:fg_dim, '#202020', s:none)
call s:HL('NvimTreeFolderName', s:fg_dim, '', s:none)
call s:HL('NvimTreeFolderIcon', s:sky_blue, '', s:none)
call s:HL('NvimTreeOpenedFolderName', s:fg_dim, '', 'bold')
call s:HL('NvimTreeRootFolder', s:magenta, '', 'bold')
call s:HL('NvimTreeGitDirty', s:diff_orange, '', s:none)
call s:HL('NvimTreeGitNew', s:diff_green, '', s:none)
call s:HL('NvimTreeGitDeleted', s:diff_red, '', s:none)

" Which-key (if installed)
call s:HL('WhichKey', s:sky_blue, '', s:none)
call s:HL('WhichKeyGroup', s:magenta, '', s:none)
call s:HL('WhichKeyDesc', s:fg_dim, '', s:none)
call s:HL('WhichKeySeparator', s:fg_comment, '', s:none)
call s:HL('WhichKeyFloat', s:fg_dim, s:bg_light, s:none)

" Indent-blankline (if installed)
call s:HL('IndentBlanklineChar', '#303030', '', s:none)
call s:HL('IndentBlanklineContextChar', '#525252', '', s:none)
