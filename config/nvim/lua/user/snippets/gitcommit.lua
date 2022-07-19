-- Opts table to not expand again the same snippet
local isNested = false
local opts = {
    condition = function()
        if isNested == true then
            return false
        end
        return true
    end,
    callbacks = {
        [1] = {
            [events.enter] = function(node, _event_args)
                isNested = true
            end,
            [events.leave] = function(node, _event_args)
                isNested = false
            end,
        },
    },
}

return {
    -- Feature commit
    s(
        { trig = "feat", name = "feature", dscr = "add new feature" },
        fmt("feat{}: {}", { c(1, { t "", fmt("({})", i(1, "scope")) }), i(2) }),
        opts
    ),
    s(
        { trig = "fix", name = "fix", dscr = "fix a bug" },
        fmt("fix{}: {}", { c(1, { t "", fmt("({})", i(1, "scope")) }), i(2) }),
        opts
    ),
    s(
        { trig = "perf", name = "performance", dscr = "performance improvements" },
        fmt("perf{}: {}", { c(1, { t "", fmt("({})", i(1, "scope")) }), i(2) }),
        opts
    ),
    s(
        { trig = "build", name = "build", dscr = "changes in build, deploy or install system" },
        fmt("build{}: {}", { c(1, { t "", fmt("({})", i(1, "scope")) }), i(2) }),
        opts
    ),
    s(
        { trig = "ci", name = "continuous integration", dscr = "changes in continuous integration" },
        fmt("ci{}: {}", { c(1, { t "", fmt("({})", i(1, "scope")) }), i(2) }),
        opts
    ),
    s(
        { trig = "docs", name = "documentation", dscr = "changes in documentation" },
        fmt("docs{}: {}", { c(1, { t "", fmt("({})", i(1, "scope")) }), i(2) }),
        opts
    ),
    s(
        { trig = "refactor", name = "refactor", dscr = "code refactoring" },
        fmt("refactor{}: {}", { c(1, { t "", fmt("({})", i(1, "scope")) }), i(2) }),
        opts
    ),
    s(
        { trig = "style", name = "styling", dscr = "format changes" },
        fmt("style{}: {}", { c(1, { t "", fmt("({})", i(1, "scope")) }), i(2) }),
        opts
    ),
    s(
        { trig = "test", name = "testing", dscr = "add or modify tests" },
        fmt("test{}: {}", { c(1, { t "", fmt("({})", i(1, "scope")) }), i(2) }),
        opts
    ),
}
