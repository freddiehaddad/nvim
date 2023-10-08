return {
	'EdenEast/nightfox.nvim',
	init = function() vim.cmd.colorscheme('nightfox') end,
	opts = {
		options = {
			transparent = true,
		},
		palettes = {
			nightfox = {
				bg0 = '#090c11',
				bg1 = '#121821',
			},
		},
		groups = {
			nightfox = {
				StatusLine = { bg = 'none' },
				StatusLineNC = { bg = 'none' },
			},
		},
	},
	priority = 100,
}
