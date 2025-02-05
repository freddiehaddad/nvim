local M = {}

---@diagnostic disable-next-line: unused-local
function M.highlight(palette, opts)
    return {
        -- code
        Type = { fg = palette.yellow },
        Boolean = { fg = palette.blue },
        Character = { fg = palette.blue },
        Float = { fg = palette.blue },

        Constant = { fg = palette.blue },
        Identifier = { fg = palette.white },
        Number = { fg = palette.blue },
        String = { fg = palette.white },

        Struct = { fg = palette.blue },
        Structure = { link = "Struct" },

        Keyword = { fg = palette.blue },

        Todo = { fg = palette.yellow },
        Conditional = { fg = palette.black },
        Delimiter = { fg = palette.black },
        Operator = { fg = palette.blue },
        Comment = { fg = palette.black },

        Exception = { fg = palette.yellow },
        Function = { fg = palette.blue },
        Statement = { fg = palette.cyan },
        Variable = { fg = palette.white },

        Label = { fg = palette.cyan },

        Repeat = { link = "Normal" },
        Include = { link = "Normal" },
        PreProc = { link = "Normal" },
        Define = { link = "Normal" },
        Macro = { link = "Normal" },
        PreCondit = { link = "Normal" },
        StorageClass = { link = "Normal" },
        Typedef = { link = "Normal" },
        Method = { fg = palette.blue },

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
