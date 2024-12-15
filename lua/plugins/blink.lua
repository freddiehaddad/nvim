return {
    -- auto completion
    {
        'saghen/blink.cmp',
        lazy = false,
        dependencies = {
            'rafamadriz/friendly-snippets',
        },
        build = 'cargo build --release',
        opts = {
            completion = {
                list = { selection = 'auto_insert' },
                documentation = {
                    window = { max_width = 80 },
                },
            },
            keymap = {
                preset = 'default',
                ['<C-space>'] = {},
                ['<C-k>'] = {
                    'show',
                    'show_documentation',
                    'hide_documentation',
                },
            },
        },
    },
}
