local status_ok, ufo = pcall(require, "ufo")
if not status_ok then
    return
end

vim.o.foldcolumn = "1"
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = -1
vim.o.foldenable = true

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

-- local ftMap = {
--     vim = "indent",
--     python = { "indent" },
--     git = "",
-- }

ufo.setup {
    open_fold_hl_timeout = 150,
    preview = {
        win_config = {
            border = { "", "─", "", "", "", "─", "", "" },
            winhighlight = "Normal:Folded",
            winblend = 0,
        },
        mappings = {
            scrollU = "<C-u>",
            scrollD = "<C-d>",
        },
    },
    provider_selector = function(bufnr, filetype)
        -- return a string type use internal providers
        -- return a string in a table like a string type
        -- return empty string '' will disable any providers
        -- return `nil` will use default value {'lsp', 'indent'}

        -- if you prefer treesitter provider rather than lsp,
        -- return ftMap[filetype] or {'treesitter', 'indent'}
        return { "lsp", "indent" }
    end,
}
-- Behaviour below will be configured on lsp/handlers.lua
-- vim.keymap.set("n", "K", function()
--     local winid = require("ufo").peekFoldedLinesUnderCursor()
--     if not winid then
--         -- choose one of them
--         -- nvimlsp
--         vim.lsp.buf.hover()
--     end
-- end)
