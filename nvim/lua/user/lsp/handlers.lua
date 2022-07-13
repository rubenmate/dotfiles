local M = {}

M.setup = function()
    local signs = {
        { name = "DiagnosticSignError", text = "E" },
        { name = "DiagnosticSignWarn", text = "W" },
        { name = "DiagnosticSignHint", text = "H" },
        { name = "DiagnosticSignInfo", text = "I" },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    local config = {
        -- disable virtual text
        virtual_text = false,
        -- show signs
        signs = {
            active = signs,
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    }

    vim.diagnostic.config(config)

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
    })
end

local function lsp_keymaps(bufnr)
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    vim.keymap.set("n", "K", function()
        local winid = require("ufo").peekFoldedLinesUnderCursor()
        if not winid then
            vim.lsp.buf.hover()
        end
    end)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "<leader>ca",
        "<cmd>lua vim.lsp.buf.code_action()<CR>",
        opts
    )
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "[d",
        '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>',
        opts
    )
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "]d",
        '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>',
        opts
    )
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "<leader>q",
        "<cmd>lua vim.diagnostic.setloclist()<CR>",
        opts
    )
end

---@diagnostic disable-next-line: unused-local
M.on_attach = function(client, bufnr)
    -- FIXME: Migrate this to null-ls
    -- if client.name == "tsserver" or client.name == "jsonls" or client.name == "html" then
    --     client.resolved_capabilities.documentFormattingProvider = false
    -- end
    lsp_keymaps(bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
    return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
