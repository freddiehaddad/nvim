---@diagnostic disable: undefined-global

local startup_header =
[[█▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀ ▀ ▀▀▀█  █▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀ ▀ ▀▀▀▀█
█ │░███▀█▀▀▀▀▀▓████▓▄ ▀▀▀▀ │░████▓▄   │▓████▓▄  █
█ │▒███████  │▓███████     │▒███████  │▓███████ █
█ │▓███████  │▓███████     │▓███████  │▓███████ █
▀ │▓███████  │▓███████     │▓███████  │▓███████ █
▀ │▓███████  │▓███████▄ ▄  │▓███████  │▓███████ █
█ │▓███████                │▓███████   ▓███████ █▄▄▄
█ │▓███████▀▀ ▀    ▀       │▓███████▀▀▀▓█▄█████▄ ▄ █
█▄▄▄▄▄▄▄▄ ▀ █▀▀▀▀▀▀▀▀▀▀▀▀█▄▄▄▄ ▄ ▄▄▄▄▄▄▄▄▄▄▄ ▄ ▄▄▄▄█
        █ ▀ █
        ▀▀▀▀▀]]
local startup_footer =
[[▀ ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀ ▀ ▀▀▀▀▀▀▀▀▀▀▀▀▀ ▀
                                      n e o v i m]]

-- Keymap helpers
local h = require("helpers")
local map = h.map
local bmap = h.bmap

-- Build hooks (must be defined BEFORE vim.pack.add)
local build_hooks = {
    ["nvim-treesitter"] = function(ev)
        if not ev.data.active then
            vim.cmd.packadd("nvim-treesitter")
        end
        vim.cmd("TSUpdate")
    end,
}

vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(ev)
        if ev.data.kind == "delete" then
            return
        end
        local hook = build_hooks[ev.data.spec.name]
        if hook then
            hook(ev)
        end
    end,
})

-- Register and install plugins
vim.pack.add({
    "https://github.com/freddiehaddad/ferric.nvim",
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
    "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
    "https://github.com/b0o/schemastore.nvim",         -- json/yaml schemas, used by lspconfig
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/nvim-mini/mini.nvim",          -- icons used by blink.cmp
    "https://github.com/rafamadriz/friendly-snippets", -- snippet collection for blink.cmp
    { src = "https://github.com/saghen/blink.cmp",                version = vim.version.range("1.x") },
    "https://github.com/ibhagwan/fzf-lua",
    "https://github.com/lewis6991/gitsigns.nvim",
    "https://github.com/mfussenegger/nvim-dap",
    { src = "https://github.com/igorlfs/nvim-dap-view", version = vim.version.range("1.x") },
})

-- Update keymap
map("<leader>pu", vim.pack.update, "Update plugins")

-----------------------------------------------------------------------------
-- Theme
-----------------------------------------------------------------------------
vim.cmd.colorscheme("ferric")

-----------------------------------------------------------------------------
-- Treesitter
-----------------------------------------------------------------------------
local parsers = {
    "asm",
    "c",
    "cpp",
    "cmake",
    "git_config",
    "git_rebase",
    "gitattributes",
    "gitcommit",
    "gitignore",
    "html",
    "json",
    "lua",
    "markdown",
    "markdown_inline",
    "powershell",
    "regex",
    "ron",
    "rust",
    "toml",
    "vim",
    "vimdoc",
    "yaml",
}
require("nvim-treesitter").install(parsers)
vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("treesitter-folds", { clear = true }),
    callback = function(args)
        local buf, filetype = args.buf, args.match

        local language = vim.treesitter.language.get_lang(filetype)
        if not language then
            return
        end

        -- check if parser exists and load it
        if not vim.treesitter.language.add(language) then
            return
        end
        -- enables syntax highlighting and other treesitter features
        vim.treesitter.start(buf, language)

        -- enables treesitter based folds
        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.wo.foldmethod = "expr"

        -- enables treesitter based indentation
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
})

-----------------------------------------------------------------------------
-- Treesitter textobjects
-----------------------------------------------------------------------------
local ts_select = require("nvim-treesitter-textobjects.select")
local ts_move = require("nvim-treesitter-textobjects.move")
local ts_swap = require("nvim-treesitter-textobjects.swap")

