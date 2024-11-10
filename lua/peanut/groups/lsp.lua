local M = {}

function M.highlight(palette, opts)
    return {
        LspReferenceRead = { bg = '#36383F' },
        LspReferenceText = { bg = '#36383F' },
        LspReferenceWrite = { bg = '#36383f' },
        DiagnosticError = { fg = palette.blue_bright },
        DiagnosticWarn = { fg = palette.blue },
        DiagnosticInfo = { fg = palette.blue },
        DiagnosticHint = { fg = palette.blue },
        DiagnosticVirtualTextError = { fg = palette.blue_bright },
        DiagnosticVirtualTextWarn = { fg = palette.blue },
        DiagnosticVirtualTextInfo = { fg = palette.blue },
        DiagnosticVirtualTextHint = { fg = palette.blue },
        DiagnosticUnderlineError = vim.tbl_extend(
            'force',
            { sp = palette.blue_bright },
            opts.styles.lsp
        ),
        DiagnosticUnderlineWarn = vim.tbl_extend(
            'force',
            { sp = palette.blue },
            opts.styles.lsp
        ),
        DiagnosticUnderlineInfo = vim.tbl_extend(
            'force',
            { sp = palette.blue },
            opts.styles.lsp
        ),
        DiagnosticUnderlineHint = vim.tbl_extend(
            'force',
            { sp = palette.blue },
            opts.styles.lsp
        ),
        LspSignatureActiveParameter = { bg = palette.bg_bright, bold = true },
        LspCodeLens = { fg = palette.gray_dim },
        LspInlayHint = { bg = palette.blue },
        LspInfoBorder = { fg = palette.fg, bg = palette.bg_bright },
    }
end

return M
