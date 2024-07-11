return {
    'nvim-tree/nvim-web-devicons',
    dependencies = 'EdenEast/nightfox.nvim',
    init = function()
        -- re-run setup on colorscheme change in case highlights got cleared
        vim.api.nvim_create_autocmd('Colorscheme', {
            group = vim.api.nvim_create_augroup('Colorscheme', {}),
            callback = function(_) require('nvim-web-devicons').setup() end,
        })
    end,
    opts = {},
}
