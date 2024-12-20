--[[
Rust language support:

Install via the rustup tool (https://rustup.rs/):
     - curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

LSP
    - rust-analyzer

DAP
    - codelldb

Formatter
    - rustfmt (rustup component add rustfmt)
--]]

return {
    -- lsp
    {
        'mrcjkb/rustaceanvim',
        config = function(_, opts)
            vim.g.rustaceanvim = vim.tbl_deep_extend(
                'keep',
                vim.g.rustaceanvim or {},
                opts or {}
            )
        end,
        dependencies = {
            {
                'nvim-treesitter/nvim-treesitter',
                opts = function(_, opts)
                    table.insert(opts.ensure_installed, 'rust')
                    table.insert(opts.ensure_installed, 'toml')
                end,
            },
        },
        ft = { 'rust' },
        opts = {
            server = {
                on_attach = function(_, bufnr)
                    vim.keymap.set(
                        'n',
                        '<leader>ca',
                        function() vim.cmd.RustLsp('codeAction') end,
                        { desc = 'Code action', buffer = bufnr }
                    )
                    vim.keymap.set(
                        'n',
                        '<leader>dr',
                        function() vim.cmd.RustLsp('debuggables') end,
                        { desc = 'Rust debuggables', buffer = bufnr }
                    )
                    vim.keymap.set(
                        'n',
                        '<leader>ce',
                        function() vim.cmd.RustLsp('explainError') end,
                        { desc = 'Rust explain error', buffer = bufnr }
                    )
                    vim.keymap.set(
                        'n',
                        '<leader>cd',
                        function() vim.cmd.RustLsp('renderDiagnostic') end,
                        { desc = 'Rust show diagnostic error', buffer = bufnr }
                    )
                end,
            },
            tools = {
                float_win_config = {
                    border = 'none',
                },
            },
        },
    },

    -- formatting
    {
        'stevearc/conform.nvim',
        opts = {
            formatters_by_ft = {
                rust = { 'rustfmt' },
            },
        },
    },

    -- dap
    {
        'mfussenegger/nvim-dap',
        dependencies = {
            'williamboman/mason.nvim',
            opts = function(_, opts)
                table.insert(opts.ensure_installed, 'codelldb')
            end,
        },
    },

    -- test
    {
        'nvim-neotest/neotest',
        dependencies = 'mrcjkb/rustaceanvim',
        opts = {
            adapters = {
                ['rustaceanvim.neotest'] = {},
            },
        },
    },
}
