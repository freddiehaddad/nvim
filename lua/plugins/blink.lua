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
                    auto_show = true,
                    window = { max_width = 80 },
                },
            },
        },
    },
}
