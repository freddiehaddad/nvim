return {
    -- add ui animations
    {
        'echasnovski/mini.animate',
        config = function()
            local animate = require('mini.animate')
            local opts = {
                cursor = { enable = false },
                open = { enable = false },
                close = { enable = false },
                scroll = {
                    timing = animate.gen_timing.linear({
                        duration = 15,
                        unit = 'total',
                    }),
                    subscroll = animate.gen_subscroll.equal({
                        max_output_steps = 15,
                    }),
                },
            }
            animate.setup(opts)
        end,
    },

    -- allow deleting buffers
    {
        'echasnovski/mini.bufremove',
        lazy = false,
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
