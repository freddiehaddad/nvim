-- configure feline
local function config(_, opts)
	local colorscheme = vim.g.colors_name
	local palette = require('nightfox.palette').load(colorscheme)
	local feline = require('feline')
	local vi_mode = require('feline.providers.vi_mode')
	local file = require('feline.providers.file')
	local separators = require('feline.defaults').statusline.separators.default_value
	local lsp = require('feline.providers.lsp')

	local theme = {
		fg = palette.fg1,
		bg = palette.bg1,
		black = palette.black.base,
		skyblue = palette.blue.bright,
		cyan = palette.cyan.base,
		green = palette.green.base,
		oceanblue = palette.blue.base,
		magenta = palette.magenta.base,
		orange = palette.orange.base,
		red = palette.red.base,
		violet = palette.magenta.bright,
		white = palette.white.base,
		yellow = palette.yellow.base,
	}

	local c = {
		-- left
		vim_status = {
			provider = function()
				local s
				if require('lazy.status').has_updates() then
					s = require('lazy.status').updates()
				else
					s = ''
				end
				s = string.format(' %s ', s)
				return s
			end,
			hl = { fg = palette.bg0, bg = palette.blue.base },
			right_sep = {
				always_visible = true,
				str = separators.slant_right,
				hl = { fg = palette.blue.base, bg = palette.bg0 },
			},
		},

		file_name = {
			provider = {
				name = 'file_info',
				opts = { colored_icon = false },
			},
			hl = { fg = palette.bg0, bg = palette.white.base },
			left_sep = {
				always_visible = true,
				str = string.format('%s ', separators.slant_right),
				hl = { fg = palette.bg0, bg = palette.white.base },
			},
		},

		git_branch = {
			provider = function()
				local git = require('feline.providers.git')
				local branch, icon = git.git_branch()
				local s
				if #branch > 0 then
					s = string.format(' %s%s ', icon, branch)
				else
					s = string.format(' %s ', 'Untracked')
				end
				return s
			end,
			hl = { fg = palette.bg0, bg = palette.fg3 },
			left_sep = {
				always_visible = true,
				str = string.format('%s%s', separators.block, separators.slant_right),
				hl = { fg = palette.white.base, bg = palette.fg3 },
			},
			right_sep = {
				always_visible = true,
				str = separators.slant_right,
				hl = { fg = palette.fg3, bg = palette.bg0 },
			},
		},

		lsp = {
			provider = function()
				if not lsp.is_lsp_attached() then return ' 󱏎 LSP ' end
				return string.format(' %s ', require('lsp-progress').progress())
			end,
			hl = function()
				if not lsp.is_lsp_attached() then return { fg = palette.bg0, bg = palette.fg3 } end
				return { fg = palette.bg0, bg = palette.green.base }
			end,
			left_sep = {
				always_visible = true,
				str = separators.slant_right,
				hl = function()
					if not lsp.is_lsp_attached() then return { fg = palette.bg0, bg = palette.fg3 } end
					return { fg = palette.bg0, bg = palette.green.base }
				end,
			},
			right_sep = {
				always_visible = true,
				str = separators.slant_right,
				hl = function()
					if not lsp.is_lsp_attached() then return { fg = palette.fg3, bg = 'none' } end
					return { fg = palette.green.base, bg = 'none' }
				end,
			},
		},

		-- right
		vi_mode = {
			provider = function() return string.format(' %s ', vi_mode.get_vim_mode()) end,
			hl = function() return { fg = palette.bg0, bg = vi_mode.get_mode_color() } end,
			left_sep = {
				always_visible = true,
				str = separators.slant_left,
				hl = function() return { fg = vi_mode.get_mode_color(), bg = 'none' } end,
			},
			right_sep = {
				always_visible = true,
				str = separators.slant_left,
				hl = function() return { fg = palette.bg0, bg = vi_mode.get_mode_color() } end,
			},
		},

		macro = {
			provider = function()
				local s
				local recording_register = vim.fn.reg_recording()
				if #recording_register == 0 then
					s = ''
				else
					s = string.format(' Recording @%s ', recording_register)
				end
				return s
			end,
			hl = { fg = palette.bg0, bg = palette.fg3 },
			left_sep = {
				always_visible = true,
				str = separators.slant_left,
				hl = function() return { fg = palette.fg3, bg = palette.bg0 } end,
			},
		},

		search_count = {
			provider = function()
				if vim.v.hlsearch == 0 then return '' end

				local ok, result = pcall(vim.fn.searchcount, { maxcount = 999, timeout = 250 })
				if not ok then return '' end
				if next(result) == nil then return '' end

				local denominator = math.min(result.total, result.maxcount)
				return string.format(' [%d/%d] ', result.current, denominator)
			end,
			hl = { fg = palette.bg0, bg = palette.white.base },
			left_sep = {
				always_visible = true,
				str = separators.slant_left,
				hl = function() return { fg = palette.white.base, bg = palette.fg3 } end,
			},
			right_sep = {
				always_visible = true,
				str = separators.slant_left,
				hl = { fg = palette.bg0, bg = palette.white.base },
			},
		},

		cursor_position = {
			provider = {
				name = 'position',
				opts = { padding = true },
			},
			hl = { fg = palette.bg0, bg = palette.blue.base },
			left_sep = {
				always_visible = true,
				str = string.format('%s%s', separators.slant_left, separators.block),
				hl = function() return { fg = palette.blue.base, bg = palette.bg0 } end,
			},
			right_sep = {
				always_visible = true,
				str = ' ',
				hl = { fg = palette.bg0, bg = palette.blue.base },
			},
		},

		scroll_bar = {
			provider = {
				name = 'scroll_bar',
				opts = { reverse = true },
			},
			hl = { fg = palette.blue.dim, bg = palette.blue.base },
		},

		-- inactive statusline
		in_file_info = {
			provider = function()
				if vim.api.nvim_buf_get_name(0) ~= '' then
					return file.file_info({}, { colored_icon = false })
				else
					return file.file_type({}, { colored_icon = false, case = 'lowercase' })
				end
			end,
			hl = { fg = palette.bg0, bg = palette.blue.base },
			left_sep = {
				always_visible = true,
				str = string.format('%s%s', separators.slant_left, separators.block),
				hl = { fg = palette.blue.base, bg = 'none' },
			},
			right_sep = {
				always_visible = true,
				str = ' ',
				hl = { fg = palette.bg0, bg = palette.blue.base },
			},
		},
	}

	local active = {
		{ -- left
			c.vim_status,
			c.file_name,
			c.git_branch,
			c.lsp,
		},
		{ -- right
			c.vi_mode,
			c.macro,
			c.search_count,
			c.cursor_position,
			c.scroll_bar,
		},
	}

	local inactive = {
		{ -- left
		},
		{ -- right
			c.in_file_info,
		},
	}

	opts.components = { active = active, inactive = inactive }

	feline.setup(opts)
	feline.use_theme(theme)
