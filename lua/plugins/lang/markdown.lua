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
        'MeanderingProgrammer/render-markdown.nvim',
        init = function()
            local hl = vim.api.nvim_set_hl

            hl(0, 'RenderMarkdownH1Bg', { nocombine = true, bg = 'none' })
            hl(0, 'RenderMarkdownH2Bg', { nocombine = true, bg = 'none' })
            hl(0, 'RenderMarkdownH3Bg', { nocombine = true, bg = 'none' })
            hl(0, 'RenderMarkdownH4Bg', { nocombine = true, bg = 'none' })
            hl(0, 'RenderMarkdownH5Bg', { nocombine = true, bg = 'none' })
            hl(0, 'RenderMarkdownH6Bg', { nocombine = true, bg = 'none' })

            hl(0, 'RenderMarkdownCode', { nocombine = true, bg = 'none' })
        end,
        opts = {
            heading = {
                enabled = true,
                sign = true,
                position = 'inline',
                -- heading icon prefix
                icons = {
                    '',
                    '',
                    '',
                    '',
                    '',
                    '',
                },
                -- heading icon in sign column
                signs = {
                    '󰉫 ',
                    '󰉬 ',
                    '󰉭 ',
                    '󰉮 ',
                    '󰉯 ',
                    '󰉰 ',
                },
            },
            code = {
                border = 'none',
                style = 'none',
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
