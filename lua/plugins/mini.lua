return {
	-- add ui animations
	{
		'echasnovski/mini.animate',
		opts = { cursor = { enable = false } },
	},

	-- allow deleting buffers
	{
		'echasnovski/mini.bufremove',
		keys = {
			{ '<leader>bd', function() require('mini.bufremove').delete(0, false) end, desc = 'Delete Buffer' },
			{ '<leader>bD', function() require('mini.bufremove').delete(0, true) end, desc = 'Delete Buffer (Force)' },
		},
		opts = {},
	},

	-- code commenting
	{
		'echasnovski/mini.comment',
		opts = {},
	},

	-- code movement
	{
		'echasnovski/mini.move',
		opts = {},
	},

	-- which key integration
	{
		'folke/which-key.nvim',
		opts = {
			defaults = {
				['<leader>b'] = { name = '+buffer' },
			},
		},
	},
}
