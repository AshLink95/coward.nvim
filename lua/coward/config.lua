local M = {}

M.options = {
    max_items = 10,
}

function M.setup(opts)
    M.options = vim.tbl_extend("force", M.options, opts or {})
end

return M
