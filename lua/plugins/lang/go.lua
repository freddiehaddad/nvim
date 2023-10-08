--[[
Go language support requires installing:

LSP
    - gopls

DAP
    - delve

Formatter
    - goimports (installed with go-tools)
--]]
return {
	-- lsp
	{
		'neovim/nvim-lspconfig',
		opts = function(_, opts)
			opts.servers.gopls = {
				settings = {
					gopls = {
						gofumpt = true,
						codelenses = {
							gc_details = false,
							generate = true,
							regenerate_cgo = true,
							run_govulncheck = true,
							test = true,
							tidy = true,
							upgrade_dependency = true,
							vendor = true,
						},
						hints = {
							assignVariableTypes = true,
							compositeLiteralFields = true,
							compositeLiteralTypes = true,
							constantValues = true,
							functionTypeParameters = true,
							parameterNames = true,
							rangeVariableTypes = true,
						},
						analyses = {
							fieldalignment = true,
							nilness = true,
							unusedparams = true,
							unusedwrite = true,
							useany = true,
						},
						usePlaceholders = true,
						completeUnimported = true,
						staticcheck = true,
						directoryFilters = { '-.git' },
						semanticTokens = true,
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
				go = { 'goimports' },
			},
		},
	},

	-- dap
	{
		'leoluz/nvim-dap-go',
		dependencies = 'mfussenegger/nvim-dap',
		opts = {},
	},

	-- test
	{
		'nvim-neotest/neotest-go',
		dependencies = {
			{
				'nvim-neotest/neotest',
				opts = {
					adapters = {
						['neotest-go'] = {},
					},
				},
			},
		},
	},
}
