return {
	'nvim-neotest/neotest',
	config = function(_, opts)
		-- get neotest namespace (api call creates or returns namespace)
		local neotest_ns = vim.api.nvim_create_namespace('neotest')
		vim.diagnostic.config({
			virtual_text = {
				format = function(diagnostic)
					local message = diagnostic.message:gsub('\n', ' '):gsub('\t', ' '):gsub('%s+', ' '):gsub('^%s+', '')
					return message
				end,
			},
		}, neotest_ns)

		local adapters = {}
		for name, config in pairs(opts.adapters or {}) do
			local adapter = require(name)
			adapter(config)
			table.insert(adapters, adapter)
		end

		opts.adapters = adapters

		require('neotest').setup(opts)
	end,
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-treesitter/nvim-treesitter',
	},
	keys = {
		{ '<leader>tt', function() require('neotest').run.run(vim.fn.expand('%')) end, desc = 'Run File' },
		{ '<leader>tT', function() require('neotest').run.run(vim.loop.cwd()) end, desc = 'Run All Test Files' },
		{ '<leader>tr', function() require('neotest').run.run() end, desc = 'Run Nearest' },
		{ '<leader>ts', function() require('neotest').summary.toggle() end, desc = 'Toggle Summary' },
		---@diagnostic disable-next-line: missing-fields
		{ '<leader>to', function() require('neotest').output.open({ enter = true, auto_close = true }) end, desc = 'Show Output' },
		{ '<leader>tO', function() require('neotest').output_panel.toggle() end, desc = 'Toggle Output Panel' },
		{ '<leader>tS', function() require('neotest').run.stop() end, desc = 'Stop' },
	},
	opts = {
		status = { virtual_text = false },
		output = { open_on_run = true },
		quickfix = { open = function() vim.cmd('copen') end },
		floating = {
			border = 'single',
		},
		icons = {
			expanded = '┐',
			final_child_prefix = '└',
		},
	},
}
