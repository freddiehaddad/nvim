local M = {}

function M.highlight(palette, opts)
    return {
        -- Standard:
        NvimTreeNormal = { link = 'Normal' },
        NvimTreeNormalFloat = { link = 'NormalFloat' },
        NvimTreeNormalNC = { link = 'NormalFloat' },

        NvimTreeLineNr = { link = 'LineNr' },
        NvimTreeWinSeparator = { link = 'WinSeparator' },
        NvimTreeEndOfBuffer = { link = 'EndOfBuffer' },
        NvimTreePopup = { link = 'Normal' },
        NvimTreeSignColumn = { link = 'NvimTreeNormal' },

        NvimTreeCursorColumn = { link = 'CursorColumn' },
        NvimTreeCursorLine = { link = 'CursorLine' },
        NvimTreeCursorLineNr = { link = 'CursorLineNr' },

        NvimTreeStatusLine = { link = 'StatusLine' },
        NvimTreeStatusLineNC = { link = 'StatusLineNC' },

        -- File Text:
        NvimTreeExecFile = { link = 'SpellCap' },
        NvimTreeImageFile = { link = 'SpellCap' },
        NvimTreeSpecialFile = { link = 'SpellCap' },
        NvimTreeSymlink = { link = 'SpellCap' },

        -- Folder Text:
        NvimTreeRootFolder = { link = 'Title' },
        NvimTreeFolderName = { link = 'Directory' },
        NvimTreeEmptyFolderName = { link = 'Directory' },
        NvimTreeOpenedFolderName = { link = 'Directory' },
        NvimTreeSymlinkFolderName = { link = 'Directory' },

        -- File Icons:
        NvimTreeFileIcon = { link = 'NvimTreeNormal' },
        NvimTreeSymlinkIcon = { link = 'NvimTreeNormal' },

        -- Folder Icons:
        NvimTreeFolderIcon = { link = 'Normal' },
        NvimTreeOpenedFolderIcon = { link = 'NvimTreeFolderIcon' },
        NvimTreeClosedFolderIcon = { link = 'NvimTreeFolderIcon' },
        NvimTreeFolderArrowClosed = { link = 'NvimTreeIndentMarker' },
        NvimTreeFolderArrowOpen = { link = 'NvimTreeIndentMarker' },

        -- Indent:
        NvimTreeIndentMarker = { link = 'NvimTreeFileIcon' },

        -- Picker:
        NvimTreeWindowPicker = { link = 'Normal' },

        -- Live Filter:
        NvimTreeLiveFilterPrefix = { link = 'PreProc' },
        NvimTreeLiveFilterValue = { link = 'ModeMsg' },

        -- Clipboard:
        NvimTreeCopiedHL = { link = 'SpellRare' },
        NvimTreeCutHL = { link = 'SpellBad' },

        -- Bookmarks:
        NvimTreeBookmarkIcon = { link = 'NvimTreeFolderIcon' },
        NvimTreeBookmarkHL = { link = 'SpellLocal' },

        -- Modified:
        NvimTreeModifiedIcon = { link = 'Type' },
        NvimTreeModifiedFileHL = { link = 'NvimTreeModifiedIcon' },
        NvimTreeModifiedFolderHL = { link = 'NvimTreeModifiedIcon' },

        -- Hidden:
        NvimTreeModifiedIcon = { link = 'Conceal' },
        NvimTreeModifiedFileHL = { link = 'NvimTreeHiddenIcon' },
        NvimTreeModifiedFolderHL = { link = 'NvimTreeHiddenFileHL' },

        -- Hidden Display:
        NvimTreeHiddenDisplay = { link = 'Conceal' },

        -- Opened:
        NvimTreeOpenedHL = { link = 'Special' },

        -- Git Icon:
        NvimTreeGitDeletedIcon = { link = 'Statement' },
        NvimTreeGitDirtyIcon = { link = 'Statement' },
        NvimTreeGitIgnoredIcon = { link = 'Comment' },
        NvimTreeGitMergeIcon = { link = 'Constant' },
        NvimTreeGitNewIcon = { link = 'PreProc' },
        NvimTreeGitRenamedIcon = { link = 'PreProc' },
        NvimTreeGitStagedIcon = { link = 'Constant' },

        -- Git File File Highlight:
        NvimTreeGitFileDeletedHL = { link = 'NvimTreeGitDeletedIcon' },
        NvimTreeGitFileDirtyHL = { link = 'NvimTreeGitDirtyIcon' },
        NvimTreeGitFileIgnoredHL = { link = 'NvimTreeGitIgnoredIcon' },
        NvimTreeGitFileMergeHL = { link = 'NvimTreeGitMergeIcon' },
        NvimTreeGitFileNewHL = { link = 'NvimTreeGitNewIcon' },
        NvimTreeGitFileRenamedHL = { link = 'NvimTreeGitRenamedIcon' },
        NvimTreeGitFileStagedHL = { link = 'NvimTreeGitStagedIcon' },

        -- Git Folder Folder Highlight:
        NvimTreeGitFolderDeletedHL = { link = 'NvimTreeGitFileDeletedHL' },
        NvimTreeGitFolderDirtyHL = { link = 'NvimTreeGitFileDirtyHL' },
        NvimTreeGitFolderIgnoredHL = { link = 'NvimTreeGitFileIgnoredHL' },
        NvimTreeGitFolderMergeHL = { link = 'NvimTreeGitFileMergeHL' },
        NvimTreeGitFolderNewHL = { link = 'NvimTreeGitFileNewHL' },
        NvimTreeGitFolderRenamedHL = { link = 'NvimTreeGitFileRenamedHL' },
        NvimTreeGitFolderStagedHL = { link = 'NvimTreeGitFileStagedHL' },

        -- Diagnostics Icon:
        NvimTreeDiagnosticErrorIcon = { link = 'DiagnosticError' },
        NvimTreeDiagnosticWarnIcon = { link = 'DiagnosticWarn' },
        NvimTreeDiagnosticInfoIcon = { link = 'DiagnosticInfo' },
        NvimTreeDiagnosticHintIcon = { link = 'DiagnosticHint' },

        -- Diagnostics File Highlight:
        NvimTreeDiagnosticErrorFileHL = { link = 'DiagnosticUnderlineError' },
        NvimTreeDiagnosticWarnFileHL = { link = 'DiagnosticUnderlineWarn' },
        NvimTreeDiagnosticInfoFileHL = { link = 'DiagnosticUnderlineInfo' },
        NvimTreeDiagnosticHintFileHL = { link = 'DiagnosticUnderlineHint' },

        -- Diagnostics Folder Highlight:
        NvimTreeDiagnosticErrorFolderHL = {
            link = 'NvimTreeDiagnosticErrorFileHL',
        },
        NvimTreeDiagnosticWarnFolderHL = { link = 'NvimTreeDiagnosticWarnFileHL' },
        NvimTreeDiagnosticInfoFolderHL = { link = 'NvimTreeDiagnosticInfoFileHL' },
        NvimTreeDiagnosticHintFolderHL = { link = 'NvimTreeDiagnosticHintFileHL' },
    }
end

return M
