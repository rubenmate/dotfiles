--
-- ██████╗ ██╗     ██╗   ██╗ ██████╗ ██╗███╗   ██╗███████╗
-- ██╔══██╗██║     ██║   ██║██╔════╝ ██║████╗  ██║██╔════╝
-- ██████╔╝██║     ██║   ██║██║  ███╗██║██╔██╗ ██║███████╗
-- ██╔═══╝ ██║     ██║   ██║██║   ██║██║██║╚██╗██║╚════██║
-- ██║     ███████╗╚██████╔╝╚██████╔╝██║██║ ╚████║███████║
-- ╚═╝     ╚══════╝ ╚═════╝  ╚═════╝ ╚═╝╚═╝  ╚═══╝╚══════╝
--
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}
	print "Installing packer close and reopen Neovim..."
	vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.api.nvim_create_augroup("packer_user_config", { clear = true })
vim.api.nvim_create_autocmd(
	"BufWritePost",
	{ pattern = "plugins.lua", command = "source <afile> | PackerSync", group = "packer_user_config" }
)

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init {
	display = {
		-- open_fn = function()
		-- 	return require("packer.util").float { border = "rounded" }
		-- end,
	},
}
-- Install your plugins here
return packer.startup(function(use)
	-- Color schemes
	use { "dracula/vim", as = "dracula" }
	use {
		"catppuccin/nvim",
		as = "catppuccin",
	}
	use "npxbr/gruvbox.nvim"

	-- My plugins here
	use "wbthomason/packer.nvim" -- Have packer manage itself
	use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
	use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins
	use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
	use "akinsho/toggleterm.nvim" -- Open  terminal programs in neovim
	use "norcalli/nvim-colorizer.lua" -- Color highlighter
	use "lewis6991/impatient.nvim" -- Speed up Lua modules to improve startup time
	use "lukas-reineke/indent-blankline.nvim" -- Show indent lines
	use "alexghergh/nvim-tmux-navigation"
	use "nyngwang/NeoRoot.lua" -- Change working directory like Monkey
	use "ggandor/lightspeed.nvim" -- Motion plugin for on-screen movements
	use "stevearc/dressing.nvim" -- Better UI
	use {
		"nacro90/numb.nvim",
		config = function()
			require("numb").setup {}
		end,
	}
	use { -- LSP progress report
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup {}
		end,
	}
	use {
		"danymat/neogen",
		config = function()
			require("neogen").setup {}
		end,
		requires = "nvim-treesitter/nvim-treesitter",
	}
	use "rcarriga/nvim-notify" -- Better Notification UI
	use { "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" }
	use "max397574/better-escape.nvim"
	use {
		"zbirenbaum/copilot.lua",
		event = { "VimEnter" },
		config = function()
			vim.defer_fn(function()
				require("copilot").setup()
			end, 100)
		end,
	}
	use {
		"zbirenbaum/copilot-cmp",
		after = { "copilot.lua", "nvim-cmp" },
	}

	-- My plugins
	-- use "/Users/rubenmate/Developerino/nvim-plugins/restarter.nvim/"
	use "/Users/rubenmate/Developerino/nvim-plugins/stackmap.nvim/"

	-- Migrated
	use "ThePrimeagen/harpoon" -- ThePrime Harpoon

	-- Completion
	use "hrsh7th/nvim-cmp" -- The completion plugin
	use "hrsh7th/cmp-buffer" -- buffer completions
	use "hrsh7th/cmp-path" -- path completions
	use "hrsh7th/cmp-cmdline" -- cmdline completions
	use "saadparwaiz1/cmp_luasnip" -- snippet completions
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/cmp-nvim-lua" -- neovim Lua API
	use "andersevenrud/cmp-tmux" -- tmux completion
	use "David-Kunz/cmp-npm" -- npm packages completion
	use { "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" }

	-- Snippets
	use "L3MON4D3/LuaSnip" --snippet engine
	use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

	-- LSP
	use "neovim/nvim-lspconfig" -- enable LSP
	use "williamboman/nvim-lsp-installer" -- simple tool to install LSPs
	use "jose-elias-alvarez/null-ls.nvim" -- tool to hook into linters and formatters

	-- Trouble
	use {
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	}

	-- Telescope
	use "nvim-telescope/telescope.nvim"

	-- Lualine
	use "hoob3rt/lualine.nvim"

	-- Treesitter
	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	}

	-- Nvim-Tree File Explorer
	use {
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icons
		},
	}
	-- treesitter modules, treesitter required
	use "p00f/nvim-ts-rainbow" -- Rainbow parentheses for neovim
	use "nvim-treesitter/playground" -- Treesitter information directly in Neovim
	-- use { -- Autoclosing and autorenaming HTML tags
	-- 	"windwp/nvim-ts-autotag",
	-- 	event = "InsertEnter",
	-- 	config = function()
	-- 		require("nvim-ts-autotag").setup()
	-- 	end,
	-- }
	use "windwp/nvim-ts-autotag"
	require("nvim-ts-autotag").setup()

	-- Gitsigns
	use "lewis6991/gitsigns.nvim"

	-- Bufferline
	use { "akinsho/bufferline.nvim", branch = "dev" }
	use "moll/vim-bbye"

	-- Commentary
	use "numToStr/Comment.nvim" -- Simple comments
	use "JoosepAlviste/nvim-ts-context-commentstring" -- Comments with context, requires treesitter

	-- Tabout
	-- use {
	-- 	"abecodes/tabout.nvim",
	-- 	wants = { "nvim-treesitter" },
	-- }

	-- Debugging
	use "mfussenegger/nvim-dap"
	use "rcarriga/nvim-dap-ui"
	use "theHamsta/nvim-dap-virtual-text"
	use "nvim-telescope/telescope-dap.nvim"
	-- extensions
	use "leoluz/nvim-dap-go"
	use "mfussenegger/nvim-dap-python"

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
