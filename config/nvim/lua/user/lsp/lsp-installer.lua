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

-- Automatically configure installed servers
mason_lspconfig.setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function(server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {}
    end,
    -- Next, you can provide targeted overrides for specific servers.
    -- For example, a handler override for the `rust_analyzer`:
    ["rust_analyzer"] = function()
        -- I don't do anything here since the rust_analyzer LSP will be started by rust-tools which
        -- is required at init.lua
    end,
}
