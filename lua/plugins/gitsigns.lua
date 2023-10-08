-- perform buffer local configurations for Git
local function on_attach(buffer)
	local function map(mode, lhs, rhs, opts)
		opts = opts or {}
		opts.buffer = buffer
		vim.keymap.set(mode, lhs, rhs, opts)
	end

	-- navigation
	map('n', ']h', function() require('gitsigns').next_hunk() end, { desc = 'Next hunk' })
	map('n', '[h', function() require('gitsigns').prev_hunk() end, { desc = 'Previous hunk' })

	-- actions
	map('n', '<leader>hs', require('gitsigns').stage_hunk, { desc = 'Stage hunk' })
	map('n', '<leader>hr', require('gitsigns').reset_hunk, { desc = 'Reset hunk' })
	map('v', '<leader>hs', function() require('gitsigns').stage_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end, { desc = 'Stage hunk (selected)' })
	map('v', '<leader>hr', function() require('gitsigns').reset_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end, { desc = 'Reset hunk (selected)' })
	map('n', '<leader>hS', require('gitsigns').stage_buffer, { desc = 'Stage buffer' })
	map('n', '<leader>hu', require('gitsigns').undo_stage_hunk, { desc = 'Undo stage hunk' })
	map('n', '<leader>hR', require('gitsigns').reset_buffer, { desc = 'Reset buffer' })
	map('n', '<leader>hp', require('gitsigns').preview_hunk, { desc = 'Preview hunk' })
	map('n', '<leader>hb', function() require('gitsigns').blame_line({ full = true }) end, { desc = 'Blame line' })
	map('n', '<leader>tb', require('gitsigns').toggle_current_line_blame, { desc = 'Toggle Git blame line' })
	map('n', '<leader>hd', require('gitsigns').diffthis, { desc = 'Git diff' })
	map('n', '<leader>hD', function() require('gitsigns').diffthis('~') end, { desc = 'Git diff (HEAD)' })
	map('n', '<leader>td', require('gitsigns').toggle_deleted, { desc = 'Toggle Git deleted' })

	-- text object
	map({ 'o', 'x' }, 'ih', '<cmd><c-u>Gitsigns select_hunk<cr>', { desc = 'Select Git hunk' })

	-- telescope git pickers
	map('n', '<leader>gc', function() require('telescope.builtin').git_bcommits() end, { desc = 'Git commits (current buffer)' })
	map('n', '<leader>gC', function() require('telescope.builtin').git_commits() end, { desc = 'Git commits (current directory)' })
	map('v', '<leader>gC', function() require('telescope.builtin').git_bommits_range() end, { desc = 'Git commits (range)' })
	map('n', '<leader>gb', function() require('telescope.builtin').git_branches() end, { desc = 'Git branches' })
	map('n', '<leader>gs', function() require('telescope.builtin').git_status() end, { desc = 'Git status' })
	map('n', '<leader>gS', function() require('telescope.builtin').git_stash() end, { desc = 'Git stash' })

	-- which-key
	local mappings = {
		['<leader>g'] = { name = '+git' },
		['<leader>h'] = { name = '+hunks' },
		['<leader>t'] = { name = '+toggle' },
	}
	local options = {
		mode = { 'n', 'v' },
		buffer = buffer,
	}
	local wk = require('which-key')
	wk.register(mappings, options)
end

return {
	'lewis6991/gitsigns.nvim',
	opts = {
		on_attach = on_attach,
	},
}
