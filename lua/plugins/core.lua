-- Dashboard
local header = [[
█▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀ ▀ ▀▀▀█  █▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀ ▀ ▀▀▀▀█   
█ │░███▀█▀▀▀▀▀▓████▓▄ ▀▀▀▀ │░████▓▄   │▓████▓▄  █   
█ │▒███████  │▓███████     │▒███████  │▓███████ █   
█ │▓███████  │▓███████     │▓███████  │▓███████ █   
▀ │▓███████  │▓███████     │▓███████  │▓███████ █   
▀ │▓███████  │▓███████▄ ▄  │▓███████  │▓███████ █   
█ │▓███████                │▓███████   ▓███████ █▄▄▄
█ │▓███████▀▀ ▀    ▀       │▓███████▀▀▀▓█▄█████▄ ▄ █
█▄▄▄▄▄▄▄▄ ▀ █▀▀▀▀▀▀▀▀▀▀▀▀█▄▄▄▄ ▄ ▄▄▄▄▄▄▄▄▄▄▄ ▄ ▄▄▄▄█
        █ ▀ █                                       
  <fh>  ▀▀▀▀▀                                       ]]
local footer = [[
▀ ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀ ▀ ▀▀▀▀▀▀▀▀▀▀▀▀▀ ▀
                                      n e o v i m   ]]

