local M = {}

function M.highlight(palette, opts)
    return {
        -- code
        Type = { fg = palette.fg2 },
        Boolean = { fg = palette.fg2 },
        Character = { fg = palette.fg2 },
        Float = { fg = palette.fg2 },

        Constant = { fg = palette.fg4 },
        Identifier = { fg = palette.fg4 },
        Number = { fg = palette.fg4 },
        String = { fg = palette.fg4 },

        Struct = { fg = palette.fg3 },
        Structure = { link = 'Struct' },

        Keyword = { fg = palette.fg3 },

        Todo = { fg = palette.fg2 },
        Conditional = { fg = palette.fg1 },
        Delimiter = { fg = palette.fg1 },
        Operator = { fg = palette.fg1 },
        Comment = { fg = palette.fg1 },

        Exception = { fg = palette.fg2 },
        Function = { fg = palette.fg3 },
        Statement = { fg = palette.fg4 },
        Variable = { fg = palette.fg5 },

        Label = { fg = palette.fg4 },

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
        ErrorMsg = { fg = palette.fg4 },
        WarningMsg = { fg = palette.fg4 },

        --spell
        SpellBad = { fg = palette.fg4, underline = true },
        SpellCap = { fg = palette.fg4, underline = true },
        SpellLocal = { fg = palette.fg4, underline = true },
        SpellRare = { fg = palette.fg4, underline = true },

        --markdown
        ['@markup.link.markdown_inline'] = { link = 'String' },
        ['@markup.link.label.markdown'] = { fg = palette.fg3 },
        ['@markup.link.label.markdown_inline'] = { fg = palette.fg3 },
        ['@lsp.type.class.markdown'] = { fg = palette.fg3 },

        -- treesitter
        ['@constructor'] = { link = 'Struct' },
        ['@keyword'] = { link = 'Keyword' },
        ['@variable'] = { link = 'Variable' },
        ['@variable.parameter'] = { link = 'Label' },
    }
end

return M
