---@diagnostic disable: undefined-global

-- Keymap setup helper
local h = require("helpers")
local map = h.map

-- Set global stuff
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable unused providers to silence checkhealth warnings
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

-- Windows shell setup
if vim.fn.has("win32") == 1 then
    vim.opt.shell = "pwsh.exe"
    vim.opt.shellcmdflag = "-NoLogo -ExecutionPolicy RemoteSigned -Command"
    -- tee is a GNU utility, on windows output to a file
    vim.opt.shellpipe = ">%s 2>&1"
    vim.opt.shellredir = ">%s 2>&1"
    -- For handling spaces in Windows paths correctly
    vim.opt.shellquote = ""
    vim.opt.shellxquote = ""
end

vim.opt.grepprg = "rg --vimgrep --smart-case --follow"

vim.o.mouse = ""
vim.o.clipboard = "unnamedplus"

vim.o.pumheight = 20

vim.o.cmdheight = 0
vim.o.cursorline = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.breakindent = true
vim.o.showmode = false

vim.o.scrolloff = 2
vim.o.sidescrolloff = 2
vim.o.splitbelow = true
vim.o.splitright = true

vim.opt.fillchars = { eob = " ", fold = " ", foldclose = "", foldopen = "", foldsep = " ", vert = " " }

vim.o.foldlevel = 99
vim.o.foldtext =
[[''.getline(v:foldstart).' ... '.trim(getline(v:foldend)).' | '.(v:foldend-v:foldstart+1).' lines']]

vim.o.signcolumn = "yes"
vim.o.inccommand = "split"
vim.o.confirm = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.undofile = true
vim.opt.sessionoptions:remove("blank")

-- Default formatting
vim.o.textwidth = 80
vim.o.expandtab = false
vim.o.tabstop = 8
vim.o.shiftwidth = 8
vim.o.softtabstop = 8

-- This pattern matches:
-- 1. Optional leading whitespace
-- 2. Either digits followed by . ) ] or }
-- 3. OR a single dash (-), asterisk (*), or plus (+)
-- 4. Followed by trailing whitespace
vim.opt.formatlistpat = [[^\s*\(\d\+[\]:.)}\t ]\|[-*+]\s\)\s*]]
vim.opt.formatoptions = "jcroqlnt"
-- Keymaps
-- Move between windows using Ctrl + h,j,k,l
map("<C-h>", "<C-w>h", "Move to left window")
map("<C-j>", "<C-w>j", "Move to lower window")
map("<C-k>", "<C-w>k", "Move to upper window")
map("<C-l>", "<C-w>l", "Move to right window")

-- Resize windows using Ctrl + Arrow keys
map("<C-Up>", "<cmd>resize +1<CR>", "Increase window height")
map("<C-Down>", "<cmd>resize -1<CR>", "Decrease window height")
map("<C-Right>", "<cmd>vertical resize +1<CR>", "Increase window width")
map("<C-Left>", "<cmd>vertical resize -1<CR>", "Decrease window width")

-- Buffers
map("[b", "<cmd>bprevious<cr>", "Previous buffer")
map("]b", "<cmd>bnext<cr>", "Next buffer")

-- Diagnostic
local diagnostic_goto = function(count, severity)
    local opts = { count = count, severity = severity and vim.diagnostic.severity[severity] or nil }

    return function()
        vim.diagnostic.jump(opts)
    end
end
map("]d", diagnostic_goto(1), "Next diagnostic")
map("[d", diagnostic_goto(-1), "Previous diagnostic")
map("]e", diagnostic_goto(1, "ERROR"), "Next error")
map("[e", diagnostic_goto(-1, "ERROR"), "Previous error")
map("]w", diagnostic_goto(1, "WARN"), "Next warning")
map("[w", diagnostic_goto(-1, "WARN"), "Previous warning")

-- Center some navigation movements
map("<C-]>", "<C-]>zz", "Jump to the definition", { "n", "v" })
map("<C-o>", "<C-o>zz", "Go to previous position in jump list")

map("<Esc>", "<cmd>nohlsearch<cr>", "Clear highlights")

-- Undo tree (built-in, Neovim 0.12+)
vim.cmd.packadd("nvim.undotree")
map("<leader>u", require("undotree").open, "Undo tree")

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.hl.on_yank()
    end,
})

-- Close help, man, and quickfix buffers with q
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "help", "man", "qf", "nvim-pack", "nvim-undotree" },
    callback = function(e)
        vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = e.buf })
    end,
})

-- Restore cursor position when reopening files
vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function(e)
        local exclude = { "gitcommit", "gitrebase", "help" }
        if vim.tbl_contains(exclude, vim.bo[e.buf].filetype) then
            return
        end
        local pos = vim.api.nvim_buf_get_mark(e.buf, '"')
        if pos[1] > 0 and pos[1] <= vim.api.nvim_buf_line_count(e.buf) then
            pcall(vim.api.nvim_win_set_cursor, 0, pos)
        end
    end,
})

-- Load plugins
require("plugins")
