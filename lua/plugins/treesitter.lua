return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	init = function()
		vim.opt.foldenable = false
		vim.opt.foldmethod = 'expr'
		-- enable for nvim 0.10
		-- vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
		vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
	end,
	main = 'nvim-treesitter.configs',
	opts = {
		auto_install = true,
		highlight = {
			enable = true,
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = '<c-i>',
				node_incremental = '<c-i>',
				scope_incremental = false,
				node_decremental = '<bs>',
			},
		},
		indent = {
			enable = true,
		},
	},
}