require("nvim-treesitter-textobjects").setup({
    select = {
        lookahead = true,
    },
    move = {
        set_jumps = true,
    },
})

-- Selection (visual + operator-pending)
for _, mode in ipairs({ "x", "o" }) do
    vim.keymap.set(mode, "af", function() ts_select.select_textobject("@function.outer", "textobjects") end,
        { desc = "Around function" })
    vim.keymap.set(mode, "if", function() ts_select.select_textobject("@function.inner", "textobjects") end,
        { desc = "Inner function" })
    vim.keymap.set(mode, "ac", function() ts_select.select_textobject("@class.outer", "textobjects") end,
        { desc = "Around class/struct" })
    vim.keymap.set(mode, "ic", function() ts_select.select_textobject("@class.inner", "textobjects") end,
        { desc = "Inner class/struct" })
    vim.keymap.set(mode, "aa", function() ts_select.select_textobject("@parameter.outer", "textobjects") end,
        { desc = "Around parameter" })
    vim.keymap.set(mode, "ia", function() ts_select.select_textobject("@parameter.inner", "textobjects") end,
        { desc = "Inner parameter" })
    vim.keymap.set(mode, "al", function() ts_select.select_textobject("@loop.outer", "textobjects") end,
        { desc = "Around loop" })
    vim.keymap.set(mode, "il", function() ts_select.select_textobject("@loop.inner", "textobjects") end,
        { desc = "Inner loop" })
    vim.keymap.set(mode, "ai", function() ts_select.select_textobject("@conditional.outer", "textobjects") end,
        { desc = "Around conditional" })
    vim.keymap.set(mode, "ii", function() ts_select.select_textobject("@conditional.inner", "textobjects") end,
        { desc = "Inner conditional" })
    vim.keymap.set(mode, "a/", function() ts_select.select_textobject("@comment.outer", "textobjects") end,
        { desc = "Around comment" })
    vim.keymap.set(mode, "i/", function() ts_select.select_textobject("@comment.inner", "textobjects") end,
        { desc = "Inner comment" })
end

-- Movement (normal + visual)
for _, mode in ipairs({ "n", "x" }) do
    vim.keymap.set(mode, "]f", function() ts_move.goto_next_start("@function.outer", "textobjects") end,
        { desc = "Next function" })
    vim.keymap.set(mode, "[f", function() ts_move.goto_previous_start("@function.outer", "textobjects") end,
        { desc = "Previous function" })
    vim.keymap.set(mode, "]c", function() ts_move.goto_next_start("@class.outer", "textobjects") end,
        { desc = "Next class/struct" })
    vim.keymap.set(mode, "[c", function() ts_move.goto_previous_start("@class.outer", "textobjects") end,
        { desc = "Previous class/struct" })
end

-- Swap
map("<leader>xp", function() ts_swap.swap_next("@parameter.inner") end, "Swap parameter forward")
map("<leader>xP", function() ts_swap.swap_previous("@parameter.inner") end, "Swap parameter backward")

-----------------------------------------------------------------------------
-- LSP
-----------------------------------------------------------------------------
vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.HINT] = "",
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "DiagnosticError",
            [vim.diagnostic.severity.WARN] = "DiagnosticWarn",
            [vim.diagnostic.severity.INFO] = "DiagnosticInfo",
            [vim.diagnostic.severity.HINT] = "DiagnosticWarn",
        },
    },
})

vim.lsp.config("jsonls", {
    settings = {
        json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
        },
    },
})

vim.filetype.add({
    pattern = {
        ["compose%.ya?ml"] = "yaml.docker-compose",
        ["docker%-compose%.ya?ml"] = "yaml.docker-compose",
        ["values%.ya?ml"] = "yaml.helm-values",
        ["%.gitlab%-ci%.ya?ml"] = "yaml.gitlab",
    },
})

vim.lsp.config("yamlls", {
    settings = {
        yaml = {
            schemaStore = {
                enable = false,
                url = "",
            },
            schemas = require("schemastore").yaml.schemas(),
        },
    },
})

