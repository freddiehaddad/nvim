--[[
Markdown language support requires installing:

LSP
    - marksman

Formatter
    - mdformat
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

    -- formatting
    {
        'stevearc/conform.nvim',
        dependencies = {
            'williamboman/mason.nvim',
            opts = function(_, opts)
                table.insert(opts.ensure_installed, 'mdformat')
            end,
        },
        opts = {
            formatters_by_ft = {
                markdown = { 'mdformat' },
            },
        },
    },
}
