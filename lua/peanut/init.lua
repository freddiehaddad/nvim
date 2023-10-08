local M = {}

function M.setup(opts)
    local settings = require("peanut.settings")
    if opts then
        settings.set(opts)
    end
end

function M.load()
    local settings = require("peanut.settings")
    local opts = settings.opts

    vim.api.nvim_command("hi clear")
    if vim.fn.exists("syntax_on") then
        vim.api.nvim_command("syntax reset")
    end

    vim.o.background = "dark"
    vim.o.termguicolors = true
    vim.g.colors_name = "peanut"

    local util = require("peanut.util")
    local palette = require("peanut.palette")
    local groups = require("peanut.groups")

    for _, group in ipairs(groups) do
        group = group.highlight(palette, opts)
        util.initialize(group)
    end
end

return M
