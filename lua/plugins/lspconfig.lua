-- perform buffer local configurations for LSP
local function on_attach(ev)
	local function map(mode, lhs, rhs, opts)
		opts = opts or {}
		opts.buffer = ev.buf
		vim.keymap.set(mode, lhs, rhs, opts)
	end
	local client = vim.lsp.get_client_by_id(ev.data.client_id)

	-- configure keymaps defined in lspconfig
	if client.config.keys then
		for _, keymap in ipairs(client.config.keys) do
			map(keymap[1], keymap[2], keymap[3], keymap[4])
		end
	end

	-- vim.api.nvim_create_autocmd('CursorHold', {
	-- 	buffer = ev.buf,
	-- 	callback = function()
	-- 		local opts = {
	-- 			-- open_float
	-- 			scope = 'cursor',
	-- 			source = true,
	-- 			-- open_floating_preview
	-- 			max_width = 60,
	-- 			focusable = false,
	-- 			close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter', 'FocusLost' },
	-- 			-- nvim_open_win
	-- 			border = 'none',
	-- 		}
	-- 		vim.diagnostic.open_float(opts)
	-- 	end,
	-- })

	-- goto
	if client.supports_method('textDocument/implementation') then
		map('n', 'gi', function() require('telescope.builtin').lsp_implementations({ reuse_win = true }) end, { desc = 'Goto implementation' })
	end

	map('n', 'gd', function() require('telescope.builtin').lsp_definitions({ reuse_win = true }) end, { desc = 'Goto definition' })
	map('n', 'gD', function() vim.lsp.buf.declaration() end, { desc = 'Goto declaration' })
	map('n', 'gt', function() require('telescope.builtin').lsp_type_definitions({ reuse_win = true }) end, { desc = 'Goto type' })

	map('n', ']d', function() vim.diagnostic.goto_next({ severity = nil }) end, { desc = 'Next diagnostic' })
	map('n', '[d', function() vim.diagnostic.goto_prev({ severity = nil }) end, { desc = 'Previous diagnostic' })
	map('n', ']e', function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity['ERROR'] }) end, { desc = 'Next error' })
	map('n', '[e', function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity['ERROR'] }) end, { desc = 'Previous error' })
	map('n', ']w', function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity['WARN'] }) end, { desc = 'Next warning' })
	map('n', '[w', function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity['WARN'] }) end, { desc = 'Previous warning' })

	-- search
	map('n', '<leader>sr', function() require('telescope.builtin').lsp_references({ jump_type = 'vsplit' }) end, { desc = 'Search references' })
	map('n', '<leader>ss', function() require('telescope.builtin').lsp_document_symbols() end, { desc = 'Search symbols' })
	map('n', '<leader>sd', function() require('telescope.builtin').diagnostics({ bufnr = 0 }) end, { desc = 'Search diagnostics' })
	map('n', '<leader>sD', function() require('telescope.builtin').diagnostics({ bufnr = nil }) end, { desc = 'Search diagnostics (all buffers)' })

	if client.supports_method('callHierarchy/incomingCalls') then map('n', '<leader>sc', function() require('telescope.builtin').lsp_incoming_calls() end, { desc = 'Search incoming calls' }) end
	if client.supports_method('callHierarchy/outgoingCalls') then map('n', '<leader>sC', function() require('telescope.builtin').lsp_outgoing_calls() end, { desc = 'Search outgoing calls' }) end

	-- edits
	map('n', '<leader>cr', function() vim.lsp.buf.rename() end, { desc = 'Rename' })
	map({ 'n', 'v' }, '<leader>ca', function() vim.lsp.buf.code_action() end, { desc = 'Code action' })
	map('n', '<leader>cA', function() vim.lsp.buf.code_action({ context = { only = { 'source' }, diagnostics = {} } }) end, { desc = 'Source action' })
	map('n', '<leader>cf', function() require('conform').format() end, { desc = 'Format' })
	map('v', '<leader>cf', function() require('conform').format() end, { desc = 'Format selection' })

	-- help
	map('n', 'K', function() vim.lsp.buf.hover() end, { desc = 'Hover information' })
	map('n', 'gK', function() vim.lsp.buf.signature_help() end, { desc = 'Signature help' })
	map('i', '<c-k>', function() vim.lsp.buf.signature_help() end, { desc = 'Signature help' })
	vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

	-- which-key
	local mappings = {
		['<leader>c'] = { name = '+code' },
	}
	local options = {
		mode = { 'n', 'v' },
		buffer = ev.buf,
	}
	local wk = require('which-key')
	wk.register(mappings, options)
end

return {
	'neovim/nvim-lspconfig',
	config = function(_, opts)
		local lspconfig = require('lspconfig')
		for server, config in pairs(opts.servers) do
			lspconfig[server].setup(config)
		end
	end,
	dependencies = {
		'williamboman/mason-lspconfig.nvim',
		dependencies = {
			'williamboman/mason.nvim',
			config = function(_, opts)
				require('mason').setup(opts)
				local mr = require('mason-registry')
				local function ensure_installed()
					for _, tool in ipairs(opts.ensure_installed) do
						local p = mr.get_package(tool)
						if not p:is_installed() then p:install() end
					end
				end
				if mr.refresh then
					mr.refresh(ensure_installed)
				else
					ensure_installed()
				end
			end,
			opts = { ensure_installed = {}, max_concurrent_installers = #vim.loop.cpu_info(), pip = { upgrade_pip = true } },
			build = ':MasonUpdate',
		},
		opts = { ensure_installed = {} },
	},
	init = function()
		vim.api.nvim_create_autocmd('LspAttach', {
			group = vim.api.nvim_create_augroup('LspConfig', {}),
			callback = on_attach,
		})

		-- update lsp floating window settings
		-- local max_width = 80
		vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {}) --, { max_width = max_width })
		vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {}) --, { max_width = max_width })

		-- cursorhold
		vim.opt.updatetime = 250

		-- diagnostics
		vim.diagnostic.config({
			update_in_insert = false,
			virtual_text = false,
		})
	end,
	opts = {
		servers = {},
	},
}
