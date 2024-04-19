return {
	-- auto completion
	{
		'hrsh7th/nvim-cmp',
		version = false, -- last release is way too old
		event = 'InsertEnter',
		dependencies = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
		},
		opts = function()
			vim.api.nvim_set_hl(0, 'CmpGhostText', { link = 'Comment', default = true })
			local cmp = require('cmp')
			local defaults = require('cmp.config.default')()
			return {
				auto_brackets = {}, -- configure any filetype to auto add brackets
				completion = {
					completeopt = 'menu,menuone,noinsert',
				},
				mapping = cmp.mapping.preset.insert({
					['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
					['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.abort(),
					-- Accept currently selected item.
					-- Set `select` to `false` to only confirm explicitly selected items.
					['<CR>'] = cmp.mapping.confirm({ select = true }),
					['<S-CR>'] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}),
					['<C-CR>'] = function(fallback)
						cmp.abort()
						fallback()
					end,
				}),
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
					{ name = 'path' },
				}, {
					{ name = 'buffer' },
				}),
				experimental = {
					ghost_text = {
						hl_group = 'CmpGhostText',
					},
				},
				sorting = defaults.sorting,
			}
		end,
		config = function(_, opts)
			for _, source in ipairs(opts.sources) do
				source.group_index = source.group_index or 1
			end
			local cmp = require('cmp')
			local Kind = cmp.lsp.CompletionItemKind
			cmp.setup(opts)
			cmp.event:on('confirm_done', function(event)
				if not vim.tbl_contains(opts.auto_brackets or {}, vim.bo.filetype) then return end
				local entry = event.entry
				local item = entry:get_completion_item()
				if vim.tbl_contains({ Kind.Function, Kind.Method }, item.kind) then
					local keys = vim.api.nvim_replace_termcodes('()<left>', false, false, true)
					vim.api.nvim_feedkeys(keys, 'i', true)
				end
			end)
		end,
	},

	-- snippets
	{
		'L3MON4D3/LuaSnip',
		dependencies = {
			{
				'rafamadriz/friendly-snippets',
				config = function() require('luasnip.loaders.from_vscode').lazy_load() end,
			},
			{
				'nvim-cmp',
				dependencies = {
					'saadparwaiz1/cmp_luasnip',
				},
				opts = function(_, opts)
					opts.snippet = {
						expand = function(args) require('luasnip').lsp_expand(args.body) end,
					}
					table.insert(opts.sources, { name = 'luasnip' })
				end,
			},
		},
		opts = {
			history = true,
			delete_check_events = 'InsertLeave',
			region_check_events = 'InsertEnter',
		},
		keys = {
			{
				'<tab>',
				function() return require('luasnip').jumpable(1) and '<Plug>luasnip-jump-next' or '<tab>' end,
				expr = true,
				silent = true,
				mode = 'i',
			},
			{ '<tab>', function() require('luasnip').jump(1) end, mode = 's' },
			{ '<s-tab>', function() require('luasnip').jump(-1) end, mode = { 'i', 's' } },
		},
	},
}
