local M = {}

---@diagnostic disable-next-line: unused-local
function M.highlight(palette, opts)
    return {
        -- code
        Type = { fg = palette.white },
        Boolean = { fg = palette.white },
        Character = { fg = palette.white },
        Float = { fg = palette.white },

        Constant = { fg = palette.blue },
        Identifier = { fg = palette.blue },
        Number = { fg = palette.white },
        String = { fg = palette.white },

        Struct = { fg = palette.blue },
        Structure = { link = "Struct" },

        Keyword = { fg = palette.blue },

        Todo = { fg = palette.white },
        Conditional = { fg = palette.blue },
        Delimiter = { fg = palette.accent },
        Operator = { fg = palette.accent },
        Comment = { fg = palette.accent },

        Exception = { fg = palette.white },
        Function = { fg = palette.blue },
        Statement = { fg = palette.blue },
        Variable = { fg = palette.blue },

        Label = { fg = palette.blue },

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
        SpellBad = { fg = palette.red, underline = true },
        SpellCap = { fg = palette.red, underline = true },
        SpellLocal = { fg = palette.red, underline = true },
        SpellRare = { fg = palette.red, underline = true },

        --markdown
        ["@markup.italic"] = { italic = false },
        ["@markup.link.markdown_inline"] = { link = "String" },
        ["@markup.link.label.markdown"] = { fg = palette.blue },
        ["@markup.link.label.markdown_inline"] = { fg = palette.blue },
        ["@lsp.type.class.markdown"] = { fg = palette.blue },

        -- treesitter
        ["@constructor"] = { link = "Struct" },
        ["@constructor.lua"] = { link = "Delimiter" },
        ["@keyword"] = { link = "Keyword" },
        ["@variable"] = { link = "Variable" },
        ["@variable.parameter"] = { link = "Label" },
    }
end

return M
