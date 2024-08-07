_G._dot_repeat_step_over = function() require('dap').step_over() end

return {
    -- debug adapter protocol
    {
        'mfussenegger/nvim-dap',
        config = function() end,
        keys = {
            {
                '<leader>dB',
                function()
                    require('dap').set_breakpoint(
                        vim.fn.input('Breakpoint condition: ')
                    )
                end,
                desc = 'Breakpoint Condition',
            },
            {
                '<leader>db',
                function() require('dap').toggle_breakpoint() end,
                desc = 'Toggle Breakpoint',
            },
            {
                '<leader>dc',
                function() require('dap').continue() end,
                desc = 'Continue',
            },
            {
                '<leader>dC',
                function() require('dap').run_to_cursor() end,
                desc = 'Run to Cursor',
            },
            {
                '<leader>dg',
                function() require('dap').goto_() end,
                desc = 'Go to line (no execute)',
            },
            {
                '<leader>di',
                function() require('dap').step_into() end,
                desc = 'Step Into',
            },
            {
                '<leader>dj',
                function() require('dap').down() end,
                desc = 'Down',
            },
            { '<leader>dk', function() require('dap').up() end, desc = 'Up' },
            {
                '<leader>dl',
                function() require('dap').run_last() end,
                desc = 'Run Last',
            },
            {
                '<leader>dO',
                function() require('dap').step_out() end,
                desc = 'Step Out',
            },
            {
                '<leader>do',
                function()
                    vim.o.operatorfunc = 'v:lua._dot_repeat_step_over'
                    vim.cmd.normal('g@l')
                end,
                desc = 'Step Over',
            },
            {
                '<leader>dp',
                function() require('dap').pause() end,
                desc = 'Pause',
            },
            {
                '<leader>dR',
                function() require('dap').repl.toggle() end,
                desc = 'Toggle REPL',
            },
            {
                '<leader>ds',
                function() require('dap').session() end,
                desc = 'Session',
            },
            {
                '<leader>dt',
                function() require('dap').terminate() end,
                desc = 'Terminate',
            },
            {
                '<leader>dw',
                function() require('dap.ui.widgets').hover() end,
                desc = 'Widgets',
            },
            {
                '<leader>dX',
                function() require('dap').clear_breakpoints() end,
                desc = 'Clear all breakpoints',
            },
        },
    },

    -- debugger ui
    {
        'rcarriga/nvim-dap-ui',
        config = function(_, opts)
            local dap = require('dap')
            local dapui = require('dapui')
            dapui.setup(opts)
            dap.listeners.after.event_initialized['dapui_config'] = function()
                dapui.open({})
            end
            dap.listeners.before.event_terminated['dapui_config'] = function()
                dapui.close({})
            end
            dap.listeners.before.event_exited['dapui_config'] = function()
                dapui.close({})
            end
        end,
        dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
        keys = {
            {
                '<leader>du',
                function() require('dapui').toggle({}) end,
                desc = 'Dap UI',
            },
            {
                '<leader>de',
                function() require('dapui').eval() end,
                desc = 'Eval',
                mode = { 'n', 'v' },
            },
        },
        lazy = false,
        opts = {
            render = { max_type_length = 10 },
            controls = { enabled = false },
            layouts = {
                {
                    elements = {
                        {
                            id = 'scopes',
                            size = 0.55,
                        },
                        {
                            id = 'breakpoints',
                            size = 0.15,
                        },
                        {
                            id = 'stacks',
                            size = 0.15,
                        },
                        {
                            id = 'watches',
                            size = 0.15,
                        },
                    },
                    position = 'left',
                    size = 50,
                },
                {
                    elements = {
                        -- {
                        -- 	id = 'repl',
                        -- 	size = 0.5,
                        -- },
                        {
                            id = 'console',
                            size = 1.0,
                        },
                    },
                    position = 'bottom',
                    size = 10,
                },
            },
        },
    },

    -- which key integration
    {
        'folke/which-key.nvim',
        opts = {
            spec = {
                { '<leader>d', group = 'debug' },
            },
        },
    },

    -- virtual text for the debugger
    {
        'theHamsta/nvim-dap-virtual-text',
        dependencies = 'mfussenegger/nvim-dap',
        opts = {},
    },
}
