--[[
Clang language support requires installing:

* Must be installed on your system (i.e. pacman -S --needed clang llvm lldb)

LSP
    - clangd

DAP
    - lldb

Formatter
    - clang-format
--]]
return {
	-- lsp
	{
		'neovim/nvim-lspconfig',
		opts = function(_, opts)
			opts.servers.clangd = {
				root_dir = function(fname)
					return require('lspconfig.util').root_pattern('Makefile', 'configure.ac', 'configure.in', 'config.h.in', 'meson.build', 'meson_options.txt', 'build.ninja')(
						fname
					) or require('lspconfig.util').root_pattern('compile_commands.json', 'compile_flags.txt')(fname) or require('lspconfig.util').find_git_ancestor(fname)
				end,
				capabilities = {
					offsetEncoding = { 'utf-16' },
				},
				cmd = {
					'clangd',
					'--background-index',
					'--clang-tidy',
					'--header-insertion=iwyu',
					'--completion-style=detailed',
					'--function-arg-placeholders',
					'--fallback-style=llvm',
				},
				init_options = {
					usePlaceholders = true,
					completeUnimported = true,
					clangdFileStatus = true,
				},
			}
		end,
	},

	-- dap
	{
		'mfussenegger/nvim-dap',
		opts = function()
			local dap = require('dap')
			dap.adapters.lldb = {
				type = 'executable',
				command = '/usr/bin/lldb-vscode',
				name = 'lldb',
			}
			dap.configurations.cpp = {
				{
					name = 'Launch file',
					type = 'lldb',
					request = 'launch',
					program = function() return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file') end,
					cwd = '${workspaceFolder}',
					stopOnEntry = false,
					args = {},
				},
				{
					name = 'Attach to process',
					type = 'lldb',
					request = 'attach',
					processId = require('dap.utils').pick_process,
					cwd = '${workspaceFolder}',
				},
			}
		end,
	},

	-- formatting
	{
		'stevearc/conform.nvim',
		dependencies = {
			'williamboman/mason.nvim',
			opts = function(_, opts) table.insert(opts.ensure_installed, 'clang-format') end,
		},
		opts = {
			formatters_by_ft = {
				c = { 'clang_format' },
				cpp = { 'clang_format' },
			},
		},
	},
}
