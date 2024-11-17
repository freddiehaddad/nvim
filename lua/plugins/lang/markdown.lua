--[[
Markdown language support requires installing:

LSP
    - marksman

Formatter
    - prettierd
--]]
return {
    -- lsp
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason-lspconfig.nvim',
            opts = function(_, opts)
                table.insert(opts.ensure_installed, 'marksman')
            end,
        },
        opts = function(_, opts) opts.servers.marksman = {} end,
    },

    -- viewer
    {
        'OXY2DEV/markview.nvim',
        lazy = false,
        keys = {
            {
                '<leader>mp',
                '<cmd>Markview splitToggle<cr>',
                desc = 'Markdown Preview',
            },
            {
                '<leader>mt',
                '<cmd>Markview toggle<cr>',
                desc = 'Markdown Toggle',
            },
            {
                '<leader>mT',
                '<cmd>Markview toggleAll<cr>',
                desc = 'Markdown Toggle All',
            },
            dependencies = {
                {
                    'nvim-treesitter/nvim-treesitter',
                    opts = function(_, opts)
                        table.insert(opts.ensure_installed, 'markdown')
                        table.insert(opts.ensure_installed, 'markdown_inline')
                    end,
                },
                {
                    'nvim-tree/nvim-web-devicons',
                },
            },
        },
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
                markdown = { 'prettierd' },
            },
        },
    },
}
