--[[
Markdown language support requires installing:

LSP
    - marksman

Formatter
    - mdformat
--]]
return {
	-- lsp
	{
		'neovim/nvim-lspconfig',
		opts = function(_, opts) opts.servers.marksman = {} end,
	},

	-- formatting
	{
		'stevearc/conform.nvim',
		opts = {
			formatters_by_ft = {
				markdown = { 'mdformat' },
			},
		},
	},
}
