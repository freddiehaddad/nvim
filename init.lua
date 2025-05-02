vim.cmd("colorscheme peanut")

-- Options
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0

local opt = vim.opt
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
vim.schedule(function()
    opt.clipboard = "unnamedplus"
end)

opt.cmdheight = 0
opt.cursorline = true
opt.fillchars:append({
    eob = " ",
    fold = " ",
    foldopen = "",
    foldclose = "",
    foldsep = " ",
    horiz = " ",
    horizup = " ",
    horizdown = " ",
    vert = " ",
    vertleft = " ",
    vertright = " ",
    verthoriz = " ",
})
opt.foldenable = true
opt.foldlevel = 99
opt.ignorecase = true
opt.laststatus = 3
opt.mouse = ""
opt.number = true
opt.pumblend = 10
opt.relativenumber = true
opt.scrolloff = 2
opt.showmode = false
opt.showtabline = 0
opt.sidescrolloff = 2
opt.smartcase = true
opt.smoothscroll = true
opt.splitright = true
opt.splitbelow = true
opt.undofile = true
opt.undolevels = 10000
opt.virtualedit = "block"
opt.wrap = false

-- Default file format
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.textwidth = 80

-- Powershell options
opt.shell = "pwsh"
opt.shellcmdflag =
    "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';$PSStyle.OutputRendering=[System.Management.Automation.OutputRendering]::PlainText;Remove-Alias -Force -ErrorAction SilentlyContinue tee;"
opt.shellredir = "2>&1 | %%{ '$_' } | Out-File %s; exit $LastExitCode"
opt.shellpipe = "2>&1 | %%{ '$_' } | tee %s; exit $LastExitCode"
opt.shellquote = ""
opt.shellxquote = ""

--Keymaps
local map = vim.keymap.set

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +1<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -1<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -1<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +1<cr>", { desc = "Increase window width" })

-- Split windows
map("n", "<leader>w=", "<C-W>=", { desc = "Equally high and wide", remap = true })
map("n", "<leader>wh", "<cmd>rightbelow split<cr>", { desc = "Split window below" })
map("n", "<leader>wH", "<cmd>leftabove split<cr>", { desc = "Split window above" })
map("n", "<leader>wv", "<cmd>rightbelow vsplit<cr>", { desc = "Split window right" })
map("n", "<leader>wV", "<cmd>leftabove vsplit<cr>", { desc = "Split window left" })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete window", remap = true })

-- Move lines
map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move up" })

-- Buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- Clear search and stop snippet on escape
map({ "i", "n", "s" }, "<esc>", function()
    vim.cmd("nohlsearch")
    if vim.snippet then
        vim.snippet.stop()
    end
    return "<esc>"
end, { expr = true, desc = "Escape and clear hlsearch" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- Save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Commenting
map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add comment below" })
map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add comment above" })

-- lazy
map("n", "<leader>pl", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- New file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New file" })

-- Lists
map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location list" })
map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix list" })

-- Quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- Diagnostic
local diagnostic_goto = function(count, severity)
    local opts = { count = count, severity = severity and vim.diagnostic.severity[severity] or nil }

    return function()
        vim.diagnostic.jump(opts)
    end
end
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line diagnostics" })
map("n", "]d", diagnostic_goto(1), { desc = "Next diagnostic" })
map("n", "[d", diagnostic_goto(-1), { desc = "Prev diagnostic" })
map("n", "]e", diagnostic_goto(1, "ERROR"), { desc = "Next error" })
map("n", "[e", diagnostic_goto(-1, "ERROR"), { desc = "Prev error" })
map("n", "]w", diagnostic_goto(1, "WARN"), { desc = "Next warning" })
map("n", "[w", diagnostic_goto(-1, "WARN"), { desc = "Prev warning" })

-- Autocmds
local autocmd = vim.api.nvim_create_autocmd
local function augroup(name)
    return vim.api.nvim_create_augroup("MyConfig" .. name, { clear = true })
end

-- Go to last location when opening a buffer
autocmd("BufReadPost", {
    group = augroup("LastLocation"),
    callback = function(event)
        local exclude = { "gitcommit" }
        local buf = event.buf
        if vim.tbl_contains(exclude, vim.bo[buf].filetype) then
            return
        end
        local mark = vim.api.nvim_buf_get_mark(buf, '"')
        local lcount = vim.api.nvim_buf_line_count(buf)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- Close some filetypes with <q>
autocmd("FileType", {
    group = augroup("CloseWithQ"),
    pattern = {
        "checkhealth",
        "dap-float",
        "gitsigns-blame",
        "help",
        "qf",
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.schedule(function()
            map("n", "q", function()
                vim.cmd("close")
                pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
            end, {
                buffer = event.buf,
                silent = true,
                desc = "Quit buffer",
            })
        end)
    end,
})

-- Enable spellcheck and line wrapping in select file types
autocmd("FileType", {
    group = augroup("SpellWrap"),
    pattern = { "text", "gitcommit", "markdown" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
    end,
})

-- Highlight when yanking (copying) text
autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = augroup("HighlightYank"),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Install Lazy plugin manager
local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local lazy_is_installed = vim.uv.fs_stat(lazy_path)
if not lazy_is_installed then
    local lazy_repo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazy_repo, lazy_path })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.runtimepath:prepend(lazy_path)

-- Load Lazy plugin manager
require("lazy").setup({
    ui = { backdrop = 25 },
    spec = { { import = "plugins" } },
    rocks = { enabled = false },
    checker = { enabled = true },
})
