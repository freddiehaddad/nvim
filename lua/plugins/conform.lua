return {
	'stevearc/conform.nvim',
	init = function() vim.opt.formatexpr = 'v:lua.require("conform").formatexpr()' end,
	opts = {},
}
