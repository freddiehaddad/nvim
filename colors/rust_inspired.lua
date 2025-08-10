-- Colorscheme entry point. Neovim loads this when you run :colorscheme rust_inspired
pcall(require, 'rust_inspired')
if package.loaded['rust_inspired'] and require('rust_inspired').load then
  require('rust_inspired').load()
else
  vim.notify('[rust_inspired] Theme module not found', vim.log.levels.WARN)
end
