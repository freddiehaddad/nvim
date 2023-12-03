--[[
Lua language support requires installing:

LSP
    - lua-language-server

Formatter
    - stylua
--]]
return {
	-- lsp
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			{ 'folke/neodev.nvim', opts = {} },
			{
				'williamboman/mason-lspconfig.nvim',
				opts = function(_, opts) table.insert(opts.ensure_installed, 'lua_ls') end,
			},
		},
		opts = function(_, opts) opts.servers.lua_ls = { settings = { Lua = { workspace = { checkThirdParty = false } } } } end,
	},

	-- formatting
	{
		'stevearc/conform.nvim',
		dependencies = {
			'williamboman/mason.nvim',
			opts = function(_, opts) table.insert(opts.ensure_installed, 'stylua') end,
		},
		opts = {
			formatters_by_ft = {
				lua = { 'stylua' },
			},
		},
	},
}
