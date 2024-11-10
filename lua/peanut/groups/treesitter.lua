local M = {}

function M.highlight(palette, opts)
    return {
        ['@annotation'] = { fg = palette.gray },
        ['@attribute'] = { fg = palette.gray },
        ['@boolean'] = { fg = palette.gray },
        ['@character'] = { fg = palette.gray },
        ['@comment'] = { link = 'Comment' },
        ['@comment.documentation'] = { fg = palette.gray },
        ['@comment.error'] = { fg = palette.gray },
        ['@comment.note'] = { fg = palette.gray },
        ['@comment.todo'] = { fg = palette.gray },
        ['@comment.warning'] = { fg = palette.gray },
        ['@const.builtin'] = { fg = palette.gray },
        ['@const.macro'] = { fg = palette.gray },
        ['@constant'] = { fg = palette.gray },
        ['@constructor'] = { fg = palette.gray },
        ['@diff.delta'] = { fg = palette.gray, bg = palette.none, bold = true },
        ['@error'] = { fg = palette.gray },
        ['@function'] = vim.tbl_extend(
            'force',
            { fg = palette.gray },
            opts.styles.functions
        ),
        ['@function.builtin'] = { fg = palette.gray },
        ['@function.macro'] = { fg = palette.gray },
        ['@function.method'] = { fg = palette.gray },
        ['@function.method.call'] = { fg = palette.gray },
        ['@keyword'] = vim.tbl_extend(
            'force',
            { fg = palette.gray },
            opts.styles.keywords
        ),
        ['@keyword.conditional'] = { fg = palette.gray },
        ['@keyword.coroutine'] = { fg = palette.gray },
        ['@keyword.exception'] = { fg = palette.gray },
        ['@keyword.function'] = vim.tbl_extend(
            'force',
            { fg = palette.gray },
            opts.styles.keywords
        ),
        ['@keyword.import'] = { fg = palette.gray },
        ['@keyword.operator'] = { fg = palette.gray },
        ['@keyword.repeat'] = { fg = palette.gray },
        ['@label'] = { fg = palette.gray },
        ['@lsp.type.comment'] = {},
        ['@markup'] = { fg = palette.gray },
        ['@markup.italic'] = { italic = true },
        ['@markup.link'] = { fg = palette.gray },
        ['@markup.list'] = { fg = palette.gray },
        ['@markup.list.unchecked'] = { fg = palette.gray },
        ['@markup.literal'] = { fg = palette.gray },
        ['@markup.strong'] = { fg = palette.gray },
        ['@markup.title'] = { fg = palette.gray },
        ['@markup.underline'] = { underline = true },
        ['@module'] = { fg = palette.gray },
        ['@number'] = { fg = palette.gray },
        ['@number.float'] = { fg = palette.gray },
        ['@operator'] = { fg = palette.gray },
        ['@property'] = { fg = palette.gray },
        ['@punctuation.bracket'] = { fg = palette.gray },
        ['@punctuation.delimiter'] = { fg = palette.gray },
        ['@string'] = { fg = palette.gray },
        ['@string.escape'] = { fg = palette.gray },
        ['@string.regexp'] = { fg = palette.gray },
        ['@string.special.path'] = { fg = palette.gray },
        ['@string.special.symbol'] = { fg = palette.gray },
        ['@tag'] = { fg = palette.gray },
        ['@tag.attribute'] = { fg = palette.gray },
        ['@tag.delimiter'] = { fg = palette.gray },
        ['@text.uri'] = { fg = palette.gray },
        ['@type'] = vim.tbl_extend(
            'force',
            { fg = palette.gray },
            opts.styles.type
        ),
        ['@type.builtin'] = { fg = palette.gray },
        ['@variable'] = vim.tbl_extend(
            'force',
            { fg = palette.gray },
            opts.styles.variables
        ),
        ['@variable.builtin'] = { fg = palette.gray },
        ['@variable.field'] = { fg = palette.gray },
        ['@variable.parameter'] = { fg = palette.gray },
        ['@variable.parameter.reference'] = { fg = palette.gray },
        -- C++
        ['@lsp.type.class.cpp'] = { fg = palette.gray },
        ['@lsp.type.namespace.cpp'] = { fg = palette.gray },
        ['@lsp.type.operator.cpp'] = { fg = palette.gray },
        ['@type.builtin.cpp'] = { fg = palette.gray },
    }
end

return M
