return {
    enabled = false,
    'mrjones2014/smart-splits.nvim',
    lazy = false,
    keys = {
        -- window movement
        {
            '<c-h>',
            function() require('smart-splits').move_cursor_left() end,
            desc = 'Move to left window',
        },
        {
            '<c-j>',
            function() require('smart-splits').move_cursor_down() end,
            desc = 'Move to lower window',
        },
        {
            '<c-k>',
            function() require('smart-splits').move_cursor_up() end,
            desc = 'Move to upper window',
        },
        {
            '<c-l>',
            function() require('smart-splits').move_cursor_right() end,
            desc = 'Move to right window',
        },

        -- window resizing
        {
            '<c-left>',
            function() require('smart-splits').resize_left() end,
            desc = 'Resize left',
        },
        {
            '<c-down>',
            function() require('smart-splits').resize_down() end,
            desc = 'Resize down',
        },
        {
            '<c-up>',
            function() require('smart-splits').resize_up() end,
            desc = 'Resize up',
        },
        {
            '<c-right>',
            function() require('smart-splits').resize_right() end,
            desc = 'Resize right',
        },
    },
    opts = {
        default_amount = 1, -- resize amount
        at_edge = 'stop', -- disable wrapping around edges
        log_level = 'trace',
    },
}
