--[[
JSON language support requires installing:

LSP
    - vscode-json-languageserver

Formatter
    - prettier
--]]
return {
	-- schema support
	{
		'b0o/SchemaStore.nvim',
	},

	-- lsp
	{
		-- lsp
		'neovim/nvim-lspconfig',
		opts = function(_, opts)
			opts.servers.jsonls = {
				settings = {
					json = {
						schemas = require('schemastore').json.schemas(),
						validate = { enable = true },
					},
				},
			}
		end,
	},

	-- formatting
	{
		'stevearc/conform.nvim',
		opts = {
			formatters_by_ft = {
				json = { 'prettier' },
			},
		},
	},
}
