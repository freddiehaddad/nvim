local M = {}

---@diagnostic disable-next-line: unused-local
function M.highlight(palette, opts)
    return {
        -- code
        Type = { fg = palette.blue },
        Boolean = { fg = palette.white },
        Character = { fg = palette.white },
        Float = { fg = palette.white },

        Constant = { fg = palette.white },
        Identifier = { fg = palette.white },
        Number = { fg = palette.white },
        String = { fg = palette.accent },

        Struct = { fg = palette.cyan },
        Structure = { link = "Struct" },

        Keyword = { fg = palette.blue },

        Todo = { fg = palette.white },
        Conditional = { fg = palette.white },
        Delimiter = { fg = palette.black },
        Operator = { fg = palette.black },
        Comment = { fg = palette.black },

        Exception = { fg = palette.white },
        Function = { fg = palette.white },
        Statement = { fg = palette.white },
        Variable = { fg = palette.cyan },

        Label = { fg = palette.white },

        Repeat = { link = "Normal" },
        Include = { link = "Normal" },
        PreProc = { link = "Normal" },
        Define = { link = "Normal" },
        Macro = { link = "Normal" },
        PreCondit = { link = "Normal" },
        StorageClass = { link = "Normal" },
        Typedef = { link = "Normal" },
        Method = { fg = palette.white },

        --errors
        ErrorMsg = { fg = palette.red },
        WarningMsg = { fg = palette.yellow },

        --spell
        SpellBad = { fg = palette.bg1, bg = palette.red },
        SpellCap = { fg = palette.bg1, bg = palette.red },
        SpellLocal = { fg = palette.bg1, bg = palette.red },
        SpellRare = { fg = palette.bg1, bg = palette.red },

        --markdown
        ["@markup.italic"] = { italic = false },
        ["@markup.link.markdown_inline"] = { link = "String" },
        ["@markup.link.label.markdown"] = { fg = palette.white },
        ["@markup.link.label.markdown_inline"] = { fg = palette.white },
        ["@lsp.type.class.markdown"] = { fg = palette.white },

        -- treesitter
        ["@constructor"] = { link = "Struct" },
        ["@constructor.lua"] = { link = "Delimiter" },
        ["@keyword"] = { link = "Keyword" },
        ["@variable"] = { link = "Variable" },
        ["@variable.parameter"] = { link = "Label" },
        ["@lsp.type.builtinType"] = { link = "Type" },
    }
end

return M
