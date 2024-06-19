return {
	'EdenEast/nightfox.nvim',
	init = function() vim.cmd.colorscheme('nightfox') end,
	opts = {
		options = {
			transparent = true,
			styles = {
				-- foot.ini:
				-- font=IosevkaTerm Nerd Font Mono:weight=regular:size=12
				-- font-bold=IosevkaTerm Nerd Font Mono:weight=medium:size=12
				-- font-italic=IosevkaTerm Nerd Font Mono:weight=bold:size=12
				-- font-bold-italic=IosevkaTerm Nerd Font Mono:weight=black:size=12
				comments = 'NONE',
				conditionals = 'NONE',
				constants = 'bold',
				functions = 'NONE',
				keywords = 'bold',
				numbers = 'bold',
				operators = 'NONE',
				strings = 'NONE',
				types = 'NONE',
				variables = 'NONE',
			},
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
