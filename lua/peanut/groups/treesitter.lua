local M = {}

---@diagnostic disable-next-line: unused-local
function M.highlight(palette, opts)
    return {
        -- code
        Type = { fg = palette.white },
        Boolean = { fg = palette.white },
        Character = { fg = palette.white },
        Float = { fg = palette.white },

        Constant = { fg = palette.white },
        Identifier = { fg = palette.magenta },
        Number = { fg = palette.white },
        String = { fg = palette.blue },

        Struct = { fg = palette.white },
        Structure = { link = "Struct" },

        Keyword = { fg = palette.blue },

        Todo = { fg = palette.white },
        Conditional = { fg = palette.white },
        Delimiter = { fg = palette.black },
        Operator = { fg = palette.black },
        Comment = { fg = palette.black },

        Exception = { fg = palette.white },
        Function = { fg = palette.cyan },
        Statement = { fg = palette.white },
        Variable = { fg = palette.red },

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
        ErrorMsg = { fg = palette.white },
        WarningMsg = { fg = palette.white },

        --spell
        SpellBad = { fg = palette.bg1, bg = palette.white },
        SpellCap = { fg = palette.bg1, bg = palette.white },
        SpellLocal = { fg = palette.bg1, bg = palette.white },
        SpellRare = { fg = palette.bg1, bg = palette.white },

        --markdown
        ["@markup.italic"] = { italic = false },
        ["@markup.link.markdown_inline"] = { link = "String" },
        ["@markup.link.label.markdown"] = { fg = palette.white },
        ["@markup.link.label.markdown_inline"] = { fg = palette.white },
        ["@lsp.type.class.markdown"] = { fg = palette.white },

        -- treesitter
        ["@constructor.lua"] = { link = "Delimiter" },
        ["@variable"] = { link = "Variable" },
        ["@variable.parameter"] = { fg = palette.magenta },
        ["@lsp.type.builtinType"] = { link = "Type" },
    }
end

return M