end

return {
	'freddiehaddad/feline.nvim',
	config = config,
	dependencies = {
		'EdenEast/nightfox.nvim',
		'lewis6991/gitsigns.nvim',
		'nvim-tree/nvim-web-devicons',
		{
			'linrongbin16/lsp-progress.nvim',
			opts = {
				spinner = { '⠋', '⠙', '⠸', '⢰', '⣠', '⣄', '⡆', '⠇' },
				client_format = function(_, spinner, series_messages) return #series_messages > 0 and (spinner .. ' LSP') or ' LSP' end,
				format = function(client_messages)
					local sign = ' LSP'
					if #client_messages > 0 then return table.concat(client_messages) end
					if #vim.lsp.get_clients() > 0 then return sign end
					return '󱏎 LSP'
				end,
			},
		},
	},
	init = function()
		-- update statusbar when there's a plugin update
		vim.api.nvim_create_autocmd('User', {
			pattern = 'LazyCheck',
			callback = function() vim.opt.statusline = vim.opt.statusline end,
		})

		-- update statusbar with LSP progress
		vim.api.nvim_create_augroup('feline_augroup', { clear = true })
		vim.api.nvim_create_autocmd('User', {
			group = 'feline_augroup',
			pattern = 'LspProgressStatusUpdated',
			callback = function() vim.opt.statusline = vim.opt.statusline end,
		})

		-- hide the mode
		vim.opt.showmode = false

		-- hide search count on command line
		vim.opt.shortmess:append({ S = true })
	end,
	opts = {
		force_inactive = { filetypes = { '^dapui_*', '^help$', '^neotest*', '^NvimTree$', '^qf$' } },
		disable = { filetypes = { '^alpha$' } },
	},
}
