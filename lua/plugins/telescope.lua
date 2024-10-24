return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        keys = {
            -- f
            {
                '<leader>ff',
                function() require('telescope.builtin').find_files() end,
                desc = 'Find files',
            },
            {
                '<leader>fF',
                function()
                    require('telescope.builtin').find_files({
                        hidden = true,
                        no_ignore = true,
                    })
                end,
                desc = 'Find files (hidden)',
            },
            {
                '<leader>fb',
                function()
                    require('telescope.builtin').buffers({
                        ignore_current_buffer = true,
                        sort_mru = true,
                    })
                end,
                desc = 'Find buffers',
            },

            -- s
            {
                '<leader>sb',
                function()
                    require('telescope.builtin').current_buffer_fuzzy_find()
                end,
                desc = 'Search buffer',
            },
            {
                '<leader>sg',
                function()
                    require('telescope.builtin').live_grep({
                        additional_args = { '--no-ignore' },
                    })
                end,
                desc = 'Grep files',
            },
            {
                '<leader>sG',
                function()
                    require('telescope.builtin').live_grep({
                        grep_open_files = true,
                    })
                end,
                desc = 'Grep files (Open files)',
            },
            {
                '<leader>sh',
                function() require('telescope.builtin').help_tags() end,
                desc = 'Search help tags',
            },
            {
                '<leader>sH',
                function() require('telescope.builtin').highlights() end,
                desc = 'Search highlights',
            },
            {
                '<leader>sw',
                function()
                    require('telescope.builtin').grep_string({
                        word_match = '-w',
                    })
                end,
                desc = 'Search word',
            },
            {
                '<leader>sw',
                function()
                    require('telescope.builtin').grep_string({
                        word_match = '-w',
                    })
                end,
                mode = 'v',
                desc = 'Search selection',
            },

            {
                '<leader>R',
                function() require('telescope.builtin').resume() end,
                desc = 'Resume',
            },
        },
        opts = {
            defaults = {
                -- use square corners
                borderchars = {
                    '─',
                    '│',
                    '─',
                    '│',
                    '┌',
                    '┐',
                    '┘',
                    '└',
                },
                mappings = {
                    i = {
                        ['<c-h>'] = 'select_horizontal',
                        ['<c-x>'] = 'which_key',
                    },
                },
            },
        },
    },

    -- native fuzzy search for telescope
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
        dependencies = {
            'nvim-telescope/telescope.nvim',
            opts = { extensions = { fzf = {} } },
        },
        init = function() require('telescope').load_extension('fzf') end,
    },

    -- telescope undo extension
    {
        'debugloop/telescope-undo.nvim',
        dependencies = {
            'nvim-telescope/telescope.nvim',
            opts = {
                extensions = {
                    undo = {
                        use_delta = false,
                        layout_config = {
                            preview_width = 0.75,
                        },
                        mappings = {
                            i = {
                                ['<cr>'] = function(...)
                                    return require('telescope-undo.actions').yank_additions(
                                        ...
                                    )
                                end,
                                ['<c-y>'] = function(...)
                                    return require('telescope-undo.actions').yank_deletions(
                                        ...
                                    )
                                end,
                                ['<c-r>'] = function(...)
                                    return require('telescope-undo.actions').restore(
                                        ...
                                    )
                                end,
                            },
                            n = {
                                ['y'] = function(...)
                                    return require('telescope-undo.actions').yank_additions(
                                        ...
                                    )
                                end,
                                ['Y'] = function(...)
                                    return require('telescope-undo.actions').yank_deletions(
                                        ...
                                    )
                                end,
                                ['r'] = function(...)
                                    return require('telescope-undo.actions').restore(
                                        ...
                                    )
                                end,
                            },
                        },
                    },
                },
                pickers = {
                    lsp_document_symbols = {
                        symbol_width = 50, -- allow more room for symbol name
                    },
                    diagnostics = {
                        layout_strategy = 'vertical',
                        layout_config = {
                            preview_height = 0.65,
                        },
                    },
                },
            },
        },
        init = function() require('telescope').load_extension('undo') end,
        keys = {
            {
                '<leader>su',
                function() require('telescope').extensions.undo.undo({}) end,
                desc = 'Search undo history',
            },
        },
    },
}
