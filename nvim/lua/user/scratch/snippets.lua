local luasnip = require "luasnip"

-- Snippet creator
-- s(<trigger>, <nodes>)
local s = luasnip.s

-- Format node
-- It takes a format string and a list of nodes
-- fmt(<fmt_string>, {...nodes})
local fmt = require("luasnip.extras.fmt").fmt

-- This is an insert node
-- It takes a position (like $1) and optionally some default text
-- i(<position>, [default_text])
local i = luasnip.insert_node

-- Repeats a node
-- rep(<position>)
local rep = require("luasnip.extras").rep

luasnip.snippets {
    all = {
        luasnip.parser.parse_snippet("expand", "-- This is what is going to be expanded"),
    },
    lua = {
        -- Lua specific snippets here
        s("req", fmt("local {} = require('{}')", { i(1, "default"), rep(1) })),
    },
}
