--[[
BASH language support requires installing:

LSP
    - bash-language-server
    - shellcheck

Formatter
    - shfmt
--]]
return {
    --lsp
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            {
                'williamboman/mason-lspconfig.nvim',
                opts = function(_, opts)
                    table.insert(opts.ensure_installed, 'bashls')
                end,
            },
            {
                'williamboman/mason.nvim',
                opts = function(_, opts)
                    table.insert(opts.ensure_installed, 'shellcheck')
                end,
            },
            {
                'nvim-treesitter/nvim-treesitter',
                opts = function(_, opts)
                    table.insert(opts.ensure_installed, 'bash')
                end,
            },
        },
        opts = {
            servers = {
                bashls = { filetypes = { 'sh', 'zsh' } },
            },
        },
    },

    -- formatting
    {
        'stevearc/conform.nvim',
        dependencies = {
            'williamboman/mason.nvim',
            opts = function(_, opts)
                table.insert(opts.ensure_installed, 'shfmt')
            end,
        },
        opts = {
            formatters_by_ft = {
                sh = { 'shfmt' },
                zsh = { 'shfmt' },
            },
        },
    },
}
