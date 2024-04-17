return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = { "go", "lua", "javascript", "hurl" },
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
