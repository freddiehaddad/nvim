return {
    'stevearc/oil.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    lazy = true,
    opts = {
        keymaps = {
            ['<c-v>'] = 'actions.select_vsplit',
        },
    },
}
