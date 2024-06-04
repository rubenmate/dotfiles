vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, {})
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

return {
	-- Neovim config helper
	-- NOTE: It should be setup BEFORE lspconfig
	{
		"folke/neodev.nvim",
		config = function()
			require("neodev").setup({
				override = function(root_dir, library)
					if root_dir:find("/etc/nixos", 1, true) == 1 then
						print("Test")
						library.enabled = true
						library.runtime = true
						library.types = true
						library.plugins = true
					end
				end,
			})
		end,
	},
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "tsserver", "gopls", "jdtls" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.tsserver.setup({})
			lspconfig.lua_ls.setup({})
			lspconfig.gopls.setup({})
			lspconfig.ltex.setup({})
			lspconfig.tailwindcss.setup({})
			lspconfig.biome.setup({})
			-- NOTE: Java lsp is not required since it is configured via mfussenegger/nvim-jdtls
			-- Add more LSPs here
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			local sources = {
				-- NOTE: Formatting will be instead in formatting.lua using conform.nvim
				-- null_ls.builtins.formatting.stylua,
				-- null_ls.builtins.formatting.prettierd,
				-- NOTE: Example on how to use a not available in path binary
				-- null_ls.builtins.diagnostics.biome.with({
				-- 	-- command = os.getenv("HOME") .. "/.local/share/nvim/mason/bin/biome",
				-- 	command = "/home/rubenmate/.local/share/nvim/mason/bin/biome",
				-- }),
				-- NOTE: Since biome supports LSP is better to configure there, the builtins only
				-- support formatting
				-- null_ls.builtins.formatting.biome,
			}
			null_ls.setup({ sources = sources })

			-- vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
		end,
	},
	{
		"mfussenegger/nvim-jdtls", -- Java development plugin, it also requires jdtls lsp
		-- 	ft = "java",
		-- 	config = function()
		-- 		local config = {
		-- 			cmd = { "/home/rubenmate/.local/share/nvim/mason/bin/jdtls" },
		-- 			root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
		-- 		}
		-- 		require("jdtls").start_or_attach(config)
		-- 	end,
	},
}
