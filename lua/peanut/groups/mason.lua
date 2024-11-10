local M = {}

function M.highlight(palette, opts)
    return {
        MasonNormal = { link = 'Normal' },
        MasonHeader = { link = 'Normal' },
        MasonHeaderSecondary = { link = 'Normal' },

        MasonHighlight = { link = 'Normal' },
        MasonHighlightBlock = { link = 'Normal' },
        MasonHighlightBlockBold = { link = 'Normal' },

        MasonHighlightSecondary = { link = 'Normal' },
        MasonHighlightBlockSecondary = { link = 'Normal' },
        MasonHighlightBlockBoldSecondary = { link = 'Normal' },

        MasonLink = { link = 'Normal' },

        MasonMuted = { link = 'Normal' },
        MasonMutedBlock = { link = 'Normal' },
        MasonMutedBlockBold = { link = 'Normal' },

        MasonError = { link = 'ErrorMsg' },
        MasonWarning = { link = 'WarningMsg' },

        MasonHeading = { link = 'Normal' },
    }
end

return M