vim.lsp.config("powershell_es", {
    bundle_path = "c:/users/fhaddad/.local/bin/PowerShellEditorServices",
})

-- rust-analyzer is installed via rustup and not in PATH; resolve its location.
local ra_result = vim.system({ "rustup", "which", "rust-analyzer" }, { timeout = 5000 }):wait()
if ra_result.code == 0 and ra_result.stdout then
    vim.lsp.config("rust_analyzer", {
        cmd = { vim.trim(ra_result.stdout) },
    })
end

vim.lsp.enable("asm_lsp")
vim.lsp.enable("clangd")
vim.lsp.enable("jsonls")
vim.lsp.enable("lua_ls")
vim.lsp.enable("marksman")
vim.lsp.enable("powershell_es")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("taplo")
vim.lsp.enable("yamlls")

-- Keymaps (buffer-local, set on attach)
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
    callback = function(event)
        local bufnr = event.buf
        bmap("gl", vim.diagnostic.open_float, "Line diagnostics", bufnr)
        bmap("gd", "<cmd>FzfLua lsp_definitions<cr>", "Go to definition", bufnr)
        bmap("<leader>ca", "<cmd>FzfLua lsp_code_actions<cr>", "Code actions", bufnr)
        bmap("<leader>si", "<cmd>FzfLua lsp_implementations<cr>", "Search implementations", bufnr)
        bmap("<leader>sr", "<cmd>FzfLua lsp_references<cr>", "Search references", bufnr)
        bmap("<leader>ss", "<cmd>FzfLua lsp_document_symbols<cr>", "Search document symbols", bufnr)
        bmap("<leader>sS", "<cmd>FzfLua lsp_workspace_symbols<cr>", "Search workspace symbols", bufnr)
        bmap("<leader>st", "<cmd>FzfLua lsp_typedefs<cr>", "Search type definitions", bufnr)

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if not client then
            return
        end

        if client:supports_method("textDocument/inlayHint", bufnr) then
            bmap("<leader>th", function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }))
            end, "Toggle inlay hints", event.buf)
        end

        if client:supports_method("textDocument/foldingRange", bufnr) then
            vim.wo.foldexpr = "v:lua.vim.lsp.foldexpr()"
            vim.wo.foldmethod = "expr"
        end

        if client:supports_method("textDocument/formatting") then
            bmap("<leader>df", function()
                vim.lsp.buf.format({ bufnr = bufnr, id = client.id, timeout_ms = 2000 })
            end, "Format document", bufnr, "n")
        end

        if client:supports_method("textDocument/rangeFormatting") then
            bmap("<leader>df", function()
                vim.lsp.buf.format({ bufnr = bufnr, id = client.id, timeout_ms = 2000 })
            end, "Format selection", bufnr, "v")
        end
    end,
})

