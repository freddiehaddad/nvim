--------------------------------------------------------------------------------
-- LOAD COLORSCHEME
--------------------------------------------------------------------------------
vim.cmd('colorscheme peanut')

--------------------------------------------------------------------------------
-- BOOTSTRAP PLUGIN MANAGER
--------------------------------------------------------------------------------

-- install the lazy.nvim plugin manager
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
local lazy_is_installed = vim.loop.fs_stat(lazypath)
if not lazy_is_installed then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath,
    })
end
vim.opt.runtimepath:prepend(lazypath)

--------------------------------------------------------------------------------
-- CONFIGURE KEYMAPS
--------------------------------------------------------------------------------

vim.g.mapleader = ' '

local map = vim.keymap.set

-- windows
map(
    'n',
    '<leader>wv',
    '<cmd>vsplit<cr>',
    { desc = 'Split current window vertically' }
)
map(
    'n',
    '<leader>wh',
    '<cmd>split<cr>',
    { desc = 'Split current window horizontally' }
)
map('n', '<leader>w=', '<C-W>=', { desc = 'Make windows equal size' })
map('n', '<leader>wd', '<C-W>c', { desc = 'Delete window' })
map('n', '<C-h>', '<C-w>h', { desc = 'Go to Left Window', remap = true })
map('n', '<C-j>', '<C-w>j', { desc = 'Go to Lower Window', remap = true })
map('n', '<C-k>', '<C-w>k', { desc = 'Go to Upper Window', remap = true })
map('n', '<C-l>', '<C-w>l', { desc = 'Go to Right Window', remap = true })
map('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = 'Increase Window Height' })
map('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease Window Height' })
map(
    'n',
    '<C-Left>',
    '<cmd>vertical resize -2<cr>',
    { desc = 'Decrease Window Width' }
)
map(
    'n',
    '<C-Right>',
    '<cmd>vertical resize +2<cr>',
    { desc = 'Increase Window Width' }
)

-- better up/down
map(
    { 'n', 'x' },
    'j',
    "v:count == 0 ? 'gj' : 'j'",
    { expr = true, silent = true }
)
map(
    { 'n', 'x' },
    'k',
    "v:count == 0 ? 'gk' : 'k'",
    { expr = true, silent = true }
)

-- quickfix
map('n', '[q', '<cmd>cprevious<cr>', { desc = 'Previous quickfix' })
map('n', ']q', '<cmd>cnext<cr>', { desc = 'Next quickfix' })

-- clear search with <esc>
map(
    { 'i', 'n' },
    '<esc>',
    '<cmd>nohlsearch<cr><esc>',
    { desc = 'Escape and clear hlsearch' }
)

-- save file
map({ 'i', 'n', 's', 'x' }, '<C-s>', '<cmd>w<cr>', { desc = 'Save file' })

-- quit
map('n', '<leader>qq', '<cmd>qa<cr>', { desc = 'Quit all' })

-- Move Lines
map(
    'n',
    '<A-j>',
    "<cmd>execute 'move .+' . v:count1<cr>==",
    { desc = 'Move Down' }
)
map(
    'n',
    '<A-k>',
    "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==",
    { desc = 'Move Up' }
)
map('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move Down' })
map('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move Up' })
map(
    'v',
    '<A-j>',
    ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv",
    { desc = 'Move Down' }
)
map(
    'v',
    '<A-k>',
    ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv",
    { desc = 'Move Up' }
)

--------------------------------------------------------------------------------
-- NEOVIM OPTIONS
--------------------------------------------------------------------------------

-- cursor
vim.opt.cursorline = true

-- relative line numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- window split behavior
vim.opt.splitright = true
vim.opt.splitbelow = true

-- disable tab visibility
vim.opt.showtabline = 0

-- yank/paste behavior
vim.opt.clipboard = 'unnamedplus'

-- persistent undo
vim.opt.undofile = true
vim.opt.undolevels = 10000

-- disable mouse support
vim.opt.mouse = ''

-- autowrite
vim.opt.autowrite = true

-- insert mode completion behavior
vim.opt.completeopt:append({ 'menuone' })

-- hide * markup for bold and italic
-- vim.opt.conceallevel = 3

-- confirm to save changes before exiting modified buffer
vim.opt.confirm = true

-- search case sensitivity
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- native formatting
vim.opt.formatoptions = 'jcroqlnt'

-- grep configuration
vim.opt.grepformat = '%f:%l:%c:%m'
vim.opt.grepprg = 'rg --vimgrep'

-- popup menu
vim.pumheight = 10

-- short message format
vim.opt.shortmess:append({ a = true, c = true, I = true, W = true })

-- fill char formating
vim.opt.fillchars:append({ eob = ' ' })

-- shell
vim.o.shell = 'pwsh'

--------------------------------------------------------------------------------
-- AUTO COMMANDS
--------------------------------------------------------------------------------

local function augroup(name)
    return vim.api.nvim_create_augroup('init_' .. name, { clear = true })
end

-- check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ 'FocusGained', 'TermClose', 'TermLeave' }, {
    group = augroup('checktime'),
    callback = function()
        if vim.o.buftype ~= 'nofile' then vim.cmd('checktime') end
    end,
})

-- highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
    group = augroup('highlight_yank'),
    callback = function() (vim.hl or vim.highlight).on_yank() end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd('BufReadPost', {
    group = augroup('last_loc'),
    callback = function(event)
        local exclude = { 'gitcommit' }
        local buf = event.buf
        if
            vim.tbl_contains(exclude, vim.bo[buf].filetype)
            or vim.b[buf].lazyvim_last_loc
        then
            return
        end
        local mark = vim.api.nvim_buf_get_mark(buf, '"')
        local lcount = vim.api.nvim_buf_line_count(buf)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd('FileType', {
    group = augroup('close_with_q'),
    pattern = {
        'checkhealth',
        'gitsigns-blame',
        'help',
        'lspinfo',
        'neotest-output',
        'neotest-output-panel',
        'neotest-summary',
        'qf',
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.schedule(function()
            vim.keymap.set('n', 'q', function()
                vim.cmd('close')
                pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
            end, {
                buffer = event.buf,
                silent = true,
                desc = 'Quit buffer',
            })
        end)
    end,
})

-- wrap and check spelling in text filetypes
vim.api.nvim_create_autocmd('FileType', {
    group = augroup('wrap_spell'),
    pattern = { 'text', 'gitcommit', 'markdown' },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
    end,
})

--------------------------------------------------------------------------------
-- LOAD PLUGINS
--------------------------------------------------------------------------------

require('lazy').setup({
    spec = { { import = 'plugins' }, { import = 'plugins.lang' } },
    change_detection = {
        notify = false, -- get a notification when changes are found
    },
})
