return {
	{
		"jellydn/hurl.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			-- Show debugging info
			debug = false,
			-- Show notification on run
			show_notification = false,
			-- Show response in popup or split
			mode = "split",
			-- Default formatter
			formatters = {
				json = { "jq" }, -- Make sure you have install jq in your system, e.g: brew install jq
				html = {
					"prettier", -- Make sure you have install prettier in your system, e.g: npm install -g prettier
					"--parser",
					"html",
				},
			},
		},
		keys = {
			-- Run API request
			{ "<leader>A", "<cmd>HurlRunner<CR>", desc = "Run All requests" },
			{ "<leader>a", "<cmd>HurlRunnerAt<CR>", desc = "Run Api request" },
			{ "<leader>te", "<cmd>HurlRunnerToEntry<CR>", desc = "Run Api request to entry" },
			{ "<leader>tm", "<cmd>HurlToggleMode<CR>", desc = "Hurl Toggle Mode" },
			{ "<leader>tv", "<cmd>HurlVerbose<CR>", desc = "Run Api in verbose mode" },
			-- Run Hurl request in visual mode
			{ "<leader>h", ":HurlRunner<CR>", desc = "Hurl Runner", mode = "v" },
		},
	},
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			-- Only one of these is needed, not both.
			"nvim-telescope/telescope.nvim", -- optional
			"ibhagwan/fzf-lua", -- optional
		},
		config = true,
	},
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			{ "tpope/vim-dadbod", lazy = true },
			{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
		},
		cmd = {
			"DBUI",
			"DBUIToggle",
			"DBUIAddConnection",
			"DBUIFindBuffer",
		},
		init = function()
			-- Your DBUI configuration
			vim.g.db_ui_use_nerd_fonts = 1
		end,
	},
	{
		"lervag/vimtex",
		init = function()
			-- Use init for configuration, don't use the more common "config".
			-- vimtex
			vim.g.vimtex_view_method = "zathura"
			vim.g.maplocalleader = ","

			vim.o.foldmethod = "expr"
			vim.o.foldexpr = "vimtex#fold#level(v:lnum)"
			vim.o.foldtext = "vimtex#fold#text()"
			vim.o.foldlevel = 2
		end,
	},
}