-----------------------------------------------------------------------------
-- Mini.nvim
-----------------------------------------------------------------------------
require("mini.icons").setup()
require("mini.pairs").setup({
    mappings = {
        ["<"] = { action = "open", pair = "<>", neigh_pattern = "[%a:]." },
        [">"] = { action = "close", pair = "<>", neigh_pattern = "[^\\]." },
    },
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "rust",
    callback = function(e)
        -- In Rust files, the single quote (') is rarely used for literal
        -- characters and is more commonly used for lifetime specifiers.
        -- So we disable it for Rust source files.
        vim.keymap.set("i", "'", "'", { buffer = e.buf })
    end,
})
require("mini.surround").setup()
require("mini.move").setup()
require("mini.jump2d").setup({
    mappings = { start_jumping = 'gs' }
})

require("mini.bufremove").setup()
map("<leader>bd", MiniBufremove.delete, "Delete buffer")

local statusline = require("mini.statusline")
local section_location = function(args)
    if statusline.is_truncated(args.trunc_width) then
        return "%l %2v"
    end
    return '󰙪 %l/%L 󰘮 %2v/%-2{virtcol("$") - 1}'
end

require("mini.statusline").setup({
    content = {
        active = function()
            local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
            local git = MiniStatusline.section_git({ trunc_width = 40 })
            local diff = MiniStatusline.section_diff({ trunc_width = 75 })
            local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
            local lsp = MiniStatusline.section_lsp({ trunc_width = 75 })
            local filename = MiniStatusline.section_filename({ trunc_width = 140 })
            local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
            local location = section_location({ trunc_width = 75 })
            local search = MiniStatusline.section_searchcount({ trunc_width = 75 })

            return MiniStatusline.combine_groups({
                { hl = mode_hl,                 strings = { mode } },
                { hl = "MiniStatuslineDevinfo", strings = { git, diff, diagnostics, lsp } },
                "%<",
                { hl = "MiniStatuslineFilename", strings = { filename } },
                "%=",
                { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
                { hl = mode_hl,                  strings = { search } },
                { hl = "MiniStatuslineFileinfo", strings = { location } },
            })
        end,
    },
})

require("mini.sessions").setup()
require("mini.starter").setup({
    header = startup_header,
    footer = startup_footer,
})

-----------------------------------------------------------------------------
-- Completion (blink.cmp)
-----------------------------------------------------------------------------
require("blink.cmp").setup({
    appearance = { nerd_font_variant = "normal" },
    fuzzy = { implementation = "prefer_rust_with_warning" },
    completion = {
        documentation = { auto_show = true },
        ghost_text = { enabled = true },
        menu = {
            draw = {
                components = {
                    kind_icon = {
                        text = function(ctx)
                            local kind_icon, _, _ = require("mini.icons").get("lsp", ctx
                                .kind)
                            return kind_icon
                        end,
                        highlight = function(ctx)
                            local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                            return hl
                        end,
                    },
                    kind = {
                        highlight = function(ctx)
                            local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                            return hl
                        end,
                    },
                },
            },
        },
    },
    keymap = {
        preset = "default",
        ["<C-space>"] = {},
        ["<C-s>"] = { "hide", "show_signature", "hide_signature" },
        ["<C-k>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"] = { "hide", "show" },
    },
    signature = { enabled = true },
    sources = {
        default = { "lsp", "path", "snippets", "buffer" },
    },
})

-----------------------------------------------------------------------------
-- fzf-lua
-----------------------------------------------------------------------------
require("fzf-lua").setup({
    fzf_colors = true,
    fzf_opts = {
        ["--no-scrollbar"] = true,
    },
    winopts = {
        border = "single",
        preview = {
            layout = "horizontal",
            horizontal = "right:50%",
            border = "single",
        },
    },
    keymap = {
        builtin = {
            ["<C-f>"] = "preview-page-down",
            ["<C-b>"] = "preview-page-up",
            ["<C-d>"] = "preview-half-page-down",
            ["<C-u>"] = "preview-half-page-up",
        },
        fzf = {
            ["ctrl-q"] = "select-all+accept",
        },
    },
    grep = {
        rg_glob = true,
        glob_separator = "  ",
    },
})
require("fzf-lua").register_ui_select()

-- Keymaps
map("<leader>fb", "<cmd>FzfLua buffers<cr>", "Buffers")
map("<leader>fc", function() require("fzf-lua").files({ cwd = vim.fn.stdpath("config") }) end, "Config file")
map("<leader>ff", "<cmd>FzfLua files<cr>", "Files")
map("<leader>fF", function() require("fzf-lua").files({ fd_opts = "--type f --hidden --exclude .git" }) end,
    "Files (hidden)")
map("<leader>fg", "<cmd>FzfLua git_files<cr>", "Files (git)")
map("<leader>fr", "<cmd>FzfLua oldfiles<cr>", "Recent")
map("<leader>sa", "<cmd>FzfLua autocmds<cr>", "Auto commands")
map("<leader>sb", "<cmd>FzfLua grep_curbuf<cr>", "Buffer (fuzzy)")
map("<leader>sB", "<cmd>FzfLua lgrep_curbuf<cr>", "Buffer (regex)")
map("<leader>sc", "<cmd>FzfLua command_history<cr>", "Command history")
map("<leader>sC", "<cmd>FzfLua commands<cr>", "Commands")
map("<leader>sd", "<cmd>FzfLua diagnostics_document<cr>", "Document diagnostics")
map("<leader>sD", "<cmd>FzfLua diagnostics_workspace<cr>", "Workspace diagnostics")
map("<leader>sg", "<cmd>FzfLua live_grep<cr>", "Grep (cwd)")
map("<leader>sG", "<cmd>FzfLua live_grep_glob<cr>", "Glob grep (cwd)")
map("<leader>sh", "<cmd>FzfLua helptags<cr>", "Help pages")
map("<leader>sH", "<cmd>FzfLua highlights<cr>", "Highlight groups")
map("<leader>sj", "<cmd>FzfLua jumps<cr>", "Jumplist")
map("<leader>sk", "<cmd>FzfLua keymaps<cr>", "Keymaps")
map("<leader>sl", "<cmd>FzfLua loclist<cr>", "Location list")
map("<leader>sm", "<cmd>FzfLua marks<cr>", "Marks")
map("<leader>so", "<cmd>FzfLua nvim_options<cr>", "Options")
map("<leader>sq", "<cmd>FzfLua quickfix<cr>", "Quickfix list")
map("<leader>sR", "<cmd>FzfLua resume<cr>", "Resume")
map("<leader>sw", "<cmd>FzfLua grep_cword<cr>", "Word")
map("<leader>sw", "<cmd>FzfLua grep_visual<cr>", "Selection", "v")
map("<leader>s/", "<cmd>FzfLua search_history<cr>", "Search history")
map('<leader>s"', "<cmd>FzfLua registers<cr>", "Registers")
map("<leader>fp", "<cmd>FzfLua builtin<cr>", "Pickers")
map("<leader>gc", "<cmd>FzfLua git_commits<cr>", "Commits")
map("<leader>gC", "<cmd>FzfLua git_bcommits<cr>", "Buffer commits")
map("<leader>gs", "<cmd>FzfLua git_status<cr>", "Status")
map("<leader>gb", "<cmd>FzfLua git_branches<cr>", "Branches")
map("<leader>gt", "<cmd>FzfLua git_stash<cr>", "Stash")

-----------------------------------------------------------------------------
-- Gitsigns
-----------------------------------------------------------------------------
require("gitsigns").setup({
    signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "╷" },
        topdelete = { text = "╵" },
        changedelete = { text = "│" },
        untracked = { text = "┆" },
    },
    signs_staged = {
        add = { text = "┃" },
        change = { text = "┃" },
        delete = { text = "╻" },
        topdelete = { text = "╹" },
        changedelete = { text = "┃" },
        untracked = { text = "┇" },
    },
    signs_staged_enable = true,
    on_attach = function(bufnr)
        local gs = require("gitsigns")

        -- Navigation
        bmap("]h", function()
            if vim.wo.diff then
                vim.cmd.normal({ "]c", bang = true })
            else
                gs.nav_hunk("next")
            end
        end, "Next hunk", bufnr)
        bmap("[h", function()
            if vim.wo.diff then
                vim.cmd.normal({ "[c", bang = true })
            else
                gs.nav_hunk("prev")
            end
        end, "Previous hunk", bufnr)
        bmap("[H", function()
            gs.nav_hunk("first")
        end, "First hunk", bufnr)
        bmap("]H", function()
            gs.nav_hunk("last")
        end, "Last hunk", bufnr)

        -- Actions
        bmap("ghs", function()
            gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, "Stage hunk", bufnr, "v")
        bmap("ghr", function()
            gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, "Reset hunk", bufnr, "v")

        bmap("ghs", gs.stage_hunk, "Stage hunk", bufnr)
        bmap("ghr", gs.reset_hunk, "Reset hunk", bufnr)
        bmap("ghS", gs.stage_buffer, "Stage buffer", bufnr)
        bmap("ghu", gs.undo_stage_hunk, "Undo stage hunk", bufnr)
        bmap("ghR", gs.reset_buffer, "Reset buffer", bufnr)
        bmap("ghp", gs.preview_hunk, "Preview hunk inline", bufnr)
        bmap("ghb", function()
            gs.blame_line({ full = true })
        end, "Blame line", bufnr)
        bmap("ghB", gs.blame, "Blame buffer", bufnr)

        bmap("ghd", gs.diffthis, "Diff unstaged", bufnr)
        bmap("ghD", function()
            gs.diffthis("@")
        end, "Diff against last commit", bufnr)

        -- Toggles
        bmap("<leader>tb", gs.toggle_current_line_blame, "Toggle blame line", bufnr)
        bmap("<leader>tD", gs.toggle_deleted, "Toggle show deleted", bufnr)
    end,
})

