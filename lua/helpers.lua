---@diagnostic disable: undefined-global

local M = {}

--- Set a keymap in the given mode(s) with a description.
--- Defaults to normal mode if `mode` is not provided.
---@param keys string The key sequence to map.
---@param func string|function The command string or Lua function to execute.
---@param desc string A short description shown in which-key / fzf-lua keymaps.
---@param mode? string|string[] Vim mode(s) for the mapping. Defaults to `"n"`.
M.map = function(keys, func, desc, mode)
    mode = mode or "n"
    vim.keymap.set(mode, keys, func, { desc = desc })
end

--- Set a buffer-local keymap in the given mode(s) with a description.
--- Defaults to normal mode if `mode` is not provided.
---@param keys string The key sequence to map.
---@param func string|function The command string or Lua function to execute.
---@param desc string A short description shown in which-key / fzf-lua keymaps.
---@param bufnr integer Buffer number to scope the mapping to.
---@param mode? string|string[] Vim mode(s) for the mapping. Defaults to `"n"`.
M.bmap = function(keys, func, desc, bufnr, mode)
    mode = mode or "n"
    vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = desc })
end

return M
