local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

local lsp_formatting = function(bufnr)
    vim.lsp.buf.format {
        filter = function(client)
            return client.name ~= "tsserver" or client.name ~= "sumneko_lua"
        end,
        -- filter out clients that you don't want to use
        -- return client.name ~= "tsserver"
        bufnr = bufnr,
    }
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- local with_root_file = function(files)
--     return function(utils)
--         return utils.root_has_file(files)
--     end
-- end

null_ls.setup {
    debug = false,
    -- TODO: Test if prefer local formats using the project settings and if not
    -- found uses the default settings https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
    sources = {
        formatting.prettier.with { extra_args = { "--tab-width", 4, "--print-width", 100 } },
        formatting.black.with { extra_args = { "--fast" } },
        formatting.stylua.with {
            extra_args = { "--config-path", vim.fn.expand "~/.config/stylua.toml" },
        },
        diagnostics.flake8,
        diagnostics.eslint.with {
            condition = function(utils)
                return utils.root_has_file {
                    ".eslintrc.js",
                    ".eslintrc.cjs",
                    ".eslintrc.yaml",
                    ".eslintrc.yml",
                    ".eslintrc.json",
                }
            end,
        },
    },
    -- This is for formatting on save
    on_attach = function(client, bufnr)
        if client.supports_method "textDocument/formatting" then
            vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    lsp_formatting(bufnr)
                end,
            })
        end
    end,
}