-----------------------------------------------------------------------------
-- Debugging (nvim-dap + nvim-dap-view)
-----------------------------------------------------------------------------
local dap = require("dap")

vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DiagnosticError" })
vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DiagnosticWarn" })
vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DiagnosticHint" })
vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DiagnosticInfo" })
vim.fn.sign_define("DapStopped",
    { text = "→", texthl = "DapStoppedSign", linehl = "CursorLine", numhl = "CursorLine" })

dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
        command = vim.fn.expand("~/.local/bin/codelldb/extension/adapter/codelldb")
            .. (vim.fn.has("win32") == 1 and ".exe" or ""),
        args = { "--port", "${port}" },
    },
}

-- Build a Rust project and return a list of binary artifacts
local function cargo_build_binaries(args)
    vim.notify("Building...")
    local cmd = vim.list_extend({ "cargo", "build", "--message-format=json" }, args or {})
    local build = vim.system(cmd, { cwd = vim.fn.getcwd() }):wait()
    if build.code ~= 0 then
        vim.notify("Build failed:\n" .. (build.stderr or ""), vim.log.levels.ERROR)
        return nil
    end

    local binaries = {}
    for line in build.stdout:gmatch("[^\n]+") do
        local ok, msg = pcall(vim.json.decode, line)
        if ok and msg.reason == "compiler-artifact" and msg.executable then
            if msg.target and msg.target.kind and msg.profile then
                table.insert(binaries, {
                    path = msg.executable,
                    name = msg.target.name,
                    src_path = msg.target.src_path,
                    kinds = msg.target.kind,
                    is_test = msg.profile.test,
                })
            end
        end
    end
    return binaries
