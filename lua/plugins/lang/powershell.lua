--[[
Powershell language support:

LSP
	- powershell_es
--]]
return {
	-- lsp
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			'williamboman/mason-lspconfig.nvim',
			opts = function(_, opts) table.insert(opts.ensure_installed, 'powershell_es') end,
		},
		opts = function(_, opts)
			opts.servers.powershell_es = {
				bundle_path = vim.fn.stdpath('data') .. '/mason/packages/powershell-editor-services',
			}
		end,
	},
}
