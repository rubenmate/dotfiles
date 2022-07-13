local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
    return
end

require("luasnip/loaders/from_vscode").lazy_load()

local types = require "luasnip.util.types"
luasnip.config.set_config {
    -- This tells LuaSnip to remember to keep around the last snippet. You can jump back into it
    -- even if outside of the selection
    history = true,

    -- If you have dynamic snippets, it updates as you type
    updateevents = "TextChanged, TextChangedI",

    -- Autosnippets:
    enable_autosnippets = true,

    -- Crazy highlights
    -- ext_opts = nil,
    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { " <- Current Choice", "NonTest" } },
            },
        },
    },
}

-- LuaSnip mappings
-- <C-k> expansion key
vim.keymap.set({ "i", "s" }, "<c-k>", function()
    if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
    end
end, { silent = true })

-- <C-j> jump backwards key
vim.keymap.set({ "i", "s" }, "<c-j>", function()
    if luasnip.jumpable(-1) then
        luasnip.jump(-1)
    end
end, { silent = true })

-- <C-l> selection between options
vim.keymap.set("i", "<c-l>", function()
    if luasnip.choice_active() then
        luasnip.change_choice(1)
    end
end)

-- Shortcut to source luansnip file again, reloading snippets
vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/lua/user/luasnip.lua<CR>")