end

-- Select the best binary matching the current file
local function select_binary(binaries, filter_fn)
    local filtered = vim.tbl_filter(filter_fn, binaries)
    if #filtered == 0 then
        vim.notify("No matching binary found", vim.log.levels.ERROR)
        return nil
    end
    if #filtered == 1 then
        return filtered[1].path
    end

    -- Match by source file
    local current_file = vim.fn.expand("%:p"):gsub("\\", "/")
    for _, bin in ipairs(filtered) do
        if bin.src_path and bin.src_path:gsub("\\", "/") == current_file then
            return bin.path
        end
    end

    -- Multiple matches, no source match — prompt user
    local result = nil
    vim.ui.select(filtered, {
        prompt = "Select binary:",
        format_item = function(bin) return bin.name .. " (" .. bin.path .. ")" end,
    }, function(choice)
        if choice then result = choice.path end
    end)
    return result
end

local function find_rust_binary()
    local binaries = cargo_build_binaries()
    if not binaries then return dap.ABORT end
    local binary = select_binary(binaries, function(bin)
        return not bin.is_test and vim.tbl_contains(bin.kinds, "bin")
    end)
    return binary or dap.ABORT
end

dap.configurations.rust = {
    {
        name = "Launch (auto)",
        type = "codelldb",
        request = "launch",
        program = find_rust_binary,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
    },
    {
        name = "Launch (with args)",
        type = "codelldb",
        request = "launch",
        program = find_rust_binary,
        args = function()
            local input = vim.fn.input("Arguments: ")
            if input == "" then return {} end
            return vim.split(input, " ")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
    },
}

require("dap-view").setup({
    auto_toggle = true,
    winbar = {
        sections = { "watches", "scopes", "exceptions", "breakpoints", "threads", "repl", "console" },
    },
    windows = {
        terminal = {
            hide = { "codelldb" },
        },
    },
})

