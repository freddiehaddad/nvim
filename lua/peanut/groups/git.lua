local M = {}

function M.highlight(palette, opts)
    return {
        SignAdd = { link = "DiffAdd" },
        SignChange = { link = "DiffAdd" },
        SignDelete = { link = "DiffAdd" },
        GitSignsAdd = { link = "DiffAdd" },
        GitSignsChange = { link = "DiffAdd" },
        GitSignsDelete = { link = "DiffAdd" },
        GitSignsCurrentLineBlame = { fg = palette.fg4 },
    }
end

return M