-- Plugins
return {
    -- Icon provider
    {
        "echasnovski/mini.icons",
        lazy = true,
        opts = {},
        init = function()
            package.preload["nvim-web-devicons"] = function()
                require("mini.icons").mock_nvim_web_devicons()
                return package.loaded["nvim-web-devicons"]
            end

            local hl = vim.api.nvim_set_hl
            hl(0, "MiniIconsAzure", { link = "Icon" })
            hl(0, "MiniIconsBlue", { link = "Icon" })
            hl(0, "MiniIconsCyan", { link = "Icon" })
            hl(0, "MiniIconsGreen", { link = "Icon" })
            hl(0, "MiniIconsGrey", { link = "Icon" })
            hl(0, "MiniIconsOrange", { link = "Icon" })
            hl(0, "MiniIconsPurple", { link = "Icon" })
            hl(0, "MiniIconsRed", { link = "Icon" })
            hl(0, "MiniIconsYellow", { link = "Icon" })
        end,
    },

    -- Copilot
    {
        "github/copilot.vim",
        enabled = false,
        event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    },

    -- File explorer
    {
        "stevearc/oil.nvim",
        cmd = "Oil",
        keys = {
            --stylua: ignore start
            { "<leader>o", "<cmd>Oil<cr>", desc = "Oil" },
            { "<leader>O", function() require("oil").open(vim.uv.cwd()) end, desc = "Oil (cwd)" },
            --stylua: ignore end
        },
        opts = {
            default_file_explorer = false,
            keymaps = {
                ["<C-s>"] = false, -- replace with C-v
                ["<C-v>"] = { "actions.select", opts = { vertical = true } },
            },
            float = { border = "single" },
            confirmation = { border = "single" },
            progress = { border = "single" },
            ssh = { border = "single" },
            keymaps_help = { border = "single" },
        },
    },

    -- Statusline
    {
        "nvim-lualine/lualine.nvim",
        event = { "BufReadPost", "BufNewFile", "BufWritePre" },
        init = function()
            vim.g.lualine_laststatus = vim.o.laststatus
            if vim.fn.argc(-1) > 0 then
                -- set an empty statusline till lualine loads
                vim.o.statusline = " "
            else
                -- hide the statusline on the starter page
                vim.o.laststatus = 0
            end
        end,
        opts = function()
            -- PERF: we don't need this lualine require madness
            local lualine_require = require("lualine_require")
            lualine_require.require = require

            vim.o.laststatus = vim.g.lualine_laststatus
            local opts = {
                options = {
                    component_separators = "",
                    globalstatus = vim.o.laststatus == 3,
                    section_separators = "",
                    disabled_filetypes = {
                        statusline = { "snacks_dashboard" },
                    },
                    ignore_focus = {
                        "dap-repl",
                        "dapui_breakpoints",
                        "dapui_console",
                        "dapui_scopes",
                        "dapui_stacks",
                        "dapui_watches",
                    },
                    theme = {
                        normal = {
                            a = "Color0",
                            b = "Color0",
                            c = "Color0",
                            x = "Color0",
                            y = "Color0",
                            z = "Color0",
                        },
                        insert = {
                            a = "Color4",
                        },
                        visual = {
                            a = "Color6",
                        },
                        replace = {
                            a = "Color3",
                        },
                        inactive = {
                            a = "Color0",
                        },
                    },
                },
                extensions = { "lazy", "mason", "nvim-dap-ui", "oil", "trouble", "quickfix" },
                sections = {
                    lualine_a = {
                        {
                            require("lazy.status").updates,
                            fmt = function()
                                return require("lazy.status").updates() or " "
                            end,
                            padding = 0,
                        },
                    },
                    lualine_b = {
                        { "filetype", icon_only = true, padding = { left = 2 } },
                        {
                            "filename",
                            symbols = {
                                modified = "󰯹 ",
                                readonly = "󰰠 ",
                                unnamed = "󰰩 ",
                                newfile = "󰰔 ",
                            },
                            padding = { left = 1 },
                        },
                    },
                    lualine_c = {
                        { "branch", icon = " ", padding = { left = 2 } },
                        {
                            "diff",
                            diff_color = {
                                added = "DiffAdd",
                                modified = "DiffChange",
                                removed = "DiffDelete",
                            },
                            symbols = { added = "󰯭 ", modified = "󰯳 ", removed = "󰯶 " },
                            source = function()
                                local gitsigns = vim.b.gitsigns_status_dict
                                if gitsigns then
                                    return {
                                        added = gitsigns.added,
                                        modified = gitsigns.changed,
                                        removed = gitsigns.removed,
                                    }
                                end
                            end,
                            padding = { left = 1 },
                        },
                    },
                    lualine_x = { { "lsp_status", icon = "", symbols = { done = "●" } } },
                    lualine_y = {
                        {
                            "macro",
                            fmt = function()
                                local reg = vim.fn.reg_recording()
                                if reg == "" then
                                    return ""
                                end
                                return "󰑋 " .. reg
                            end,
                            padding = { right = 2 },
                        },
                    },
                    lualine_z = {
                        { "location", padding = { right = 1 } },
                        { "progress", padding = 0 },
                    },
                },
                inactive_sections = {
                    lualine_a = {
                        { "filetype", icon_only = true, padding = 0 },
                        { "filename", padding = 0 },
                    },
                    lualine_b = {},
                    lualine_c = {},
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = {},
                },
            }
            return opts
        end,
    },

    -- Session managment
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        init = function()
            vim.opt.sessionoptions =
                { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
        end,
        keys = {
            { "<leader>qs", "<cmd>lua require('persistence').load()<cr>", desc = "Restore session" },
            { "<leader>qS", "<cmd>lua require('persistence').select()<cr>", desc = "Select session" },
            { "<leader>ql", "<cmd>lua require('persistence').load({last=true})<cr>", desc = "Restore last session" },
            { "<leader>qd", "<cmd>lua require('persistence').stop()<cr>", desc = "Don't save current session" },
        },
        opts = {},
    },

    -- Collection of small QoL plugins
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        init = function()
            local hl = vim.api.nvim_set_hl
            hl(0, "SnacksNotifierHistory", { link = "NormalFloat" })

            hl(0, "SnacksNotifierInfo", { link = "Info" })
            hl(0, "SnacksNotifierWarn", { link = "Warn" })
            hl(0, "SnacksNotifierError", { link = "Error" })
            hl(0, "SnacksNotifierDebug", { link = "Debug" })
            hl(0, "SnacksNotifierTrace", { link = "Trace" })

            hl(0, "SnacksNotifierIconInfo", { link = "SnacksNotifierInfo" })
            hl(0, "SnacksNotifierIconWarn", { link = "SnacksNotifierWarn" })
            hl(0, "SnacksNotifierIconDebug", { link = "SnacksNotifierDebug" })
            hl(0, "SnacksNotifierIconError", { link = "SnacksNotifierError" })
            hl(0, "SnacksNotifierIconTrace", { link = "SnacksNotifierTrace" })
            hl(0, "SnacksNotifierTitleInfo", { link = "SnacksNotifierInfo" })
            hl(0, "SnacksNotifierTitleWarn", { link = "SnacksNotifierWarn" })
            hl(0, "SnacksNotifierTitleDebug", { link = "SnacksNotifierDebug" })
            hl(0, "SnacksNotifierTitleError", { link = "SnacksNotifierError" })
            hl(0, "SnacksNotifierTitleTrace", { link = "SnacksNotifierTrace" })
            hl(0, "SnacksNotifierBorderInfo", { link = "SnacksNotifierInfo" })
            hl(0, "SnacksNotifierBorderWarn", { link = "SnacksNotifierWarn" })
            hl(0, "SnacksNotifierBorderDebug", { link = "SnacksNotifierDebug" })
            hl(0, "SnacksNotifierBorderError", { link = "SnacksNotifierError" })
            hl(0, "SnacksNotifierBorderTrace", { link = "SnacksNotifierTrace" })
            hl(0, "SnacksDashboardDesc", { link = "Color0" })
            hl(0, "SnacksDashboardFile", { link = "Color0" })
            hl(0, "SnacksDashboardHeader", { link = "Color15" })
            hl(0, "SnacksDashboardFooter", { link = "Color15" })
            hl(0, "SnacksDashboardIcon", { link = "Icon" })
            hl(0, "SnacksDashboardKey", { link = "Color0" })

            vim.api.nvim_create_autocmd("User", {
                pattern = "VeryLazy",
                callback = function()
                    -- Create some toggle mappings
                    Snacks.toggle.animate():map("<leader>ua")
                    Snacks.toggle.line_number():map("<leader>ul")
                    Snacks.toggle.option("relativenumber", { name = "relative number" }):map("<leader>uL")
                    Snacks.toggle.option("spell", { name = "spelling" }):map("<leader>us")
                    Snacks.toggle.scroll():map("<leader>uS")
                    Snacks.toggle.option("wrap", { name = "wrap" }):map("<leader>uw")
                end,
            })
        end,
        opts = {
            dashboard = {
                width = 46,
                preset = {
                    header = header,
                    keys = {
                        -- stylua: ignore start
                        { icon = " ", key = "f", desc = "Find File", action = ":Telescope find_files" },
                        { icon = " ", key = "n", desc = "New File", action = ":enew | startinsert" },
                        { icon = " ", key = "g", desc = "Find Text", action = ":Telescope live_grep" },
                        { icon = " ", key = "r", desc = "Recent Files", action = ":Telescope oldfiles" },
                        { icon = " ", key = "c", desc = "Config", action = ":Telescope find_files " .. "cwd=" .. vim.fn.stdpath("config")},
                        { icon = " ", key = "s", desc = "Restore Session", section = "session" },
                        { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
                        { icon = "󱌢 ", key = "m", desc = "Mason", action = ":Mason" },
                        { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                        -- stylua: ignore end
                    },
                },
                sections = {
                    { section = "header", gap = 0, padding = 0 },
                    { section = "keys", gap = 1, padding = 1 },
                    {
                        text = {
                            {
                                footer,
                                hl = "SnacksDashboardHeader",
                            },
                        },
                        gap = 0,
                        padding = 1,
                    },
                    { section = "startup", gap = 0, padding = 0 },
                },
            },
            styles = {
                notification = { border = "single" },
                notification_history = { border = "single" },
            },
            input = { enabled = true },
            notifier = {
                enabled = true,
                icons = {
                    error = "󰯸 ",
                    warn = "󰰮 ",
                    info = "󰰄 ",
                    debug = "󰯵 ",
                    trace = "󰰥 ",
                },
            },
            scroll = { enabled = true },
            statuscolumn = { enabled = true },
        },
        keys = {
            { "<leader>bd", "<cmd>lua Snacks.bufdelete()<cr>", desc = "Delete buffer" },
            { "<leader>n", "<cmd>lua Snacks.notifier.show_history()<cr>", desc = "Notification history" },
            { "<leader>un", "<cmd>lua Snacks.notifier.hide()<cr>", desc = "Dismiss all notifications" },
        },
    },

    -- Key binding help
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            local hl = vim.api.nvim_set_hl
            hl(0, "WhichKey", { link = "Function" })
            hl(0, "WhichKeyBorder", { link = "FloatBorder" })
            hl(0, "WhichKeyDesc", { link = "Identifier" })
            hl(0, "WhichKeyGroup", { link = "Keyword" })
            hl(0, "WhichKeyIcon", { link = "@markup.link" })
            hl(0, "WhichKeyIconAzure", { link = "Icon" })
            hl(0, "WhichKeyIconBlue", { link = "Icon" })
            hl(0, "WhichKeyIconCyan", { link = "Icon" })
            hl(0, "WhichKeyIconGreen", { link = "Icon" })
            hl(0, "WhichKeyIconGrey", { link = "Icon" })
            hl(0, "WhichKeyIconOrange", { link = "Icon" })
            hl(0, "WhichKeyIconPurple", { link = "Icon" })
            hl(0, "WhichKeyIconRed", { link = "Icon" })
            hl(0, "WhichKeyIconYellow", { link = "Icon" })
            hl(0, "WhichKeyNormal", { link = "NormalFloat" })
            hl(0, "WhichKeySeparator", { link = "Comment" })
            hl(0, "WhichKeyTitle", { link = "Title" })
            hl(0, "WhichKeyValue", { link = "Comment" })
        end,
        opts = {
            icons = { separator = ":" },
            spec = {
                mode = { "n", "v" },
                { "<leader>c", group = "Code" },
                { "<leader>d", group = "Debug" },
                { "<leader>f", group = "File/find" },
                { "<leader>g", group = "Git" },
                { "<leader>gh", group = "Hunks" },
                { "<leader>m", group = "Markdown" },
                { "<leader>p", group = "Plugins" },
                { "<leader>q", group = "Quit/session" },
                { "<leader>s", group = "Search" },
                { "<leader>u", group = "Ui" },
                { "<leader>x", group = "Diagnostics/quickfix" },
                { "z", group = "Folds/jumps/spelling" },
                { "g", group = "Goto/actions" },
                { "[", group = "Prev" },
                { "]", group = "Next" },
                {
                    "<leader>b",
                    group = "Buffer",
                    expand = function()
                        return require("which-key.extras").expand.buf()
                    end,
                },
                {
                    "<leader>w",
                    group = "Windows",
                    proxy = "<c-w>",
                    expand = function()
                        return require("which-key.extras").expand.win()
                    end,
                },
                -- better descriptions
                { "gx", desc = "Open with system app" },
            },
        },
        -- stylua: ignore
        keys = {
            { "<leader>?", "<cmd>lua require('which-key').show({ global = false })<cr>", desc = "Buffer keymaps (which-key)" },
        },
    },

    -- Git integration
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPost", "BufNewFile", "BufWritePre" },
        opts = {
            signs = {
                add = { text = "▎" },
                change = { text = "▎" },
                delete = { text = "" },
                topdelete = { text = "" },
                changedelete = { text = "▎" },
                untracked = { text = "▎" },
            },
            signs_staged = {
                add = { text = "▎" },
                change = { text = "▎" },
                delete = { text = "" },
                topdelete = { text = "" },
                changedelete = { text = "▎" },
            },
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns

                local function map(mode, l, r, desc)
                    vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
                end

                -- stylua: ignore start
                map("n", "]h", function() if vim.wo.diff then vim.cmd.normal({ "]c", bang = true }) else gs.nav_hunk("next") end end, "Next hunk")
                map("n", "[h", function() if vim.wo.diff then vim.cmd.normal({ "[c", bang = true }) else gs.nav_hunk("prev") end end, "Prev hunk")
                map("n", "]H", function() gs.nav_hunk("last") end, "Last hunk")
                map("n", "[H", function() gs.nav_hunk("first") end, "First hunk")
                map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage hunk")
                map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset hunk")
                map("n", "<leader>ghS", gs.stage_buffer, "Stage buffer")
                map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo stage hunk")
                map("n", "<leader>ghR", gs.reset_buffer, "Reset buffer")
                map("n", "<leader>ghp", gs.preview_hunk_inline, "Preview hunk inline")
                map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame line")
                map("n", "<leader>ghB", function() gs.blame() end, "Blame buffer")
                map("n", "<leader>ghd", gs.diffthis, "Diff this")
                map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff this ~")
                map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns select hunk")
                map("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", "Commits")
                map("n", "<leader>gs", "<cmd>Telescope git_status<cr>", "Status")
                -- stylua: ignore end
            end,
        },
    },

    -- Finder and previewer
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        init = function()
            local hl = vim.api.nvim_set_hl
            hl(0, "TelescopeMatching", { link = "MSearchBright" })
            hl(0, "TelescopePreviewLine", { link = "MSearchBright" })
            hl(0, "TelescopePreviewMatch", { link = "MSearchBright" })
            hl(0, "TelescopeNormal", { link = "NormalFloat" })
            hl(0, "TelescopeSelection", { link = "PmenuSel" })
            hl(0, "TelescopeTitle", { link = "Title" })
        end,
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
            },
        },
        --stylua: ignore
        keys = {
            -- find
            { "<leader>fb", "<cmd>Telescope buffers sort_mru=true sort_lastused=true ignore_current_buffer=true<cr>", desc = "Buffers" },
            { "<leader>fc", "<cmd>Telescope find_files cwd=" .. vim.fn.stdpath("config") .. "<cr>", desc = "Config file" },
            { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Files" },
            { "<leader>fF", "<cmd>Telescope find_files hidden=true<cr>", desc = "Files (hidden)" },
            { "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Files (git)" },
            { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
            -- search
            { "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto commands" },
            { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
            { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command history" },
            { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
            { "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document diagnostics" },
            { "<leader>sD", "<cmd>Telescope diagnostics<cr>", desc = "Workspace diagnostics" },
            { "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "Grep (cwd)" },
            { "<leader>sG", desc = "Glob grep (cwd)" },
            { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help pages" },
            { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "highlight groups" },
            { "<leader>sj", "<cmd>Telescope jumplist<cr>", desc = "Jumplist" },
            { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
            { "<leader>sl", "<cmd>Telescope loclist<cr>", desc = "Location list" },
            { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Marks" },
            { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
            { "<leader>sq", "<cmd>Telescope quickfix<cr>", desc = "Quickfix list" },
            { "<leader>sR", "<cmd>Telescope resume<cr>", desc = "Resume" },
            { "<leader>sw", "<cmd>Telescope grep_string word_match=-w<cr>", desc = "Word" },
            { "<leader>sw", "<cmd>Telescope grep_string word_match=-w<cr>", desc = "Selection", mode = "v" },
        },
        opts = function()
            local actions = require("telescope.actions")
            local open_with_trouble = function(...)
                return require("trouble.sources.telescope").open(...)
            end
            return {
                defaults = {
                    prompt_prefix = "  ",
                    selection_caret = " ",
                    multi_icon = " ",
                    -- use square corners
                    borderchars = {
                        " ",
                        " ",
                        " ",
                        " ",
                        " ",
                        " ",
                        " ",
                        " ",
                    },
                    mappings = {
                        i = {
                            ["<C-f>"] = actions.preview_scrolling_down,
                            ["<C-b>"] = actions.preview_scrolling_up,
                            ["<c-h>"] = "select_horizontal",
                            ["<c-t>"] = open_with_trouble,
                        },
                        n = {
                            ["q"] = actions.close,
                        },
                    },
                },
                extensions = { fzf = {} },
            }
        end,
        config = function(_, opts)
            require("telescope").setup(opts)
            require("telescope").load_extension("fzf")

            local live_grep_globbing = function(options)
                local pickers = require("telescope.pickers")
                local finders = require("telescope.finders")
                local make_entry = require("telescope.make_entry")
                local conf = require("telescope.config").values

                options = options or {}
                options.cwd = options.cwd or vim.uv.cwd()

                local finder = finders.new_async_job({
                    command_generator = function(prompt)
                        if not prompt or prompt == "" then
                            return nil
                        end

                        local pieces = vim.split(prompt, "  ")
                        local args = { "rg" }
                        if pieces[1] then
                            table.insert(args, "-e")
                            table.insert(args, pieces[1])
                        end

                        if pieces[2] then
                            table.insert(args, "-g")
                            table.insert(args, pieces[2])
                        end

                        return vim.iter({
                            args,
                            {
                                "--color=never",
                                "--no-heading",
                                "--with-filename",
                                "--line-number",
                                "--column",
                                "--smart-case",
                            },
                        })
                            :flatten()
                            :totable()
                    end,
                    entry_maker = make_entry.gen_from_vimgrep(options),
                    cwd = options.cwd,
                })
                pickers
                    .new(options, {
                        debounce = 100,
                        prompt_title = "multigrep",
                        finder = finder,
                        previewer = conf.grep_previewer(options),
                        sorter = require("telescope.sorters").empty(),
                    })
                    :find()
            end

            vim.keymap.set("n", "<leader>sG", live_grep_globbing, { desc = "Glob grep (cwd)" })
        end,
    },

    -- Better diagnostics list and others
    {
        "folke/trouble.nvim",
        cmd = { "Trouble" },
        opts = {
            modes = {
                lsp = {
                    win = { position = "right" },
                },
            },
        },
        keys = {
            { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (trouble)" },
            { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer diagnostics (trouble)" },
            { "<leader>cs", "<cmd>Trouble symbols toggle<cr>", desc = "Symbols (trouble)" },
            { "<leader>cS", "<cmd>Trouble lsp toggle<cr>", desc = "LSP references/definitions/... (trouble)" },
            { "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location list (trouble)" },
            { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix list (trouble)" },
            {
                "[q",
                function()
                    if require("trouble").is_open() then
                        ---@diagnostic disable-next-line: missing-fields
                        require("trouble").prev({ skip_groups = true, jump = true }, {})
                    else
                        local ok, err = pcall(vim.cmd.cprev)
                        if not ok then
                            vim.notify(err, vim.log.levels.ERROR)
                        end
                    end
                end,
                desc = "Previous Trouble/Quickfix item",
            },
            {
                "]q",
                function()
                    if require("trouble").is_open() then
                        ---@diagnostic disable-next-line: missing-fields
                        require("trouble").next({ skip_groups = true, jump = true }, {})
                    else
                        local ok, err = pcall(vim.cmd.cnext)
                        if not ok then
                            vim.notify(err, vim.log.levels.ERROR)
                        end
                    end
                end,
                desc = "Next Trouble/Quickfix item",
            },
        },
    },

    -- Syntax highlighting and code parsing
    {
        "nvim-treesitter/nvim-treesitter",
        main = "nvim-treesitter.configs",
        build = ":TSUpdate",
        cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
        event = { "BufReadPost", "BufNewFile", "BufWritePre" },
        init = function(plugin)
            vim.opt.foldmethod = "expr"
            vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
            -- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
            -- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
            -- no longer trigger the **nvim-treesitter** module to be loaded in time.
            -- Luckily, the only things that those plugins need are the custom queries, which we make available
            -- during startup.
            require("lazy.core.loader").add_to_rtp(plugin)
            require("nvim-treesitter.query_predicates")
        end,
        keys = {
            { "<c-i>", desc = "Increment Selection" },
            { "<bs>", desc = "Decrement Selection", mode = "x" },
        },
        opts = {
            ensure_installed = {
                "c",
                "cpp",
                "cmake",
                "html",
                "lua",
                "markdown",
                "markdown_inline",
                "regex",
                "ron",
                "rust",
                "toml",
                "vim",
                "vimdoc",
                "git_config",
                "git_rebase",
                "gitattributes",
                "gitcommit",
                "gitignore",
            },
            highlight = {
                enable = true,
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<c-i>",
                    node_incremental = "<c-i>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },
            indent = {
                enable = true,
            },
        },
    },

    -- LSP for Cargo.toml
    {
        "Saecki/crates.nvim",
        event = "BufRead Cargo.toml",
        opts = {
            completion = {
                crates = {
                    enabled = true,
                },
            },
            lsp = {
                enabled = true,
                actions = true,
                completion = true,
                hover = true,
            },
        },
    },

    -- Rust
    {
        "mrcjkb/rustaceanvim",
        ft = "rust",
        opts = {
            tools = {
                test = "example",
            },
            server = {
                -- stylua: ignore
                on_attach = function(client, bufnr)
                    -- vim.notify(vim.inspect(client))

                    -- stylua: ignore start
                    local map = vim.keymap.set
                    map("n", "<leader>dn", "<cmd>RustLsp debug<cr>", { desc = "Debug nearest", buffer = bufnr })
                    map("n", "<leader>dR", "<cmd>RustLsp debuggables<cr>", { desc = "Rust debuggables ", buffer = bufnr })

                    map("n", "gd", function() require("telescope.builtin").lsp_definitions({ reuse_win = true }) end, { buffer = bufnr, desc = "Go to definition" })
                    map("n", "gy", function() require("telescope.builtin").lsp_type_definitions({ reuse_win = true }) end, { buffer = bufnr, desc = "Go to type definition" })
                    map("n", "gC", "<cmd>RustLsp openCargo<cr>", { buffer = bufnr, desc = "Open Cargo.toml" })
                    map("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "Go to declaration" })
                    map("n", "gI", function() require("telescope.builtin").lsp_implementations({ reuse_win = true }) end, { buffer = bufnr, desc = "Go to implementation" })
                    map("n", "gK", function() return vim.lsp.buf.signature_help() end, { buffer = bufnr, desc = "Signature help" })

                    map("n", "K", "<cmd>RustLsp hover actions<cr>", { buffer = bufnr, desc = "Hover" })

                    map({ "n", "v" }, "<leader>ca", "<cmd>RustLsp codeAction<cr>", { buffer = bufnr, desc = "Code action" })
                    map("n", "<leader>cl", "<cmd>LspInfo<cr>", { buffer = bufnr, desc = "LSP information" })
                    map("n", "<leader>cr", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename buffer" })

                    map("n", "<leader>cA", function() vim.lsp.buf.code_action({ context = { only = { "source" }, diagnostics = {} } }) end, { buffer = bufnr, desc = "Source action" })
                    map({ "n", "v" }, "J", "<cmd>RustLsp joinLines<cr>", { buffer = bufnr, desc = "Join lines" })
                    map("n", "<leader>cR", function() Snacks.rename.rename_file() end, { buffer = bufnr, desc = "Rename file" })

                    map("n", "<leader>sr", "<cmd>Telescope lsp_references<cr>", { buffer = bufnr, nowait = true, desc = "References" })
                    map("n", "<leader>ss", "<cmd>Telescope lsp_document_symbols<cr>", { buffer = bufnr, desc = "Symbols" })
                    map("n", "<leader>sS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", { buffer = bufnr, desc = "Symbols (workspace)" })
                    -- stylua: ignore end

                    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                    Snacks.toggle.inlay_hints():map("<leader>uh")

                    -- toggle virtual diagnostics
                    map("n", "<leader>ud", function()
                        if vim.diagnostic.config().virtual_text then
                            vim.diagnostic.config({ virtual_lines = false, virtual_text = false })
                        else
                            vim.diagnostic.config(vim.g.diagnostic_config)
                        end
                    end, { buffer = bufnr, desc = "Toggle virtual text" })

                    if client:supports_method("textDocument/foldingRange") then
                        local win = vim.api.nvim_get_current_win()
                        vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
                    end

                    if client.server_capabilities.codeLensProvider then
                        -- stylua: ignore start
                        map("n", "<leader>cC", vim.lsp.codelens.refresh, { buffer = bufnr, desc = "Refresh and display codelens" })
                        map({ "n", "v" }, "<leader>cc", vim.lsp.codelens.run, { buffer = bufnr, desc = "Run codelens" })
                        -- stylua: ignore end

                        vim.lsp.codelens.refresh()
                        vim.api.nvim_create_autocmd(
                            { "TextChanged", "InsertLeave", "CursorHold", "LspAttach", "BufEnter" },
                            { buffer = bufnr, callback = vim.lsp.codelens.refresh }
                        )
                    end

                    vim.b[bufnr].autoformat = true
                    -- stylua: ignore
                    map("n", "<leader>uf", function() vim.b[bufnr].autoformat = not vim.b[bufnr].autoformat end, { buffer = bufnr, desc = "Toggle autoformat (buffer)" })
                end,
                default_settings = {
                    -- rust-analyzer language server configuration
                    ["rust-analyzer"] = {
                        cargo = {
                            allFeatures = true,
                            loadOutDirsFromCheck = true,
                            buildScripts = {
                                enable = true,
                            },
                        },
                        -- Add clippy lints for Rust
                        checkOnSave = true,
                        -- Enable diagnostics
                        diagnostics = {
                            enable = true,
                        },
                        procMacro = {
                            enable = true,
                            ignored = {
                                ["async-trait"] = { "async_trait" },
                                ["napi-derive"] = { "napi" },
                                ["async-recursion"] = { "async_recursion" },
                            },
                        },
                        files = {
                            excludeDirs = {
                                ".direnv",
                                ".git",
                                ".github",
                                ".gitlab",
                                "bin",
                                "node_modules",
                                "target",
                                "venv",
                                ".venv",
                            },
                        },
                    },
                },
            },
        },
        config = function(_, opts)
            local package_path = require("mason-registry").get_package("codelldb"):get_install_path()
            local codelldb = package_path .. "/extension/adapter/codelldb"
            local library_path = package_path .. "/extension/lldb/lib/liblldb.dylib"
            -- local uname = io.popen("uname"):read("*l")
            -- if uname == "Linux" then
            --     library_path = package_path .. "/extension/lldb/lib/liblldb.so"
            -- end
            opts.dap = {
                adapter = require("rustaceanvim.config").get_codelldb_adapter(codelldb, library_path),
            }
            vim.g.rustaceanvim = vim.tbl_deep_extend("keep", vim.g.rustaceanvim or {}, opts or {})
        end,
    },

    -- Installer for LSP, formatting, and debugging
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        cmd = "Mason",
        keys = { { "<leader>pm", "<cmd>Mason<cr>", desc = "Mason" } },
        init = function()
            local hl = vim.api.nvim_set_hl
            hl(0, "MasonNormal", { link = "NormalFloat" })
            hl(0, "MasonHeader", { link = "Title" })
            hl(0, "MasonHeaderSecondary", { link = "Normal" })
            hl(0, "MasonHighlight", { link = "Normal" })
            hl(0, "MasonHighlightBlock", { link = "Normal" })
            hl(0, "MasonHighlightBlockBold", { link = "PmenuSel" })
            hl(0, "MasonHighlightSecondary", { link = "Normal" })
            hl(0, "MasonHighlightBlockSecondary", { link = "Normal" })
            hl(0, "MasonHighlightBlockBoldSecondary", { link = "Normal" })
            hl(0, "MasonLink", { link = "PmenuSel" })
            hl(0, "MasonMuted", { link = "Normal" })
            hl(0, "MasonMutedBlock", { link = "Normal" })
            hl(0, "MasonMutedBlockBold", { link = "Normal" })
            hl(0, "MasonError", { link = "ErrorMsg" })
            hl(0, "MasonWarning", { link = "WarningMsg" })
            hl(0, "MasonHeading", { link = "Title" })

            vim.api.nvim_create_autocmd("FileType", {
                pattern = "mason",
                callback = function()
                    vim.opt_local.cursorline = false
                end,
            })
        end,
        opts = {
            ui = {
                keymaps = { apply_language_filter = "F" },
                icons = {
                    package_installed = "● ",
                    package_pending = "󰦗 ",
                    package_uninstalled = "○ ",
                },
            },
            -- Not an actual option! Manually install the packages in config.
            ensure_installed = { "clang-format", "codelldb", "stylua" },
        },
        config = function(_, opts)
            require("mason").setup(opts)

            local mr = require("mason-registry")
            mr.refresh(function()
                for _, pkg in ipairs(opts.ensure_installed) do
                    local p = mr.get_package(pkg)
                    if not p:is_installed() then
                        p:install()
                    end
                end
            end)
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        lazy = true,
        dependencies = "williamboman/mason.nvim",
        opts = {
            automatic_installation = { exclude = { "rust_analyzer" } },
        },
    },

    -- LSP configuration
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPost", "BufNewFile", "BufWritePre" },
        dependencies = { "williamboman/mason-lspconfig.nvim", "saghen/blink.cmp" },
        init = function()
            local icons = {
                ERROR = "󰯹 ",
                WARN = "󰰯 ",
                HINT = "󰰂 ",
                INFO = "󰰅 ",
            }

            -- diagnostics
            local diagnostics = {
                underline = true,
                update_in_insert = true,
                virtual_lines = { current_line = true },
                virtual_text = {
                    current_line = true,
                    spacing = 2,
                    source = "if_many",
                    prefix = function(diagnostic)
                        for sev, icon in pairs(icons) do
                            if diagnostic.severity == vim.diagnostic.severity[sev] then
                                return icon
                            end
                        end
                    end,
                },
                severity_sort = true,
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = icons.ERROR,
                        [vim.diagnostic.severity.WARN] = icons.WARN,
                        [vim.diagnostic.severity.HINT] = icons.HINT,
                        [vim.diagnostic.severity.INFO] = icons.INFO,
                    },
                },
            }
            vim.diagnostic.config(diagnostics)
            vim.g.diagnostic_config = diagnostics
        end,
        config = function()
            require("lspconfig").lua_ls.setup({
                settings = {
                    Lua = {
                        workspace = {
                            checkThirdParty = false,
                        },
                        codeLens = {
                            enable = true,
                        },
                        completion = {
                            callSnippet = "Replace",
                        },
                        doc = {
                            privateName = { "^_" },
                        },
                        hint = {
                            enable = true,
                            setType = false,
                            paramType = true,
                            paramName = "Disable",
                            semicolon = "Disable",
                            arrayIndex = "Disable",
                        },
                    },
                },
                capabilities = vim.tbl_deep_extend(
                    "force",
                    { workspace = { fileOperations = { didRename = true, willRename = true } } },
                    vim.lsp.protocol.make_client_capabilities(),
                    require("blink.cmp").get_lsp_capabilities()
                ),
                on_attach = function(client, bufnr)
                    -- vim.notify(vim.inspect(client))

                    -- stylua: ignore start
                    local map = vim.keymap.set
                    map("n", "gd", function() require("telescope.builtin").lsp_definitions({ reuse_win = true }) end, { buffer = bufnr, desc = "Go to definition" })
                    map("n", "gy", function() require("telescope.builtin").lsp_type_definitions({ reuse_win = true }) end, { buffer = bufnr, desc = "Go to type definition" })
                    map("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "Go to declaration" })
                    map("n", "gI", function() require("telescope.builtin").lsp_implementations({ reuse_win = true }) end, { buffer = bufnr, desc = "Go to implementation" })
                    map("n", "gK", function() return vim.lsp.buf.signature_help() end, { buffer = bufnr, desc = "Signature help" })

                    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code action" })
                    map("n", "<leader>cl", "<cmd>LspInfo<cr>", { buffer = bufnr, desc = "LSP information" })
                    map("n", "<leader>cr", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename buffer" })

                    map("n", "<leader>cA", function() vim.lsp.buf.code_action({ context = { only = { "source" }, diagnostics = {} } }) end, { buffer = bufnr, desc = "Source action" })
                    map("n", "<leader>cR", function() Snacks.rename.rename_file() end, { buffer = bufnr, desc = "Rename file" })

                    map("n", "<leader>sr", "<cmd>Telescope lsp_references<cr>", { buffer = bufnr, nowait = true, desc = "References" })
                    map("n", "<leader>ss", "<cmd>Telescope lsp_document_symbols<cr>", { buffer = bufnr, desc = "Symbols" })
                    map("n", "<leader>sS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", { buffer = bufnr, desc = "Symbols (workspace)" })
                    -- stylua: ignore end

                    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                    Snacks.toggle.inlay_hints():map("<leader>uh")

                    -- toggle virtual diagnostics
                    map("n", "<leader>ud", function()
                        if vim.diagnostic.config().virtual_text then
                            vim.diagnostic.config({ virtual_lines = false, virtual_text = false })
                        else
                            vim.diagnostic.config(vim.g.diagnostic_config)
                        end
                    end, { buffer = bufnr, desc = "Toggle virtual text" })

                    if client:supports_method("textDocument/foldingRange") then
                        local win = vim.api.nvim_get_current_win()
                        vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
                    end

                    if client.server_capabilities.codeLensProvider then
                        -- stylua: ignore start
                        map("n", "<leader>cC", vim.lsp.codelens.refresh, { buffer = bufnr, desc = "Refresh and display codelens" })
                        map({ "n", "v" }, "<leader>cc", vim.lsp.codelens.run, { buffer = bufnr, desc = "Run codelens" })
                        -- stylua: ignore end

                        vim.lsp.codelens.refresh()
                        vim.api.nvim_create_autocmd(
                            { "TextChanged", "InsertLeave", "CursorHold", "LspAttach", "BufEnter" },
                            { buffer = bufnr, callback = vim.lsp.codelens.refresh }
                        )
                    end

                    vim.b[bufnr].autoformat = true
                    -- stylua: ignore
                    map("n", "<leader>uf", function() vim.b[bufnr].autoformat = not vim.b[bufnr].autoformat end, { buffer = bufnr, desc = "Toggle autoformat (buffer)" })
                end,
            })

            require("lspconfig").neocmake.setup({
                init_options = {
                    format = {
                        enable = true,
                    },
                    lint = {
                        enable = true,
                    },
                    scan_cmake_in_package = true,
                    semantic_token = true,
                },
                capabilities = vim.tbl_deep_extend("force", {
                    workspace = {
                        didChangeWatchedFiles = { dynamicRegistration = true, relative_pattern_support = true },
                    },
                    textDocument = {
                        completion = {
                            completionItem = {
                                snippetSupport = true,
                            },
                        },
                    },
                }, vim.lsp.protocol.make_client_capabilities(), require("blink.cmp").get_lsp_capabilities()),
                on_attach = function(client, bufnr)
                    -- vim.notify(vim.inspect(client))

                    -- stylua: ignore start
                    local map = vim.keymap.set
                    map("n", "gd", function() require("telescope.builtin").lsp_definitions({ reuse_win = true }) end, { buffer = bufnr, desc = "Go to definition" })
                    map("n", "gy", function() require("telescope.builtin").lsp_type_definitions({ reuse_win = true }) end, { buffer = bufnr, desc = "Go to type definition" })
                    map("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "Go to declaration" })
                    map("n", "gI", function() require("telescope.builtin").lsp_implementations({ reuse_win = true }) end, { buffer = bufnr, desc = "Go to implementation" })
                    map("n", "gK", function() return vim.lsp.buf.signature_help() end, { buffer = bufnr, desc = "Signature help" })

                    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code action" })
                    map("n", "<leader>cl", "<cmd>LspInfo<cr>", { buffer = bufnr, desc = "LSP information" })
                    map("n", "<leader>cr", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename buffer" })

                    map("n", "<leader>cA", function() vim.lsp.buf.code_action({ context = { only = { "source" }, diagnostics = {} } }) end, { buffer = bufnr, desc = "Source action" })
                    map("n", "<leader>cR", function() Snacks.rename.rename_file() end, { buffer = bufnr, desc = "Rename file" })

                    map("n", "<leader>sr", "<cmd>Telescope lsp_references<cr>", { buffer = bufnr, nowait = true, desc = "References" })
                    map("n", "<leader>ss", "<cmd>Telescope lsp_document_symbols<cr>", { buffer = bufnr, desc = "Symbols" })
                    map("n", "<leader>sS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", { buffer = bufnr, desc = "Symbols (workspace)" })
                    -- stylua: ignore end

                    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                    Snacks.toggle.inlay_hints():map("<leader>uh")

                    -- toggle virtual diagnostics
                    map("n", "<leader>ud", function()
                        if vim.diagnostic.config().virtual_text then
                            vim.diagnostic.config({ virtual_lines = false, virtual_text = false })
                        else
                            vim.diagnostic.config(vim.g.diagnostic_config)
                        end
                    end, { buffer = bufnr, desc = "Toggle virtual text" })

                    if client:supports_method("textDocument/foldingRange") then
                        local win = vim.api.nvim_get_current_win()
                        vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
                    end

                    if client.server_capabilities.codeLensProvider then
                        -- stylua: ignore start
                        map("n", "<leader>cC", vim.lsp.codelens.refresh, { buffer = bufnr, desc = "Refresh and display codelens" })
                        map({ "n", "v" }, "<leader>cc", vim.lsp.codelens.run, { buffer = bufnr, desc = "Run codelens" })
                        -- stylua: ignore end

                        vim.lsp.codelens.refresh()
                        vim.api.nvim_create_autocmd(
                            { "TextChanged", "InsertLeave", "CursorHold", "LspAttach", "BufEnter" },
                            { buffer = bufnr, callback = vim.lsp.codelens.refresh }
                        )
                    end

                    vim.b[bufnr].autoformat = true
                    -- stylua: ignore
                    map("n", "<leader>uf", function() vim.b[bufnr].autoformat = not vim.b[bufnr].autoformat end, { buffer = bufnr, desc = "Toggle autoformat (buffer)" })
                end,
            })

            require("lspconfig").clangd.setup({
                capabilities = vim.tbl_deep_extend(
                    "force",
                    {},
                    vim.lsp.protocol.make_client_capabilities(),
                    require("blink.cmp").get_lsp_capabilities()
                ),
                on_attach = function(client, bufnr)
                    -- vim.notify(vim.inspect(client))

                    -- stylua: ignore start
                    local map = vim.keymap.set
                    map("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to definition" })
                    map("n", "gr", vim.lsp.buf.references, { buffer = bufnr, nowait = true, desc = "References" })
                    map("n", "gy", vim.lsp.buf.type_definition, { buffer = bufnr, desc = "Go to type definition" })
                    map("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "Go to declaration" })
                    map("n", "gI", vim.lsp.buf.implementation, { buffer = bufnr, desc = "Go to implementation" })
                    map("n", "gK", function() return vim.lsp.buf.signature_help() end, { buffer = bufnr, desc = "Signature help" })

                    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code action" })
                    map("n", "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", { buffer = bufnr, desc = "Switch source/header" })
                    map("n", "<leader>ci", "<cmd>ClangdShowSymbolInfo<cr>", { buffer = bufnr, desc = "Symbol information" })
                    map("n", "<leader>cl", "<cmd>LspInfo<cr>", { buffer = bufnr, desc = "LSP information" })
                    map("n", "<leader>cr", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename buffer" })

                    map("n", "<leader>cA", function() vim.lsp.buf.code_action({ context = { only = { "source" }, diagnostics = {} } }) end, { buffer = bufnr, desc = "Source action" })

                    map("n", "<leader>ss", "<cmd>Telescope lsp_document_symbols<cr>", { buffer = bufnr, desc = "Symbols" })
                    map("n", "<leader>sS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", { buffer = bufnr, desc = "Symbols (workspace)" })
                    -- stylua: ignore end

                    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                    Snacks.toggle.inlay_hints():map("<leader>uh")

                    -- toggle virtual diagnostics
                    map("n", "<leader>ud", function()
                        if vim.diagnostic.config().virtual_text then
                            vim.diagnostic.config({ virtual_lines = false, virtual_text = false })
                        else
                            vim.diagnostic.config(vim.g.diagnostic_config)
                        end
                    end, { buffer = bufnr, desc = "Toggle virtual text" })

                    if client:supports_method("textDocument/foldingRange") then
                        local win = vim.api.nvim_get_current_win()
                        vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
                    end

                    if client.server_capabilities.codeLensProvider then
                        -- stylua: ignore start
                        map("n", "<leader>cC", vim.lsp.codelens.refresh, { buffer = bufnr, desc = "Refresh and display codelens" })
                        map({ "n", "v" }, "<leader>cc", vim.lsp.codelens.run, { buffer = bufnr, desc = "Run codelens" })
                        -- stylua: ignore end

                        vim.lsp.codelens.refresh()
                        vim.api.nvim_create_autocmd(
                            { "TextChanged", "InsertLeave", "CursorHold", "LspAttach", "BufEnter" },
                            { buffer = bufnr, callback = vim.lsp.codelens.refresh }
                        )
                    end

                    vim.b[bufnr].autoformat = true
                    -- stylua: ignore
                    map("n", "<leader>uf", function() vim.b[bufnr].autoformat = not vim.b[bufnr].autoformat end, { buffer = bufnr, desc = "Toggle autoformat (buffer)" })
                end,
            })

            require("lspconfig").marksman.setup({
                capabilities = vim.tbl_deep_extend(
                    "force",
                    { workspace = { didChangeWatchedFiles = { dynamicRegistration = true } } },
                    vim.lsp.protocol.make_client_capabilities(),
                    require("blink.cmp").get_lsp_capabilities()
                ),
                on_attach = function(client, bufnr)
                    -- vim.notify(vim.inspect(client))

                    -- stylua: ignore start
                    local map = vim.keymap.set
                    map("n", "gd", function() require("telescope.builtin").lsp_definitions({ reuse_win = true }) end, { buffer = bufnr, desc = "Go to definition" })
                    map("n", "gy", function() require("telescope.builtin").lsp_type_definitions({ reuse_win = true }) end, { buffer = bufnr, desc = "Go to type definition" })
                    map("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "Go to declaration" })
                    map("n", "gI", function() require("telescope.builtin").lsp_implementations({ reuse_win = true }) end, { buffer = bufnr, desc = "Go to implementation" })
                    map("n", "gK", function() return vim.lsp.buf.signature_help() end, { buffer = bufnr, desc = "Signature help" })

                    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code action" })
                    map("n", "<leader>cl", "<cmd>LspInfo<cr>", { buffer = bufnr, desc = "LSP information" })
                    map("n", "<leader>cr", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename buffer" })

                    map("n", "<leader>cA", function() vim.lsp.buf.code_action({ context = { only = { "source" }, diagnostics = {} } }) end, { buffer = bufnr, desc = "Source action" })
                    map("n", "<leader>cR", function() Snacks.rename.rename_file() end, { buffer = bufnr, desc = "Rename file" })

                    map("n", "<leader>sr", "<cmd>Telescope lsp_references<cr>", { buffer = bufnr, nowait = true, desc = "References" })
                    map("n", "<leader>ss", "<cmd>Telescope lsp_document_symbols<cr>", { buffer = bufnr, desc = "Symbols" })
                    map("n", "<leader>sS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", { buffer = bufnr, desc = "Symbols (workspace)" })

                    map("n", "<leader>mp", "<cmd>Markview splitToggle<cr>", { buffer = bufnr, desc = "Markdown preview" })
                    map("n", "<leader>mt", "<cmd>Markview Toggle<cr>", { buffer = bufnr, desc = "Markdown toggle" })
                    -- stylua: ignore end

                    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                    Snacks.toggle.inlay_hints():map("<leader>uh")

                    -- toggle virtual diagnostics
                    map("n", "<leader>ud", function()
                        if vim.diagnostic.config().virtual_text then
                            vim.diagnostic.config({ virtual_lines = false, virtual_text = false })
                        else
                            vim.diagnostic.config(vim.g.diagnostic_config)
                        end
                    end, { buffer = bufnr, desc = "Toggle virtual text" })

                    if client:supports_method("textDocument/foldingRange") then
                        local win = vim.api.nvim_get_current_win()
                        vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
                    end

                    if client.server_capabilities.codeLensProvider then
                        -- stylua: ignore start
                        map("n", "<leader>cC", vim.lsp.codelens.refresh, { buffer = bufnr, desc = "Refresh and display codelens" })
                        map({ "n", "v" }, "<leader>cc", vim.lsp.codelens.run, { buffer = bufnr, desc = "Run codelens" })
                        -- stylua: ignore end

                        vim.lsp.codelens.refresh()
                        vim.api.nvim_create_autocmd(
                            { "TextChanged", "InsertLeave", "CursorHold", "LspAttach", "BufEnter" },
                            { buffer = bufnr, callback = vim.lsp.codelens.refresh }
                        )
                    end

                    vim.b[bufnr].autoformat = true
                    -- stylua: ignore
                    map("n", "<leader>uf", function() vim.b[bufnr].autoformat = not vim.b[bufnr].autoformat end, { buffer = bufnr, desc = "Toggle autoformat (buffer)" })
                end,
            })
        end,
    },

    -- Formatting support
    {
        "stevearc/conform.nvim",
        dependencies = "williamboman/mason.nvim", -- dependency updates RTP
        event = "BufWritePre",
        cmd = "ConformInfo",
        init = function()
            vim.o.formatexpr = "v:lua.require('conform').formatexpr()"
        end,
        keys = {
            {
                "<leader>cf",
                function()
                    require("conform").format({ async = true })
                end,
                desc = "Format buffer",
            },
        },
        opts = {
            formatters_by_ft = {
                c = { "clang_format" },
                cpp = { "clang_format" },
                lua = { "stylua" },
                markdown = { "mdformat" },
                rust = { "rustfmt" },
                toml = { "taplo" },
            },
            default_format_opts = {
                lsp_format = "fallback",
            },
            format_on_save = function(bufnr)
                -- set during lsp config
                if vim.b[bufnr].autoformat then
                    return { time_ms = 3000, lsp_format = "fallback" }
                end
            end,
        },
    },

    -- Completion support
    {
        "saghen/blink.cmp",
        -- lazy = false,
        build = "cargo build --release",
        depedencies = "rafamadriz/friendly-snippets",
        event = "InsertEnter",
        opts = {
            keymap = {
                preset = "default",
                ["<c-k>"] = { "show", "show_documentation", "hide_documentation" },
            },
            completion = { ghost_text = { enabled = true } },
        },
    },

    -- Improved LSP for Neovim configuration
    {
        "folke/lazydev.nvim",
        ft = "lua",
        cmd = "LazyDev",
        opts = {
            library = {
                { path = "snacks.nvim", words = { "Snacks" } },
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },

    -- Debugging (DAP)
    {
        "mfussenegger/nvim-dap",
        lazy = true,
        dependencies = "jay-babu/mason-nvim-dap.nvim",
        config = function()
            local icons = {
                Stopped = { "", "DiagnosticWarn", "DapStoppedLine" },
                Breakpoint = "󰯰",
                BreakpointCondition = "󰯳",
                BreakpointRejected = { "󰰠", "DiagnosticError" },
                LogPoint = "󰰎",
            }
            for name, sign in pairs(icons) do
                sign = type(sign) == "table" and sign or { sign }
                vim.fn.sign_define(
                    "Dap" .. name,
                    ---@diagnostic disable-next-line
                    { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
                )
            end

            -- Setup DAP config by VsCode launch.json file
            local vscode = require("dap.ext.vscode")
            local json = require("plenary.json")
            ---@diagnostic disable-next-line
            vscode.json_decode = function(str)
                return vim.json.decode(json.json_strip_comments(str))
            end
        end,
    },

    -- Mason integration
    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = "williamboman/mason.nvim",
        cmd = { "DapInstall", "DapUninstall" },
        opts = { automatic_installation = true, handlers = {}, ensure_installed = {} },
    },

    -- Virtual text for the debugger UI
    {
        "theHamsta/nvim-dap-virtual-text",
        lazy = true,
        opts = {},
    },

    -- UI for the debugger
    {
        "rcarriga/nvim-dap-ui",
        init = function()
            local hl = vim.api.nvim_set_hl
            hl(0, "DapStoppedLine", { link = "Accent" })
            hl(0, "DapUINormal", { link = "Normal" })
            hl(0, "DapUIVariable", { link = "Variable" })
            hl(0, "DapUIScope", { link = "Normal" })
            hl(0, "DapUIType", { link = "Type" })
            hl(0, "DapUIValue", { link = "Identifier" })
            hl(0, "DapUIModifiedValue", { link = "Todo" })
            hl(0, "DapUIDecoration", { link = "Operator" })
            hl(0, "DapUIThread", { link = "Normal" })
            hl(0, "DapUIStoppedThread", { link = "Normal" })
            hl(0, "DapUIFrameName", { link = "Normal" })
            hl(0, "DapUISource", { link = "Normal" })
            hl(0, "DapUILineNumber", { link = "LineNr" })
            hl(0, "DapUIFloatNormal", { link = "NormalFloat" })
            hl(0, "DapUIFloatBorder", { link = "Normal" })
            hl(0, "DapUIWatchesEmpty", { link = "Normal" })
            hl(0, "DapUIWatchesValue", { link = "Normal" })
            hl(0, "DapUIWatchesError", { link = "DiagnosticError" })
            hl(0, "DapUIBreakpointsPath", { link = "Directory" })
            hl(0, "DapUIBreakpointsInfo", { link = "DiagnosticInfo" })
            hl(0, "DapUIBreakpointsCurrentLine", { link = "Normal" })
            hl(0, "DapUIBreakpointsLine", { link = "DapUILineNumber" })
            hl(0, "DapUIBreakpointsDisabledLine", { link = "DiagnosticInfo" })
            hl(0, "DapUICurrentFrameName", { link = "DapUIBreakpointsCurrentLine" })
            hl(0, "DapUIStepOver", { link = "Normal" })
            hl(0, "DapUIStepInto", { link = "Normal" })
            hl(0, "DapUIStepBack", { link = "Normal" })
            hl(0, "DapUIStepOut", { link = "Normal" })
            hl(0, "DapUIStop", { link = "Normal" })
            hl(0, "DapUIPlayPause", { link = "Normal" })
            hl(0, "DapUIRestart", { link = "Normal" })
            hl(0, "DapUIUnavailable", { link = "Error" })
            hl(0, "DapUIWinSelect", { link = "CusorLine" })
            hl(0, "DapUIEndofBuffer", { link = "EndofBuffer" })
        end,
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
            "theHamsta/nvim-dap-virtual-text",
        },
        keys = {
            -- stylua: ignore start
            { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, desc = "Breakpoint condition" },
            { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle breakpoint" },
            { "<leader>dc", function() require("dap").continue() end, desc = "Run/Continue" },
            { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to cursor" },
            { "<leader>dg", function() require("dap").goto_() end, desc = "Go to line (no execute)" },
            { "<leader>di", function() require("dap").step_into() end, desc = "Step into" },
            { "<leader>dj", function() require("dap").down() end, desc = "down" },
            { "<leader>dk", function() require("dap").up() end, desc = "up" },
            { "<leader>dl", function() require("dap").run_last() end, desc = "Run last" },
            { "<leader>do", function() require("dap").step_over() end, desc = "Step over" },
            { "<leader>dO", function() require("dap").step_out() end, desc = "Step out" },
            { "<leader>dP", function() require("dap").pause() end, desc = "Pause" },
            { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
            { "<leader>ds", function() require("dap").session() end, desc = "Session" },
            { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
            { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
            { "<leader>dX", "<cmd>DapClearBreakpoints<cr>", desc = "Clear breakpoints" },
            { "<leader>du", function() require("dapui").toggle({}) end, desc = "Dap UI" },
            { "<leader>de", function() require("dapui").eval() end, desc = "Eval",  mode = { "n", "v" } },
            {
                "<leader>da",
                function()
                    require("dap").continue({
                        before = function(config)
                            local args = type(config.args) == "function" and (config.args() or {}) or config.args or {}
                            local args_str = type(args) == "table" and table.concat(args, " ") or args
                            config = vim.deepcopy(config)
                            config.args = function()
                                local new_args = vim.fn.expand(vim.fn.input("Run with args: ", args_str))
                                ---@diagnostic disable-next-line
                                return require("dap.utils").splitstr(new_args)
                            end
                            return config
                        end,
                    })
                end,
                desc = "Run with args",
            },
            -- stylua: ignore end
        },
        opts = { controls = { enabled = false } },
        config = function(_, opts)
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup(opts)
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open({})
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close({})
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close({})
            end
        end,
    },

    -- Integrated unit testing
    {
        "nvim-neotest/neotest",
        dependencies = { "nvim-neotest/nvim-nio" },
        init = function()
            local hl = vim.api.nvim_set_hl
            hl(0, "NeotestPassed", { link = "DiagnosticOk" })
            hl(0, "NeotestFailed", { link = "DiagnosticError" })
            hl(0, "NeotestRunning", { link = "DiagnosticInfo" })
            hl(0, "NeotestSkipped", { link = "DiagnosticWarn" })
            hl(0, "NeotestTest", { link = "Function" })
            hl(0, "NeotestNamespace", { link = "Identifier" })
            hl(0, "NeotestFocused", { link = "DiagnosticInfo" })
            hl(0, "NeotestFile", { link = "Normal" })
            hl(0, "NeotestDir", { link = "Directory" })
            hl(0, "NeotestAdapterName", { link = "Title" })
            hl(0, "NeotestWinSelect", { link = "Normal" })
            hl(0, "NeotestMarked", { link = "Identifier" })
            hl(0, "NeotestTarget", { link = "Normal" })
            hl(0, "NeotestWatching", { link = "Normal" })
            hl(0, "NeotestUnknown", { link = "DiagnosticError" })
            hl(0, "NeotestBorder", { link = "Normal" })
            hl(0, "NeotestIndent", { link = "LineNr" })
            hl(0, "NeotestExpandMarker", { link = "LineNr" })
        end,
        opts = {
            adapters = {
                ["rustaceanvim.neotest"] = {},
            },
            status = { virtual_text = true },
            output = { open_on_run = true },
            quickfix = {
                open = function()
                    vim.cmd("copen")
                end,
            },
            floating = { border = "none" },
            icons = { expanded = "┐", final_child_prefix = "└" },
        },
        config = function(_, opts)
            if opts.adapters then
                local adapters = {}
                for name, config in pairs(opts.adapters or {}) do
                    if type(name) == "number" then
                        if type(config) == "string" then
                            config = require(config)
                        end
                        adapters[#adapters + 1] = config
                    elseif config ~= false then
                        local adapter = require(name)
                        if type(config) == "table" and not vim.tbl_isempty(config) then
                            local meta = getmetatable(adapter)
                            if adapter.setup then
                                adapter.setup(config)
                            elseif adapter.adapter then
                                adapter.adapter(config)
                                adapter = adapter.adapter
                            elseif meta and meta.__call then
                                adapter = adapter(config)
                            else
                                error("Adapter " .. name .. " does not support setup")
                            end
                        end
                        adapters[#adapters + 1] = adapter
                    end
                end
                opts.adapters = adapters
            end

            require("neotest").setup(opts)
        end,
        -- stylua: ignore
        keys = {
            { "<leader>t",  "", desc = "+test" },
            { "<leader>tt", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run file (neotest)" },
            { "<leader>tT", function() require("neotest").run.run(vim.uv.cwd()) end, desc = "Run all test files (neotest)" },
            { "<leader>tr", function() require("neotest").run.run() end, desc = "Run nearest (neotest)" },
            { "<leader>tl", function() require("neotest").run.run_last() end, desc = "Run last (neotest)" },
            { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle summary (neotest)" },
            { "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Show output (neotest)" },
            { "<leader>tO", function() require("neotest").output_panel.toggle() end, desc = "Toggle output panel (neotest)" },
            { "<leader>tS", function() require("neotest").run.stop() end, desc = "Stop (neotest)" },
            { "<leader>tw", function() require("neotest").watch.toggle(vim.fn.expand("%")) end, desc = "Toggle watch (neotest)" },
            ---@diagnostic disable-next-line: missing-fields
            { "<leader>td", function() require("neotest").run.run({ strategy = "dap" }) end, desc = "Debug nearest" },
        },
    },

    -- Markdown
    {
        "OXY2DEV/markview.nvim",
        opts = {
            preview = { enable = false },
        },
        ft = "markdown",
    },
}

--[[
█▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀ ▀ ▀▀▀█  █▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀ ▀ ▀▀▀▀█   
█ │░███▀█▀▀▀▀▀▓████▓▄ ▀▀▀▀ │░████▓▄   │▓████▓▄  █   
█ │▒███████  │▓███████     │▒███████  │▓███████ █   
█ │▓███████  │▓███████     │▓███████  │▓███████ █   
▀ │▓███████  │▓███████     │▓███████  │▓███████ █   
▀ │▓███████  │▓███████▄ ▄  │▓███████  │▓███████ █   
█ │▓███████                │▓███████   ▓███████ █▄▄▄
█ │▓███████▀▀ ▀    ▀       │▓███████▀▀▀▓█▄█████▄ ▄ █
█▄▄▄▄▄▄▄▄ ▀ █▀▀▀▀▀▀▀▀▀▀▀▀█▄▄▄▄ ▄ ▄▄▄▄▄▄▄▄▄▄▄ ▄ ▄▄▄▄█
        █ ▀ █                                       
  <fh>  ▀▀▀▀▀                                       

▀ ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀ ▀ ▀▀▀▀▀▀▀▀▀▀▀▀▀ ▀ 
                                      n e o v i m   

           _______  _ __ _____            /\            
_ __ ____ |      /____ ____   \  /\____ _/  \___ __ __ _
     \_  \|     /_   /     \   \/   /___/    \  ___     
      /   \    / /  /_  \   \  /   /   /      \/   \    
     /   \    /    / / _/   /\    /   /         /   \   
     \____\  /\_____/\_____/  \__/___/________\/     \  
           \/                                  \_____/  

__ _ ____  __  /\___  _ __ ______ __/\     n e o v i m  
             \/                       \  _ ___ __ _ ____
                                       \/               

      _______                                   
____ |      /____ ____ ___  ____ ___/\    __    
\_  \|     /_   /     \   \/   /___/  \  /  \   
 /   \    / /  /_ /\   \  /   /   /    \/    \  
/   \    /    / / _/   /\    /   /       /    \ 
\____\  /\_____/\_____/  \__/___/______\/      \
      \/                                \______/

______/\  __________________/\     n e o v i m  
        \/                    \  _______________
                               \/               
--]]
