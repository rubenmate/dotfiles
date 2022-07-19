return {
    parse("cl", 'console.log("$1")'),

    -- React Functional Component
    s(
        "rfc",
        fmt(
            "const {} = ({}) => {{\n\treturn (\n\t\t{}\n\t)\n}}\nexport default {}",
            { i(1, "Component"), i(2), i(3), rep(1) }
        )
    ),
}
