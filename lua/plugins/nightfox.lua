return {
    'EdenEast/nightfox.nvim',
    init = function()
        vim.cmd.colorscheme('nightfox')

        local hl = vim.api.nvim_set_hl
        hl(0, '@markup.link.url', { italic = false, underline = false })
        hl(0, '@markup.raw', { italic = false, underline = false })
    end,
    opts = {
        options = {
            transparent = true,
            styles = {
                comments = 'NONE',
                conditionals = 'NONE',
                constants = 'NONE',
                functions = 'NONE',
                keywords = 'NONE',
                numbers = 'NONE',
                operators = 'NONE',
                strings = 'NONE',
                types = 'NONE',
                variables = 'NONE',
            },
        },
        palettes = {
            nightfox = {
                bg0 = '#090c11',
                bg1 = '#121821',
            },
        },
        groups = {
            nightfox = {
                DiagnosticUnderlineError = {
                    fg = 'diag.error',
                    style = 'underline',
                },
                DiagnosticUnderlineWarn = {
                    fg = 'diag.warn',
                    style = 'underline',
                },
                DiagnosticUnderlineInfo = {
                    fg = 'diag.info',
                    style = 'underline',
                },
                DiagnosticUnderlineHint = {
                    fg = 'diag.hint',
                    style = 'underline',
                },
                StatusLine = { bg = 'none' },
                StatusLineNC = { bg = 'none' },
                SpellBad = { fg = 'diag.error', style = 'underline' },
                SpellCap = { fg = 'diag.warn', style = 'underline' },
                SpellLocal = { fg = 'diag.info', style = 'underline' },
                SpellRare = { fg = 'diag.info', style = 'underline' },
            },
        },
    },
    priority = 100,
}
