return {
    -- add ui animations
    {
        'echasnovski/mini.animate',
        opts = { cursor = { enable = false } },
    },

    -- allow deleting buffers
    {
        'echasnovski/mini.bufremove',
        keys = {
            {
                '<leader>bd',
                function() require('mini.bufremove').delete(0, false) end,
                desc = 'Delete Buffer',
            },
            {
                '<leader>bD',
                function() require('mini.bufremove').delete(0, true) end,
                desc = 'Delete Buffer (Force)',
            },
        },
        opts = {},
    },

    -- code commenting
    {
        'echasnovski/mini.comment',
        opts = {},
    },

    -- code movement
    {
        'echasnovski/mini.move',
        opts = {},
    },

    -- surround
    {
        'echasnovski/mini.surround',
        opts = {
            mappings = {
                add = 'gsa', -- Add surrounding in Normal and Visual modes
                delete = 'gsd', -- Delete surrounding
                find = 'gsf', -- Find surrounding (to the right)
                find_left = 'gsF', -- Find surrounding (to the left)
                highlight = 'gsh', -- Highlight surrounding
                replace = 'gsr', -- Replace surrounding
                update_n_lines = 'gsn', -- Update `n_lines`
            },
        },
    },

    -- which key integration
    {
        'folke/which-key.nvim',
        opts = {
            spec = {
                { '<leader>b', group = 'buffer' },
                { 'gs', group = 'surround' },
            },
        },
    },
}
