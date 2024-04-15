--[[
Rust language support:

Install via the rustup tool (https://rustup.rs/):

     - curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

LSP
    - rust-analyzer

DAP
    - codelldb

Formatter
    - rustfmt (rustup component add rustfmt)

Unit Testing
    - curl -LsSf https://get.nexte.st/latest/linux | tar zxf - -C ${CARGO_HOME:-~/.cargo}/bin
--]]
return {
	-- lsp
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			'williamboman/mason-lspconfig.nvim',
			opts = function(_, opts) table.insert(opts.ensure_installed, 'rust_analyzer') end,
		},
		opts = function(_, opts) opts.servers.rust_analyzer = {} end,
	},

	-- formatting
	{
		'stevearc/conform.nvim',
		dependencies = {
			'williamboman/mason.nvim',
			opts = function(_, opts) vim.list_extend(opts.ensure_installed, { 'goimports', 'gofumpt' }) end,
		},
		opts = {
			formatters_by_ft = {
				rust = { 'rustfmt' },
			},
		},
	},

	-- dap
	{
		'mfussenegger/nvim-dap',
		dependencies = {
			'williamboman/mason.nvim',
			opts = function(_, opts) table.insert(opts.ensure_installed, 'codelldb') end,
		},
		opts = function()
			local dap = require('dap')
			dap.adapters.codelldb = {
				type = 'server',
				port = '${port}',
				executable = {
					command = 'codelldb',
					args = { '--port', '${port}' },
				},
			}
			dap.configurations.rust = {
				{
					name = 'Launch file',
					type = 'codelldb',
					request = 'launch',
					program = function() return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file') end,
					cwd = '${workspaceFolder}',
					stopOnEntry = false,
					args = {},
				},
				{
					name = 'Attach to process',
					type = 'codelldb',
					request = 'attach',
					pid = require('dap.utils').pick_process,
					cwd = '${workspaceFolder}',
				},
			}
		end,
	},

	-- test
	{
		'rouge8/neotest-rust',
		dependencies = {
			{
				'nvim-neotest/neotest',
				opts = {
					adapters = {
						['neotest-rust'] = {},
					},
				},
			},
		},
	},
}
