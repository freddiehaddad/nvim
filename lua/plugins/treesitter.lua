return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    init = function()
        vim.opt.foldenable = false
        vim.opt.foldmethod = 'expr'
        vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    end,
    main = 'nvim-treesitter.configs',
    opts = {
        ensure_installed = { 'vim', 'vimdoc' },
        highlight = {
            enable = true,
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = '<c-i>',
                node_incremental = '<c-i>',
                scope_incremental = false,
                node_decremental = '<bs>',
            },
        },
        indent = {
            enable = true,
        },
    },
    config = function(_, opts)
        require('nvim-treesitter.configs').setup(opts)
        -- require('nvim-treesitter.install').compilers = { 'zig' }
    end,
}
