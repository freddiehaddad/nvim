--[[
Powershell language support:

LSP
	- powershell_es
--]]
return {
    'TheLeoP/powershell.nvim',
    lazy = true,
    dependencies = {
        {
            'neovim/nvim-lspconfig',
            dependencies = {
                {
                    'williamboman/mason-lspconfig.nvim',
                    opts = function(_, opts)
                        table.insert(opts.ensure_installed, 'powershell_es')
                    end,
                },
                {
                    'nvim-treesitter/nvim-treesitter',
                    opts = function(_, opts)
                        table.insert(opts.ensure_installed, 'powershell')
                    end,
                },
            },
        },
        {
            'mfussenegger/nvim-dap',
        },
    },
    opts = {
        bundle_path = vim.fn.stdpath('data')
            .. '/mason/packages/powershell-editor-services',
    },
}
