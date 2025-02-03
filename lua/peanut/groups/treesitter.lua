local M = {}

---@diagnostic disable-next-line: unused-local
function M.highlight(palette, opts)
    return {
        -- code
        Type = { fg = palette.blue1 },
        Boolean = { fg = palette.blue2 },
        Character = { fg = palette.blue2 },
        Float = { fg = palette.blue2 },

        Constant = { fg = palette.blue2 },
        Identifier = { fg = palette.blue2 },
        Number = { fg = palette.blue2 },
        String = { fg = palette.white1 },

        Struct = { fg = palette.blue2 },
        Structure = { link = "Struct" },

        Keyword = { fg = palette.blue1 },

        Todo = { fg = palette.yellow },
        Conditional = { fg = palette.blue1 },
        Delimiter = { fg = palette.blue1 },
        Operator = { fg = palette.blue1 },
        Comment = { fg = palette.blue1 },

        Exception = { fg = palette.white1 },
        Function = { fg = palette.white1 },
        Statement = { fg = palette.white1 },
        Variable = { fg = palette.white1 },

        Label = { fg = palette.blue2 },

        Repeat = { link = "Normal" },
        Include = { link = "Normal" },
        PreProc = { link = "Normal" },
        Define = { link = "Normal" },
        Macro = { link = "Normal" },
        PreCondit = { link = "Normal" },
        StorageClass = { link = "Normal" },
        Typedef = { link = "Normal" },
        Method = { fg = palette.blue2 },

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
        ["@markup.link.label.markdown"] = { fg = palette.blue2 },
        ["@markup.link.label.markdown_inline"] = { fg = palette.blue2 },
        ["@lsp.type.class.markdown"] = { fg = palette.blue2 },

        -- treesitter
        ["@constructor"] = { link = "Struct" },
        ["@constructor.lua"] = { link = "Delimiter" },
        ["@keyword"] = { link = "Keyword" },
        ["@variable"] = { link = "Variable" },
        ["@variable.parameter"] = { link = "Label" },
    }
end

return M
