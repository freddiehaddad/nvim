-- perform buffer local configurations for LSP
local function on_attach(ev)
	local function map(mode, lhs, rhs, opts)
		opts = opts or {}
		opts.buffer = ev.buf
		vim.keymap.set(mode, lhs, rhs, opts)
	end
	local client = vim.lsp.get_client_by_id(ev.data.client_id)

	-- goto
	if client.supports_method('textDocument/implementation') then
		map('n', 'gi', function() require('telescope.builtin').lsp_implementations({ jump_type = 'vsplit', reuse_win = true }) end, { desc = 'Goto implementation' })
	end

	map('n', 'gd', function() require('telescope.builtin').lsp_definitions({ jump_type = 'vsplit', reuse_win = true }) end, { desc = 'Goto definition' })
	map('n', 'gD', function() vim.lsp.buf.declaration() end, { desc = 'Goto declaration' })
	map('n', 'gt', function() require('telescope.builtin').lsp_type_definitions({ jump_type = 'vsplit', reuse_win = true }) end, { desc = 'Goto type' })

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
	map('v', '<leader>cF', function() require('conform').format() end, { desc = 'Format selection' })

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
	init = function()
		vim.api.nvim_create_autocmd('LspAttach', {
			group = vim.api.nvim_create_augroup('LspConfig', {}),
			callback = on_attach,
		})

		-- update lsp floating window settings
		local max_width = 80
		vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { max_width = max_width })
		vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { max_width = max_width })
	end,
	opts = {
		servers = {},
	},
}
