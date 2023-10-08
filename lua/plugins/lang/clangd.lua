--[[
Clang language support requires installing:

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
		opts = function(_, opts) opts.servers.clangd = {} end,
	},

	-- dap
	{
		'mfussenegger/nvim-dap',
		opts = function()
			local dap = require('dap')
			dap.adapters.lldb = {
				type = 'executable',
				command = '/usr/bin/lldb-vscode',
			}
			for _, lang in ipairs({ 'c', 'cpp' }) do
				dap.configurations[lang] = {
					{
						name = 'Launch',
						type = 'lldb',
						request = 'launch',
						program = function() return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file') end,
						cwd = '${workspaceFolder}',
						stopOnEntry = false,
						args = {},
					},
				}
			end
		end,
	},

	-- formatting
	{
		'stevearc/conform.nvim',
		opts = {
			formatters_by_ft = {
				c = { 'clang_format' },
				cpp = { 'clang_format' },
			},
		},
	},
}
