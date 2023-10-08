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
		},
		opts = function(_, opts) opts.servers.lua_ls = { settings = { Lua = { workspace = { checkThirdParty = false } } } } end,
	},

	-- formatting
	{
		'stevearc/conform.nvim',
		opts = {
			formatters_by_ft = {
				lua = { 'stylua' },
			},
		},
	},
}
