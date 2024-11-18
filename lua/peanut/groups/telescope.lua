local M = {}

function M.highlight(palette, opts)
    return {
        -- Sets the highlight for selected items within the picker.
        TelescopeSelection = { link = 'PmenuSel' },
        TelescopeSelectionCaret = { link = 'TelescopeSelection' },
        TelescopeMultiSelection = { link = 'Type' },
        TelescopeMultiIcon = { link = 'Identifier' },

        -- "Normal" in the floating windows created by telescope.
        TelescopeNormal = { link = 'NormalFloat' },
        TelescopePreviewNormal = { link = 'TelescopeNormal' },
        TelescopePromptNormal = { link = 'TelescopeNormal' },
        TelescopeResultsNormal = { link = 'TelescopeNormal' },

        -- Border highlight groups.
        --   Use TelescopeBorder to override the default.
        --   Otherwise set them specifically
        TelescopeBorder = { link = 'FloatBorder' },
        TelescopePromptBorder = { link = 'TelescopeBorder' },
        TelescopeResultsBorder = { link = 'TelescopeBorder' },
        TelescopePreviewBorder = { link = 'TelescopeBorder' },

        -- Title highlight groups.
        --   Use TelescopeTitle to override the default.
        --   Otherwise set them specifically
        TelescopeTitle = { link = 'TelescopeBorder' },
        TelescopePromptTitle = { link = 'TelescopeTitle' },
        TelescopeResultsTitle = { link = 'TelescopeTitle' },
        TelescopePreviewTitle = { link = 'TelescopeTitle' },

        TelescopePromptCounter = { link = 'NonText' },

        -- Used for highlighting characters that you match.
        TelescopeMatching = { bg = palette.fg1 },

        -- Used for the prompt prefix
        TelescopePromptPrefix = { link = 'Identifier' },

        -- Used for highlighting the matched line inside Previewer. Works only for (vim_buffer_ previewer)
        TelescopePreviewLine = { link = 'Visual' },
        TelescopePreviewMatch = { link = 'Search' },

        TelescopePreviewPipe = { link = 'Constant' },
        TelescopePreviewCharDev = { link = 'Constant' },
        TelescopePreviewDirectory = { link = 'Directory' },
        TelescopePreviewBlock = { link = 'Constant' },
        TelescopePreviewLink = { link = 'Special' },
        TelescopePreviewSocket = { link = 'Statement' },
        TelescopePreviewRead = { link = 'Constant' },
        TelescopePreviewWrite = { link = 'Statement' },
        TelescopePreviewExecute = { link = 'String' },
        TelescopePreviewHyphen = { link = 'NonText' },
        TelescopePreviewSticky = { link = 'Keyword' },
        TelescopePreviewSize = { link = 'String' },
        TelescopePreviewUser = { link = 'Constant' },
        TelescopePreviewGroup = { link = 'Constant' },
        TelescopePreviewDate = { link = 'Directory' },
        TelescopePreviewMessage = { link = 'TelescopePreviewNormal' },
        TelescopePreviewMessageFillchar = { link = 'TelescopePreviewMessage' },

        -- Used for Picker specific Results highlighting
        TelescopeResultsClass = { link = 'Function' },
        TelescopeResultsConstant = { link = 'Constant' },
        TelescopeResultsField = { link = 'Function' },
        TelescopeResultsFunction = { link = 'Function' },
        TelescopeResultsMethod = { link = 'Method' },
        TelescopeResultsOperator = { link = 'Operator' },
        TelescopeResultsStruct = { link = 'Struct' },
        TelescopeResultsVariable = { link = 'SpecialChar' },

        TelescopeResultsLineNr = { link = 'LineNr' },
        TelescopeResultsIdentifier = { link = 'Identifier' },
        TelescopeResultsNumber = { link = 'Number' },
        TelescopeResultsComment = { link = 'Comment' },
        TelescopeResultsSpecialComment = { link = 'SpecialComment' },

        -- Used for git status Results highlighting
        TelescopeResultsDiffChange = { link = 'DiffChange' },
        TelescopeResultsDiffAdd = { link = 'DiffAdd' },
        TelescopeResultsDiffDelete = { link = 'DiffDelete' },
        TelescopeResultsDiffUntracked = { link = 'NonText' },
    }
end

return M
