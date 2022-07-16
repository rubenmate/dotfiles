--
--  ██████╗███╗   ███╗██████╗
-- ██╔════╝████╗ ████║██╔══██╗
-- ██║     ██╔████╔██║██████╔╝
-- ██║     ██║╚██╔╝██║██╔═══╝
-- ╚██████╗██║ ╚═╝ ██║██║
--  ╚═════╝╚═╝     ╚═╝╚═╝
--
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    return
end

--   פּ ﯟ   some other good icons
local kind_icons = {
    Text = "",
    Method = "m",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "",
}
-- find more here: https://www.nerdfonts.com/cheat-sheet

-- Tabnine setup
local tabnine = require "cmp_tabnine.config"
tabnine:setup {
    max_lines = 1000,
    max_num_results = 20,
    sort = true,
    run_on_every_keystroke = true,
    snippet_placeholder = "..",
    ignored_file_types = { -- default is not to ignore
        -- uncomment to ignore in lua:
        -- lua = true
    },
}

cmp.setup {
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = {
        -- CMP mappings
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        -- ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ["<C-e>"] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        },
        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ["<C-y>"] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = true },
    },
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            -- Kind icons
            vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
            -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
            vim_item.menu = ({
                gh_issues = "[issues]",
                luasnip = "[snip]",
                nvim_lsp = "[LSP]",
                cmp_tabnine = "[TN]",
                buffer = "[buffer]",
                path = "[path]",
                nvim_lua = "[api]",
                npm = "[npm]", -- TODO: Check if it works
            })[entry.source.name]
            return vim_item
        end,
    },
    sources = {
        { name = "gh_issues" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "nvim_lua" },
        { name = "npm" },
        { name = "cmp_tabnine" },
        { name = "path" },
        { name = "buffer", keyword_length = 5 },
    },
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    },
    -- documentation = {
    -- 	border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    -- },
    experimental = {
        ghost_text = true,
        native_menu = false,
    },
}
