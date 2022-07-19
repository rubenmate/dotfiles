return {
    -- VSC*** style of snippets
    parse("lf", "local $1 = function($2)\n\t$0\nend"),

    -- Luasnip style of snippets
    s("req", fmt("local {} = require('{}')", { i(1, "default"), rep(1) })),
    s(
        "pcal",
        fmt(
            "local {}, {} = pcall(require, '{}')\nif not {} then\n    return\nend",
            { i(1, "status_ok"), i(2, "default"), rep(2), rep(1) }
        )
    ),
}
