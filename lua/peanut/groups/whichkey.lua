local M = {}

function M.highlight(palette, opts)
    return {
        WhichKey = { link = 'Function' },
        WhichKeyBorder = { link = 'FloatBorder' }, --	border of the which-key window
        WhichKeyDesc = { link = 'Identifier' }, -- description
        WhichKeyGroup = { link = 'Keyword' }, -- group name
        WhichKeyIcon = { link = '@markup.link' }, -- icons
        WhichKeyIconAzure = { link = 'Function' },
        WhichKeyIconBlue = { link = 'DiagnosticInfo' },
        WhichKeyIconCyan = { link = 'DiagnosticHint' },
        WhichKeyIconGreen = { link = 'DiagnosticOk' },
        WhichKeyIconGrey = { link = 'Normal' },
        WhichKeyIconOrange = { link = 'DiagnosticWarn' },
        WhichKeyIconPurple = { link = 'Constant' },
        WhichKeyIconRed = { link = 'DiagnosticError' },
        WhichKeyIconYellow = { link = 'DiagnosticWarn' },
        WhichKeyNormal = { link = 'NormalFloat' }, --normal in the which-key window
        WhichKeySeparator = { link = 'Comment' }, -- separator between the key and its description
        WhichKeyTitle = { link = 'FloatTitle' }, -- title of the which-key window
        WhichKeyValue = { link = 'Comment' }, -- values by plugins (like marks, registers, etc)
    }
end

return M
