-- configure keymaps when opening nvim-tree
local function on_attach(bufnr)
    local api = require('nvim-tree.api')
    local function opts(desc)
        return {
            desc = 'nvim-tree: ' .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true,
        }
    end

    -- copy defaults
    api.config.mappings.default_on_attach(bufnr)

    -- remove a default
    vim.keymap.del('n', '<C-x>', { buffer = bufnr })

    -- change C-x to C-h
    vim.keymap.set(
        'n',
        '<C-h>',
        api.node.open.horizontal,
        opts('Open: Horizontal Split')
    )
end

return {
    'nvim-tree/nvim-tree.lua',
    dependencies = 'nvim-tree/nvim-web-devicons',
    init = function()
        -- disable netrw
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
    end,
    lazy = false,
    keys = {
        { '<leader>e', '<cmd>NvimTreeToggle<cr>', desc = 'NvimTree toggle' },
    },
    opts = {
        view = { width = 40 },
        on_attach = on_attach,
    },
}
