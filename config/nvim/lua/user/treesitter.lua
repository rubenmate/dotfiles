local configs = require "nvim-treesitter.configs"
configs.setup {
    ensure_installed = { "lua", "rust", "javascript", "html" },
    sync_install = false,
    ignore_install = { "" }, -- List of parsers to ignore installing
    autotag = {
        enabled = true,
    },
    autopairs = {
        enable = true,
    },
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = { "" }, -- list of language that will be disabled
        additional_vim_regex_highlighting = true,
    },
    indent = { enable = true, disable = { "yaml" } },
    -- TODO: Delete this when Comment merges JSX branch
    -- context_commentstring = {
    --     enable = true,
    --     enable_autocmd = false,
    -- },
    -- nvim-ts-rainbow configuration (required)
    rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        -- rainbowcol1 { fg = "#ff5555" }, -- rainbowcol1    xxx ctermfg=9 guifg=#cc241d
        -- rainbowcol2 { fg = "#f1fa8c" }, -- rainbowcol2    xxx ctermfg=10 guifg=#a89984
        -- rainbowcol3 { fg = "#8be9fd" }, -- rainbowcol3    xxx ctermfg=11 guifg=#b16286
        -- rainbowcol4 { fg = "#ff79c6" }, -- rainbowcol5    xxx ctermfg=13 guifg=#689d6a
        -- rainbowcol5 { fg = "#50fa7b" }, -- rainbowcol4    xxx ctermfg=12 guifg=#d79921
        -- rainbowcol6 { fg = "#bd93f9" }, -- rainbowcol6    xxx ctermfg=14 guifg=#d65d0e
        -- rainbowcol7 { fg = "#51a0cf" }, -- rainbowcol7    xxx ctermfg=15 guifg=#458588
        --       }
        -- TODO: Rewrite with more bright colors VIBGYOR
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
    },
    -- playground configuration (required)
    playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
            toggle_query_editor = "o",
            toggle_hl_groups = "i",
            toggle_injected_languages = "t",
            toggle_anonymous_nodes = "a",
            toggle_language_display = "I",
            focus_language = "f",
            unfocus_language = "F",
            update = "R",
            goto_node = "<cr>",
            show_help = "?",
        },
    },
}

require("nvim-ts-autotag").setup {
    filetypes = {
        "html",
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
        "svelte",
        "vue",
        "astro",
        "tsx",
        "jsx",
        "rescript",
        "xml",
        "php",
        "markdown",
        "glimmer",
        "handlebars",
        "hbs",
    },
}
