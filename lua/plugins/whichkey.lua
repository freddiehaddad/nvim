return {
    'folke/which-key.nvim',
    config = function(_, opts)
        local wk = require('which-key')
        wk.setup(opts)
        wk.register(opts.defaults)
    end,
    init = function()
        vim.opt.timeout = true
        vim.opt.timeoutlen = 300
    end,
    opts = {
        defaults = {
            mode = { 'n', 'v' },
            [']'] = { name = '+next' },
            ['['] = { name = '+prev' },
            ['g'] = { name = '+goto/actions' },
            ['z'] = { name = '+folds/jumps/spelling' },
            --['<leader>c'] = { name = '+code' },
            ['<leader>f'] = { name = '+find' },
            --['<leader>h'] = { name = '+hunks' },
            ['<leader>q'] = { name = '+quit' },
            ['<leader>s'] = { name = '+search' },
            ['<leader>t'] = { name = '+test/toggle' },
            ['<leader>w'] = { name = '+windows' },
        },
    },
}
