--[[
Lua language support requires installing:

LSP
    - lua-language-server

Formatter
    - stylua
--]]
return {
    -- lsp
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            {
                'folke/lazydev.nvim',
                dependencies = {
                    {
                        -- optional `vim.uv` typings
                        'Bilal2453/luvit-meta',
                        lazy = true,
                    },
                    {
                        -- optional completion source for require statements and module annotations
                        'hrsh7th/nvim-cmp',
                        opts = function(_, opts)
                            opts.sources = opts.sources or {}
                            table.insert(opts.sources, {
                                name = 'lazydev',
                                -- set group index to 0 to skip loading LuaLS completions
                                group_index = 0,
                            })
                        end,
                    },
                },
                ft = 'lua',
                opts = {
                    library = {
                        'luvit-meta/library',
                    },
                },
            },
            {
                'williamboman/mason-lspconfig.nvim',
                opts = function(_, opts)
                    table.insert(opts.ensure_installed, 'lua_ls')
                end,
            },
            {
                'nvim-treesitter/nvim-treesitter',
                opts = function(_, opts)
                    table.insert(opts.ensure_installed, 'lua')
                end,
            },
        },
        opts = function(_, opts)
            opts.servers.lua_ls = {
                settings = { Lua = { workspace = { checkThirdParty = false } } },
            }
        end,
    },

    -- formatting
    {
        'stevearc/conform.nvim',
        dependencies = {
            'williamboman/mason.nvim',
            opts = function(_, opts)
                table.insert(opts.ensure_installed, 'stylua')
            end,
        },
        opts = {
            formatters_by_ft = {
                lua = { 'stylua' },
            },
        },
    },
}
