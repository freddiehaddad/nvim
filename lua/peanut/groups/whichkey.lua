local M = {}

---@diagnostic disable-next-line: unused-local
function M.highlight(palette, opts)
    return {
        WhichKey = { link = "Function" },
        WhichKeyBorder = { link = "FloatBorder" }, --	border of the which-key window
        WhichKeyDesc = { link = "Identifier" }, -- description
        WhichKeyGroup = { link = "Keyword" }, -- group name
        WhichKeyIcon = { link = "@markup.link" }, -- icons
        WhichKeyIconAzure = { link = "Icon" },
        WhichKeyIconBlue = { link = "Icon" },
        WhichKeyIconCyan = { link = "Icon" },
        WhichKeyIconGreen = { link = "Icon" },
        WhichKeyIconGrey = { link = "Icon" },
        WhichKeyIconOrange = { link = "Icon" },
        WhichKeyIconPurple = { link = "Icon" },
        WhichKeyIconRed = { link = "Icon" },
        WhichKeyIconYellow = { link = "Icon" },
        WhichKeyNormal = { link = "NormalFloat" }, --normal in the which-key window
        WhichKeySeparator = { link = "Comment" }, -- separator between the key and its description
        WhichKeyTitle = { link = "Title" }, -- title of the which-key window
        WhichKeyValue = { link = "Comment" }, -- values by plugins (like marks, registers, etc)
    }
end

return M
