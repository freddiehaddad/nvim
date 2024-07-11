--[[
JSON language support requires installing:

LSP
    - jsonls

Formatter
    - prettierd
--]]
return {
    -- schema support
    {
        'b0o/SchemaStore.nvim',
    },

    -- lsp
    {
        -- lsp
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason-lspconfig.nvim',
            opts = function(_, opts)
                table.insert(opts.ensure_installed, 'jsonls')
            end,
        },
        opts = function(_, opts)
            opts.servers.jsonls = {
                settings = {
                    json = {
                        schemas = require('schemastore').json.schemas(),
                        validate = { enable = true },
                    },
                },
            }
        end,
    },

    -- formatting
    {
        'stevearc/conform.nvim',
        dependencies = {
            'williamboman/mason.nvim',
            opts = function(_, opts)
                table.insert(opts.ensure_installed, 'prettierd')
            end,
        },
        opts = {
            formatters_by_ft = {
                json = { 'prettierd' },
            },
        },
    },
}
