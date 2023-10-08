local M = {}

---@diagnostic disable-next-line: unused-local
function M.highlight(palette, opts)
    return {
        -- MarkviewBlockQuoteWarn
        -- MarkviewBlockQuoteSpecial
        -- MarkviewBlockQuoteNote
        -- MarkviewBlockQuoteDefault
        MarkviewBlockQuoteOk = { link = "Label" },
        -- MarkviewBlockQuoteError
        -- MarkviewCheckboxCancelled
        -- MarkviewCheckboxChecked
        -- MarkviewCheckboxPending
        -- MarkviewCheckboxProgress
        -- MarkviewCheckboxUnchecked
        -- MarkviewCheckboxStriked
        MarkviewInlineCode = { link = "Constant" },
        MarkviewCodeInfo = { link = "Constant" },
        MarkviewCode = { link = "Constant" },
        MarkviewIcon1 = { link = "Icon" },
        -- MarkviewIcon1Sign
        -- MarkviewIcon1Fg
        MarkviewIcon2 = { link = "Icon" },
        -- MarkviewIcon2Sign
        -- MarkviewIcon2Fg
        MarkviewIcon3 = { link = "Icon" },
        -- MarkviewIcon3Sign
        -- MarkviewIcon3Fg
        MarkviewIcon4 = { link = "Icon" },
        -- MarkviewIcon4Sign
        -- MarkviewIcon4Fg
        MarkviewIcon5 = { link = "Icon" },
        -- MarkviewIcon5Sign
        -- MarkviewIcon5Fg
        MarkviewIcon6 = { link = "Icon" },
        -- MarkviewIcon6Sign
        -- MarkviewIcon6Fg
        -- MarkviewHeading1Sign
        MarkviewHeading1 = { link = "Title" },
        -- MarkviewHeading2Sign
        MarkviewHeading2 = { link = "Title" },
        -- MarkviewHeading3Sign
        MarkviewHeading3 = { link = "Title" },
        -- MarkviewHeading4Sign
        MarkviewHeading4 = { link = "Title" },
        -- MarkviewHeading5Sign
        MarkviewHeading5 = { link = "Title" },
        -- MarkviewHeading6Sign
        MarkviewHeading6 = { link = "Title" },
        -- MarkviewGradient1
        -- MarkviewGradient2
        -- MarkviewGradient3
        -- MarkviewGradient4
        -- MarkviewGradient5
        -- MarkviewGradient6
        -- MarkviewGradient7
        -- MarkviewGradient8
        -- MarkviewGradient9
        -- MarkviewGradient10
        -- MarkviewLatexSubscript
        -- MarkviewLatexSuperscript
        -- MarkviewListItemStar
        -- MarkviewListItemPlus
        -- MarkviewListItemMinus
        MarkviewEmail = { link = "Label" },
        MarkviewImageLink = { link = "Label" },
        MarkviewHyperlink = { link = "Label" },
        -- MarkviewTableHeader
        -- MarkviewTableBorder
        -- MarkviewTableAlignCenter
        -- MarkviewTableAlignLeft
        -- MarkviewTableAlignRight
    }
end

return M
