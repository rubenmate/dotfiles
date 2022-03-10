local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup {
	debug = false,
	-- TODO: Test if prefer local formats using the project settings and if not
	-- found uses the default settings https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
	sources = {
		formatting.prettier.with { extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } },
		formatting.black.with { extra_args = { "--fast" } },
		formatting.stylua.with { extra_args = { "--config-path", vim.fn.expand "~/.config/stylua.toml" } },
		diagnostics.flake8,
	},
	-- This is for formatting on save
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.api.nvim_create_autocmd("BufWritePre", {
				callback = function()
					vim.lsp.buf.formatting_sync()
				end,
				buffer = 0,
			})
		end
	end,
}
