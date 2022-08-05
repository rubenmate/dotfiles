local mason_status_ok, mason = pcall(require, "mason")
local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_status_ok and mason_lspconfig_status_ok then
    return
end

-- Mason setup
mason.setup {
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
}

-- Mason-Lspconfig setup
mason_lspconfig.setup {
    ensure_installed = { "sumneko_lua" },
}

local on_attach = require("user.lsp.handlers").on_attach
local capabilities = require("user.lsp.handlers").capabilities

-- Automatically configure installed servers
mason_lspconfig.setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function(server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {
            on_attach = on_attach,
            capabilities = capabilities,
        }
    end,
    -- TODO: Extract this options to a settings folder
    -- Next, you can provide targeted overrides for specific servers.
    ["rust_analyzer"] = function()
        -- I don't do anything here since the rust_analyzer LSP will be started by rust-tools which
        -- is required at init.lua
        local extension_path = vim.env.HOME
            .. "/.local/share/nvim/mason/packages/codelldb/extension/"
        local codelldb_path = extension_path .. "adapter/codelldb"
        local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"
        require("rust-tools").setup {
            dap = {
                adapter = require("rust-tools.dap").get_codelldb_adapter(
                    codelldb_path,
                    liblldb_path
                ),
            },
            server = {
                on_attach = on_attach,
                capabilities = capabilities,
            },
        }
    end,
    ["sumneko_lua"] = function()
        require("lspconfig")["sumneko_lua"].setup {
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                            [vim.fn.stdpath "config" .. "/lua"] = true,
                        },
                    },
                },
            },
        }
    end,
    ["emmet_ls"] = function()
        local emmet_capabilities = capabilities
        emmet_capabilities.textDocument.completion.completionItem.snippetSupport = true
        require("lspconfig")["emmet_ls"].setup {
            capabilities = emmet_capabilities,
            filetypes = {
                "html",
                "typescriptreact",
                "javascriptreact",
                "css",
                "sass",
                "scss",
                "less",
            },
            init_options = {
                html = {
                    options = {
                        -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
                        ["bem.enabled"] = true,
                    },
                },
            },
        }
    end,
}
