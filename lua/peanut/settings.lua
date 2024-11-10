local M = {}

local DEFAULT = {
    styles = {
        comments = {},
        functions = {},
        keywords = {},
        lsp = { underline = true },
        match_paren = {},
        type = { bold = true },
        variables = {},
    },
}

M.opts = {}

function M.set(opts) M.opts = vim.tbl_deep_extend('force', DEFAULT, opts or {}) end

M.set()

return M
