return {
    'folke/which-key.nvim',
    init = function()
        vim.opt.timeout = true
        vim.opt.timeoutlen = 300
    end,
    opts = {
        -- preset = 'modern',
        icons = {
            separator = ':',
        },
        spec = {
            { '<leader>f', group = 'find' },
            { '<leader>q', group = 'quit' },
            { '<leader>s', group = 'search' },
            { '<leader>t', group = 'test/toggle' },
            { '<leader>w', group = 'windows' },
            { '[', group = 'prev' },
            { ']', group = 'next' },
            { 'g', group = 'goto/actions' },
            { 'z', group = 'folds/jumps/spelling' },
        },
    },
}
