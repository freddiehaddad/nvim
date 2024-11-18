-- configure feline
local function config(_, opts)
    local palette = require('peanut.palette')
    local feline = require('feline')
    local vi_mode = require('feline.providers.vi_mode')
    local file = require('feline.providers.file')
    local lsp = require('feline.providers.lsp')

    local theme = {
        fg = palette.fg2,
        bg = palette.bg1,
        black = palette.fg2,
        skyblue = palette.fg2,
        cyan = palette.fg2,
        green = palette.fg2,
        oceanblue = palette.fg2,
        magenta = palette.fg2,
        orange = palette.fg2,
        red = palette.fg2,
        violet = palette.fg2,
        white = palette.fg2,
        yellow = palette.fg2,
    }

    local c = {
        -- left
        vim_status = {
            provider = function()
                local s
                if require('lazy.status').has_updates() then
                    s = require('lazy.status').updates()
                else
                    s = ''
                end
                s = string.format('%s', s)
                return s
            end,
            hl = 'FelineComponent',
        },

        file_name = {
            provider = {
                name = 'file_info',
                opts = { colored_icon = false },
            },
            hl = 'FelineComponent',
            left_sep = {
                always_visible = true,
                str = string.format('%s', '  '),
                hl = 'FelineComponent',
            },
        },

        git_branch = {
            provider = function()
                local git = require('feline.providers.git')
                local branch, icon = git.git_branch()
                local s
                if #branch > 0 then
                    s = string.format('%s%s', icon, branch)
                else
                    s = string.format('%s', 'Untracked')
                end
                return s
            end,
            hl = 'FelineComponent',
            left_sep = {
                always_visible = true,
                str = string.format('%s', '  '),
                hl = 'FelineComponent',
            },
        },

        lsp = {
            provider = function()
                local progress = require('lsp-progress').progress()
                if progress == '' then return '󱏎  LSP' end
                return string.format('%s', require('lsp-progress').progress())
            end,
            hl = function()
                local progress = require('lsp-progress').progress()
                if progress == '' then return 'FelineComponent' end
                if progress:find('^') ~= nil then return 'DiagnosticInfo' end
                return 'DiagnosticOk'
            end,
            left_sep = {
                always_visible = true,
                str = string.format('%s', '  '),
                hl = 'FelineComponent',
            },
        },

        -- right
        vi_mode = {
            provider = function()
                return string.format('%s', vi_mode.get_vim_mode())
            end,
            hl = function()
                return { fg = vi_mode.get_mode_color(), bg = 'none' }
            end,
            right_sep = {
                always_visible = true,
                str = string.format('%s', '  '),
                hl = 'FelineComponent',
            },
        },

        macro = {
            provider = function()
                local s
                local recording_register = vim.fn.reg_recording()
                if #recording_register == 0 then
                    s = ''
                else
                    s = string.format('Recording @%s', recording_register)
                end
                return s
            end,
            hl = 'FelineComponent',
            right_sep = {
                always_visible = true,
                str = string.format('%s', '  '),
                hl = 'FelineComponent',
            },
        },

        search_count = {
            provider = 'search_count',
            hl = 'FelineComponent',
            right_sep = {
                always_visible = true,
                str = string.format('%s', '  '),
                hl = 'FelineComponent',
            },
        },

        cursor_position = {
            provider = {
                name = 'position',
                opts = { padding = true },
            },
            hl = 'FelineComponent',
            right_sep = {
                always_visible = true,
                str = string.format('%s', ' '),
                hl = 'FelineComponent',
            },
        },

        scroll_bar = {
            provider = {
                name = 'scroll_bar',
                opts = { reverse = true },
            },
            hl = 'FelineComponent',
        },

        -- inactive statusline
        in_file_info = {
            provider = function()
                if vim.api.nvim_buf_get_name(0) ~= '' then
                    return file.file_info({}, { colored_icon = false })
                else
                    return file.file_type(
                        {},
                        { colored_icon = false, case = 'lowercase' }
                    )
                end
            end,
            hl = 'FelineComponent',
        },
    }

    local active = {
        { -- left
            c.vim_status,
            c.file_name,
            c.git_branch,
            c.lsp,
        },
        { -- right
            c.macro,
            c.search_count,
            c.vi_mode,
            c.cursor_position,
            c.scroll_bar,
        },
    }

    local inactive = {
        { -- left
        },
        { -- right
            c.in_file_info,
        },
    }

    opts.components = { active = active, inactive = inactive }

    feline.setup(opts)
    feline.use_theme(theme)
end

return {
    'freddiehaddad/feline.nvim',
    config = config,
    dependencies = {
        'lewis6991/gitsigns.nvim',
        'nvim-tree/nvim-web-devicons',
        {
            'linrongbin16/lsp-progress.nvim',
            opts = {
                spinner = {
                    '⠋',
                    '⠙',
                    '⠸',
                    '⢰',
                    '⣠',
                    '⣄',
                    '⡆',
                    '⠇',
                },
                client_format = function(_, spinner, series_messages)
                    return #series_messages > 0 and (spinner .. ' LSP')
                        or '  LSP'
                end,
                format = function(client_messages)
                    local sign = '  LSP'
                    if #client_messages > 0 then
                        return table.concat(client_messages)
                    end
                    if #vim.lsp.get_clients() > 0 then return sign end
                    return '󱏎  LSP'
                end,
            },
        },
    },
    init = function()
        -- update statusbar when there's a plugin update
        vim.api.nvim_create_autocmd('User', {
            pattern = 'LazyCheck',
            callback = function() vim.opt.statusline = vim.opt.statusline end,
        })

        -- update statusbar with LSP progress
        vim.api.nvim_create_augroup('feline_augroup', { clear = true })
        vim.api.nvim_create_autocmd('User', {
            group = 'feline_augroup',
            pattern = 'LspProgressStatusUpdated',
            callback = function() vim.opt.statusline = vim.opt.statusline end,
        })

        -- hide the mode
        vim.opt.showmode = false

        -- hide search count on command line
        vim.opt.shortmess:append({ S = true })
    end,
    opts = {
        force_inactive = {
            filetypes = {
                '^dapui_*',
                '^help$',
                '^neotest*',
                '^NvimTree$',
                '^qf$',
            },
        },
        disable = { filetypes = { '^alpha$' } },
    },
}
