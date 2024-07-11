--[[
Clang language support:

* Generate project compile_commands.json with (i.e. pacman -S --needed bear):

    bear -- <your-build-command>

LSP
    - clangd

DAP
    - codelldb

* GDB 14 will support DAP

Formatter
    - clang-format
--]]
return {
	-- lsp
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			'williamboman/mason-lspconfig.nvim',
			opts = function(_, opts) table.insert(opts.ensure_installed, 'clangd') end,
		},
		opts = function(_, opts)
			opts.servers.clangd = {
				keys = {
					-- see: https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/clangd.lua
					{ 'n', 'gs', '<cmd>ClangdSwitchSourceHeader<cr>', { desc = 'Switch between source/header' } },
				},
				-- root_dir = function(fname)
				-- 	return require('lspconfig.util').root_pattern('Makefile', 'configure.ac', 'configure.in', 'config.h.in', 'meson.build', 'meson_options.txt', 'build.ninja')(
				-- 		fname
				-- 	) or require('lspconfig.util').root_pattern('compile_commands.json', 'compile_flags.txt')(fname) or require('lspconfig.util').find_git_ancestor(fname)
				-- end,
				-- capabilities = {
				-- 	offsetEncoding = { 'utf-16' },
				-- },
				-- cmd = {
				-- 	'clangd',
				-- 	'--background-index',
				-- 	'--clang-tidy',
				-- 	'--header-insertion=iwyu',
				-- 	'--completion-style=detailed',
				-- 	'--function-arg-placeholders',
				-- 	'--fallback-style=llvm',
				-- },
				-- init_options = {
				-- 	usePlaceholders = true,
				-- 	completeUnimported = true,
				-- 	clangdFileStatus = true,
				-- },
			}
		end,
	},

	-- code navigation
	-- {
	-- 	'p00f/clangd_extensions.nvim',
	-- 	lazy = true,
	-- 	config = function() end,
	-- 	opts = {
	-- 		ast = {
	-- 			--These require codicons (https://github.com/microsoft/vscode-codicons)
	-- 			role_icons = {
	-- 				type = '',
	-- 				declaration = '',
	-- 				expression = '',
	-- 				specifier = '',
	-- 				statement = '',
	-- 				['template argument'] = '',
	-- 			},
	--
	-- 			kind_icons = {
	-- 				Compound = '',
	-- 				Recovery = '',
	-- 				TranslationUnit = '',
	-- 				PackExpansion = '',
	-- 				TemplateTypeParm = '',
	-- 				TemplateTemplateParm = '',
	-- 				TemplateParamObject = '',
	-- 			},
	-- 		},
	-- 	},
	-- },

	-- dap
	{
		'mfussenegger/nvim-dap',
		dependencies = {
			'williamboman/mason.nvim',
			opts = function(_, opts) table.insert(opts.ensure_installed, 'codelldb') end,
		},
		opts = function()
			local dap = require('dap')
			dap.adapters.codelldb = {
				type = 'server',
				port = '${port}',
				executable = {
					command = 'codelldb',
					args = { '--port', '${port}' },
				},
			}
			if vim.uv.os_uname().sysname:find('Windows') then dap.adapters.codelldb.executable.command = dap.adapters.codelldb.executable.command .. '.cmd' end
			dap.configurations.cpp = {
				{
					name = 'Launch file',
					type = 'codelldb',
					request = 'launch',
					program = function() return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file') end,
					cwd = '${workspaceFolder}',
					stopOnEntry = false,
					args = {},
				},
				{
					name = 'Attach to process',
					type = 'codelldb',
					request = 'attach',
					pid = require('dap.utils').pick_process,
					cwd = '${workspaceFolder}',
				},
			}
			dap.configurations.c = dap.configurations.cpp
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
