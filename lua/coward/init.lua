local dictionary = {}

local plugin_path = vim.fn.fnamemodify(debug.getinfo(1).source:sub(2), ":h:h:h")
package.cpath = package.cpath..";"..plugin_path.."/target/release/?.so"
local coward = require('libcoward')
local config = require('coward.config')

function dictionary:new()
  return setmetatable({}, { __index = dictionary })
end

function dictionary:complete(params, callback)
    local input = string.sub(params.context.cursor_before_line, params.offset)

    local words = coward.complete(input)

    local items = {}
    for i, word in ipairs(words) do
        if i > config.options.max_items then break end
        table.insert(items, {
            label = word,
        })
    end

    callback({ items = items })
end

require("cmp").register_source("coward", dictionary:new())

return { dictionary = dictionary, setup = config.setup }
