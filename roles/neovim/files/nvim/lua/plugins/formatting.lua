return {
	-- NOTE: Currently using conform.nvim, this could be achieved also using none-ls/null-ls
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			-- Customize or remove this keymap to your liking
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			-- Use a sub-list to run only the first available formatter
			javascript = { { "biome", "prettierd", "prettier" } },
			typescript = { { "biome", "prettierd", "prettier" } },
			javascriptreact = { { "biome", "prettierd", "prettier" } },
			typescriptreact = { { "biome", "prettierd", "prettier" } },
			java = { { "google-java-format" } },
		},
		format_on_save = {
			-- timeout_ms = 500,
			lsp_fallback = true,
		},
		-- This code above is a shortcut for:
		-- vim.api.nvim_create_autocmd("BufWritePre", {
		-- pattern = "*",
		-- callback = function(args)
		-- require("conform").format({ bufnr = args.buf })
		-- end,
		-- })
	},
}
