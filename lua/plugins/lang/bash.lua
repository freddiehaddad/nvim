--[[
BASH language support requires installing:

LSP
    - bash-language-server
    - shellcheck (optional)

Formatter
    - shfmt
--]]
return {
	--lsp
	{
		'neovim/nvim-lspconfig',
		opts = {
			servers = {
				bashls = {},
			},
		},
	},

	-- formatting
	{
		'stevearc/conform.nvim',
		opts = {
			formatters_by_ft = {
				sh = { 'shfmt' },
			},
		},
	},
}
