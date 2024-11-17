local M = {}

function M.highlight(palette, opts)
    return {
        -- code
        Type = { fg = palette.fg1 },
        Boolean = { fg = palette.fg1 },
        Character = { fg = palette.fg1 },
        Float = { fg = palette.fg1 },

        Constant = { fg = palette.fg3 },
        Identifier = { fg = palette.fg3 },
        Number = { fg = palette.fg3 },
        String = { fg = palette.fg3 },

        Struct = { fg = palette.fg2 },
        Structure = { link = 'Struct' },

        Keyword = { fg = palette.fg2 },

        Todo = { fg = palette.fg1 },
        Conditional = { fg = palette.bg5 },
        Delimiter = { fg = palette.bg5 },
        Operator = { fg = palette.bg5 },
        Comment = { fg = palette.bg5 },

        Exception = { fg = palette.fg1 },
        Function = { fg = palette.fg2 },
        Statement = { fg = palette.fg3 },
        Variable = { fg = palette.fg4 },

        Label = { fg = palette.bg4 },

        Special = { link = 'Normal' },
        Repeat = { link = 'Normal' },
        Include = { link = 'Normal' },
        PreProc = { link = 'Normal' },
        Define = { link = 'Normal' },
        Macro = { link = 'Normal' },
        PreCondit = { link = 'Normal' },
        StorageClass = { link = 'Normal' },
        Typedef = { link = 'Normal' },
        Method = { link = 'Normal' },

        --errors
        ErrorMsg = { fg = palette.fg3 },
        WarningMsg = { fg = palette.fg3 },

        --spell
        SpellBad = { fg = palette.fg3, underline = true },
        SpellCap = { fg = palette.fg3, underline = true },
        SpellLocal = { fg = palette.fg3, underline = true },
        SpellRare = { fg = palette.fg3, underline = true },

        --markdown
        ['@markup.link.markdown_inline'] = { link = 'String' },
        ['@markup.link.label.markdown'] = { fg = palette.fg2 },
        ['@markup.link.label.markdown_inline'] = { fg = palette.fg2 },
        ['@lsp.type.class.markdown'] = { fg = palette.fg2},

        -- treesitter
        ['@keyword'] = { link = 'Keyword' },
        ['@variable'] = { link = 'Variable' },
        ['@variable.parameter'] = { link = 'Label' },
    }
end

return M
