--[[
Go language support:

LSP
    - gopls

DAP
    - delve

Formatter
    - goimports
    - gofumpt
--]]
return {
    -- lsp
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason-lspconfig.nvim',
            opts = function(_, opts)
                table.insert(opts.ensure_installed, 'gopls')
            end,
        },
        opts = function(_, opts)
            opts.servers.gopls = {
                settings = {
                    gopls = {
                        gofumpt = true,
                        codelenses = {
                            gc_details = false,
                            generate = true,
                            regenerate_cgo = true,
                            run_govulncheck = true,
                            test = true,
                            tidy = true,
                            upgrade_dependency = true,
                            vendor = true,
                        },
                        hints = {
                            assignVariableTypes = true,
                            compositeLiteralFields = true,
                            compositeLiteralTypes = true,
                            constantValues = true,
                            functionTypeParameters = true,
                            parameterNames = true,
                            rangeVariableTypes = true,
                        },
                        analyses = {
                            fieldalignment = false,
                            nilness = true,
                            unusedparams = true,
                            unusedwrite = true,
                            useany = true,
                        },
                        usePlaceholders = true,
                        completeUnimported = true,
                        staticcheck = true,
                        directoryFilters = { '-.git' },
                        semanticTokens = true,
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
                vim.list_extend(
                    opts.ensure_installed,
                    { 'goimports', 'gofumpt' }
                )
            end,
        },
        opts = {
            formatters_by_ft = {
                go = { 'goimports', 'gofumpt' },
            },
        },
    },

    -- dap
    {
        'leoluz/nvim-dap-go',
        dependencies = {
            { 'mfussenegger/nvim-dap' },
            {
                'williamboman/mason.nvim',
                opts = function(_, opts)
                    table.insert(opts.ensure_installed, 'delve')
                end,
            },
        },
        opts = {},
    },

    -- test
    {
        'nvim-neotest/neotest-go',
        dependencies = {
            {
                'nvim-neotest/neotest',
                opts = {
                    adapters = {
                        ['neotest-go'] = {},
                    },
                },
            },
        },
    },
}