-- Find the Rust test function name at the cursor using treesitter
local function get_test_name_at_cursor()
    -- Get the node at cursor, falling back to the first node on the current line
    local node = vim.treesitter.get_node()

    -- If cursor is on whitespace, try to get the node at the first non-blank column
    if node and (node:type() == "declaration_list" or node:type() == "source_file") then
        local row = vim.api.nvim_win_get_cursor(0)[1] - 1
        local line = vim.api.nvim_get_current_line()
        local col = line:find("%S")
        if col then
            node = vim.treesitter.get_node({ pos = { row, col - 1 } })
        end
    end

    while node do
        if node:type() == "function_item" then
            local fn_node = node
            local fn_name = nil
            for child in fn_node:iter_children() do
                if child:type() == "identifier" then
                    fn_name = vim.treesitter.get_node_text(child, 0)
                    break
                end
            end
            if not fn_name then
                node = node:parent()
                goto continue
            end

            local prev = fn_node:prev_sibling()
            while prev do
                if prev:type() == "attribute_item" then
                    local attr_text = vim.treesitter.get_node_text(prev, 0)
                    if attr_text:match("%#%[test%]") or attr_text:match("%#%[tokio::test%]") then
                        return fn_name
                    end
                end
                prev = prev:prev_sibling()
            end
        end
        node = node:parent()
        ::continue::
    end
    return nil
end

-- Build and debug the test under cursor
local function debug_rust_test()
    local test_name = get_test_name_at_cursor()
    if not test_name then
        vim.notify("No #[test] function found at cursor", vim.log.levels.WARN)
        return
    end

    local binaries = cargo_build_binaries({ "--tests" })
    if not binaries then return end

    local test_binary = select_binary(binaries, function(bin)
        return bin.is_test
    end)
    if not test_binary then return end

    -- Get the module path for the test
    local module_path = ""
    local bufname = vim.fn.expand("%:t:r")
    if bufname ~= "lib" and bufname ~= "main" then
        module_path = bufname .. "::"
    end

    -- Check if cursor is inside a `mod tests` block
    local node = vim.treesitter.get_node()
    while node do
        if node:type() == "mod_item" then
            for child in node:iter_children() do
                if child:type() == "identifier" then
                    local mod_name = vim.treesitter.get_node_text(child, 0)
                    module_path = module_path .. mod_name .. "::"
                    break
                end
            end
        end
        node = node:parent()
    end

    local full_test_name = module_path .. test_name

    vim.notify("Debugging test: " .. full_test_name)
    dap.run({
        name = "Debug test: " .. test_name,
        type = "codelldb",
        request = "launch",
        program = test_binary,
        args = { "--exact", full_test_name },
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
    })
end

-- Debug keymaps (Rust buffers only)
vim.api.nvim_create_autocmd("FileType", {
    pattern = "rust",
    callback = function(e)
        local bufnr = e.buf
        bmap("<leader>dc", dap.continue, "Debug: continue", bufnr)
        bmap("<leader>dC", dap.run_to_cursor, "Debug: run to cursor", bufnr)
        bmap("<leader>dn", dap.step_over, "Debug: step over", bufnr)
        bmap("<leader>ds", dap.step_into, "Debug: step into", bufnr)
        bmap("<leader>do", dap.step_out, "Debug: step out", bufnr)
        bmap("<leader>db", dap.toggle_breakpoint, "Debug: toggle breakpoint", bufnr)
        bmap("<leader>dB", function()
            dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end, "Debug: conditional breakpoint", bufnr)
        bmap("<leader>dt", debug_rust_test, "Debug: test under cursor", bufnr)
        bmap("<leader>dr", dap.repl.toggle, "Debug: toggle REPL", bufnr)
        bmap("<leader>dq", dap.terminate, "Debug: terminate", bufnr)
        bmap("<leader>dv", "<cmd>DapViewToggle!<cr>", "Debug: toggle view", bufnr)
        bmap("<leader>dX", dap.clear_breakpoints, "Debug: clear breakpoints", bufnr)
    end,
})
