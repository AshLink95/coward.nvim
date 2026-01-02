if vim.g.loaded_coward then
    return
end
vim.g.loaded_coward = true

local ok, coward = pcall(require, 'coward')
if ok then
    -- setup template
    coward.setup({
        -- max_items = 10
    })
end
