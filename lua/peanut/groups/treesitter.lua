local M = {}

function M.highlight(palette, opts)
    return {
		["@keyword"] = { link = "Keyword" },
		["@variable"] = { link = "Variable" },
		["@variable.parameter"] = { link = "Label" },
    }
end

return M
