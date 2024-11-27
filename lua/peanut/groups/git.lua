local M = {}

function M.highlight(palette, opts)
    return {
        -- default hightlights
        DiffAdd = { link = 'Added' },
        DiffChange = { link = 'Changed' },
        DiffDelete = { link = 'Removed' },
        DiffText = { link = 'NonText' },

        SignAdd = { link = 'DiffAdd' },
        SignChange = { link = 'DiffChange' },
        SignDelete = { link = 'DiffDelete' },

        -- git signs addon
        GitSignsAdd = { link = 'DiffAdd' },
        GitSignsChange = { link = 'DiffChange' },
        GitSignsDelete = { link = 'DiffDelete' },
        GitSignsCurrentLineBlame = { link = 'DiffText' },
        -- GitSignsChangedelete xxx links to GitSignsChange
        -- GitSignsTopdelete xxx links to GitSignsDelete
        -- GitSignsUntracked xxx links to GitSignsAdd
        -- GitSignsAddNr  xxx links to GitSignsAdd
        -- GitGutterAddLineNr xxx cleared
        -- GitSignsChangeNr xxx links to GitSignsChange
        -- GitGutterChangeLineNr xxx cleared
        -- GitSignsDeleteNr xxx links to GitSignsDelete
        -- GitGutterDeleteLineNr xxx cleared
        -- GitSignsChangedeleteNr xxx links to GitSignsChangeNr
        -- GitSignsTopdeleteNr xxx links to GitSignsDeleteNr
        -- GitSignsUntrackedNr xxx links to GitSignsAddNr
        -- GitSignsAddLn  xxx links to DiffAdd
        -- GitGutterAddLine xxx cleared
        -- SignifyLineAdd xxx cleared
        -- GitSignsChangeLn xxx links to DiffChange
        -- GitGutterChangeLine xxx cleared
        -- SignifyLineChange xxx cleared
        -- GitSignsChangedeleteLn xxx links to GitSignsChangeLn
        -- GitSignsUntrackedLn xxx links to GitSignsAddLn
        -- GitSignsAddCul xxx links to GitSignsAdd
        -- GitSignsChangeCul xxx links to GitSignsChange
        -- GitSignsDeleteCul xxx links to GitSignsDelete
        -- GitSignsChangedeleteCul xxx links to GitSignsChangeCul
        -- GitSignsTopdeleteCul xxx links to GitSignsDeleteCul
        -- GitSignsUntrackedCul xxx links to GitSignsAddCul
        GitSignsStagedAdd = { link = 'DiffAdd' },
        GitSignsStagedChange = { link = 'DiffChange' },
        GitSignsStagedDelete = { link = 'DiffDelete' },
        GitSignsStagedChangedelete = { link = 'DiffDelete' },
        GitSignsStagedTopdelete = { link = 'DiffDelete' },
        GitSignsStagedAddNr = { link = 'DiffAdd' },
        GitSignsStagedChangeNr = { link = 'DiffChange' },
        GitSignsStagedDeleteNr = { link = 'DiffDelete' },
        GitSignsStagedChangedeleteNr = { link = 'DiffDelete' },
        GitSignsStagedTopdeleteNr = { link = 'DiffDelete' },
        GitSignsStagedAddLn = { link = 'DiffAdd' },
        GitSignsStagedChangeLn = { link = 'DiffChange' },
        -- GitSignsStagedDeleteLn xxx cleared
        -- GitSignsDeleteLn xxx cleared
        GitSignsStagedChangedeleteLn = { link = 'DiffDelete' },
        -- GitSignsStagedTopdeleteLn xxx cleared
        -- GitSignsTopdeleteLn xxx cleared
        GitSignsStagedAddCul = { link = 'DiffAdd' },
        GitSignsStagedChangeCul = { link = 'DiffChange' },
        GitSignsStagedDeleteCul = { link = 'DiffDelete' },
        GitSignsStagedChangedeleteCul = { link = 'DiffDelete' },
        GitSignsStagedTopdeleteCul = { link = 'DiffDelete' },
        GitSignsAddPreview = { link = 'DiffAdd' },
        GitSignsDeletePreview = { link = 'DiffDelete' },
        -- GitGutterDeleteLine xxx cleared
        -- SignifyLineDelete xxx cleared
        GitSignsAddInline = { link = 'DiffAdd' },
        GitSignsChangeInline = { link = 'DiffChange' },
        GitSignsDeleteInline = { link = 'DiffDelete' },
        GitSignsAddLnInline = { link = 'DiffAdd' },
        GitSignsChangeLnInline = { link = 'DiffChange' },
        GitSignsDeleteLnInline = { link = 'DiffDelete' },
        GitSignsDeleteVirtLn = { link = 'DiffDelete' },
        GitSignsDeleteVirtLnInLine = { link = 'DiffDelete' },
        GitSignsVirtLnum = { link = 'DiffDelete' },
    }
end

return M
