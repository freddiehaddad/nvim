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
                StatusLine = { bg = 'none' },
                StatusLineNC = { bg = 'none' },
            },
        },
    },
    priority = 100,
}
