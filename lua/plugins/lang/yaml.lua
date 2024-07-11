--[[
YAML language support requires installing:

LSP
    - yaml-language-server

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
                table.insert(opts.ensure_installed, 'yamlls')
            end,
        },
        opts = function(_, opts)
            opts.servers.yamlls = {
                capabilities = {
                    textDocument = {
                        foldingRange = {
                            dynamicRegistration = false,
                            lineFoldingOnly = true,
                        },
                    },
                },
                settings = {
                    yaml = {
                        keyOrdering = false,
                        format = {
                            enable = true,
                        },
                        schemeStore = {
                            enable = false,
                            url = '',
                        },
                        schemas = require('schemastore').json.schemas(),
                        validate = true,
                    },
                },
            }
        end,
    },

    -- formatting
    {
        'stevearc/conform.nvim',
        opts = {
            formatters_by_ft = {
                yaml = { 'prettierd' },
            },
        },
    },
}
