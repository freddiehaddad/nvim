local M = {}

---@diagnostic disable-next-line: unused-local
function M.highlight(palette, opts)
    return {
        -- code
        Type = { fg = palette.white },
        Boolean = { fg = palette.white },
        Character = { fg = palette.white },
        Float = { fg = palette.white },

        Constant = { fg = palette.yellow },
        Identifier = { fg = palette.yellow },
        Number = { fg = palette.yellow },
        String = { fg = palette.yellow },

        Struct = { fg = palette.green },
        Structure = { link = "Struct" },

        Keyword = { fg = palette.green },

        Todo = { fg = palette.white },
        Conditional = { fg = palette.blue },
        Delimiter = { fg = palette.blue },
        Operator = { fg = palette.blue },
        Comment = { fg = palette.blue },

        Exception = { fg = palette.white },
        Function = { fg = palette.green },
        Statement = { fg = palette.yellow },
        Variable = { fg = palette.yellow },

        Label = { fg = palette.yellow },

        Repeat = { link = "Normal" },
        Include = { link = "Normal" },
        PreProc = { link = "Normal" },
        Define = { link = "Normal" },
        Macro = { link = "Normal" },
        PreCondit = { link = "Normal" },
        StorageClass = { link = "Normal" },
        Typedef = { link = "Normal" },
        Method = { link = "Normal" },

        --errors
        ErrorMsg = { fg = palette.red },
        WarningMsg = { fg = palette.yellow },

        --spell
        SpellBad = { fg = palette.yellow, underline = true },
        SpellCap = { fg = palette.yellow, underline = true },
        SpellLocal = { fg = palette.yellow, underline = true },
        SpellRare = { fg = palette.yellow, underline = true },

        --markdown
        ["@markup.italic"] = { italic = false },
        ["@markup.link.markdown_inline"] = { link = "String" },
        ["@markup.link.label.markdown"] = { fg = palette.green },
        ["@markup.link.label.markdown_inline"] = { fg = palette.green },
        ["@lsp.type.class.markdown"] = { fg = palette.green },

        -- treesitter
        ["@constructor"] = { link = "Struct" },
        ["@keyword"] = { link = "Keyword" },
        ["@variable"] = { link = "Variable" },
        ["@variable.parameter"] = { link = "Label" },
    }
end

return M
