local M = {}

function M.highlight(palette, opts)
    return {
        -- MarkviewBlockQuoteWarn
        -- MarkviewBlockQuoteSpecial
        -- MarkviewBlockQuoteNote
        -- MarkviewBlockQuoteDefault
        MarkviewBlockQuoteOk = { fg = palette.fg1 },
        -- MarkviewBlockQuoteError
        -- MarkviewCheckboxCancelled
        -- MarkviewCheckboxChecked
        -- MarkviewCheckboxPending
        -- MarkviewCheckboxProgress
        -- MarkviewCheckboxUnchecked
        -- MarkviewCheckboxStriked
        MarkviewInlineCode = { fg = palette.fg1 },
        MarkviewCodeInfo = { fg = palette.fg1 },
        MarkviewCode = { fg = palette.fg1 },
        -- MarkviewIcon1
        -- MarkviewIcon1Sign
        -- MarkviewIcon1Fg
        -- MarkviewIcon2
        -- MarkviewIcon2Sign
        -- MarkviewIcon2Fg
        -- MarkviewIcon3
        -- MarkviewIcon3Sign
        -- MarkviewIcon3Fg
        -- MarkviewIcon4
        -- MarkviewIcon4Sign
        -- MarkviewIcon4Fg
        -- MarkviewIcon5
        -- MarkviewIcon5Sign
        -- MarkviewIcon5Fg
        -- MarkviewIcon6
        -- MarkviewIcon6Sign
        -- MarkviewIcon6Fg
        -- MarkviewHeading1Sign
        MarkviewHeading1 = { fg = palette.fg1 },
        -- MarkviewHeading2Sign
        MarkviewHeading2 = { fg = palette.fg1 },
        -- MarkviewHeading3Sign
        MarkviewHeading3 = { fg = palette.fg1 },
        -- MarkviewHeading4Sign
        MarkviewHeading4 = { fg = palette.fg1 },
        -- MarkviewHeading5Sign
        MarkviewHeading5 = { fg = palette.fg1 },
        -- MarkviewHeading6Sign
        MarkviewHeading6 = { fg = palette.fg1 },
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
        -- MarkviewEmail
        -- MarkviewImageLink
        -- MarkviewHyperlink
        -- MarkviewTableHeader
        -- MarkviewTableBorder
        -- MarkviewTableAlignCenter
        -- MarkviewTableAlignLeft
        -- MarkviewTableAlignRight
    }
end

return M
