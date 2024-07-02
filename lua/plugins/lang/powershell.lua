--[[
Powershell language support:

LSP
	- powershell_es

NOTE: There's a bug with nvim-dap-virtual-text and powershell.  No treesitter
      parser exists and the plugin attempts to install it.  The workaround is
      disabling the plugin when debugging powershell.
--]]
return {
	{
		'TheLeoP/powershell.nvim',
		dependencies = {
			{
				'neovim/nvim-lspconfig',
				dependencies = {
					'williamboman/mason-lspconfig.nvim',
					opts = function(_, opts) table.insert(opts.ensure_installed, 'powershell_es') end,
				},
			},
			{
				'mfussenegger/nvim-dap',
			},
		},
		opts = {
			bundle_path = vim.fn.stdpath('data') .. '/mason/packages/powershell-editor-services',
		},
	},
}
