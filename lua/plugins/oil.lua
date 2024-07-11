return {
    'stevearc/oil.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
        keymaps = {
            ['<c-v>'] = 'actions.select_vsplit',
        },
    },
}
