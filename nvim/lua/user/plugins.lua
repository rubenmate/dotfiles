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
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init {
	display = {
		open_fn = function()
			return require("packer.util").float { border = "rounded" }
		end,
	},
}
-- Install your plugins here
return packer.startup(function(use)
	-- Color schemes
	use { "dracula/vim", as = "dracula" }
	use "npxbr/gruvbox.nvim"

	-- My plugins here
	use "wbthomason/packer.nvim" -- Have packer manage itself
	use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
	use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins
	use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
	use "akinsho/toggleterm.nvim" -- Open  terminal programs in neovim
	use "karb94/neoscroll.nvim" -- Smooth scrolling with C-u/C-d
	use "norcalli/nvim-colorizer.lua" -- Color highlighter
	use "goolord/alpha-nvim" -- Dashboard for neovim
	use "lewis6991/impatient.nvim" -- Speed up Lua modules to improve startup time
	use "lukas-reineke/indent-blankline.nvim" -- Show indent lines
	use "folke/which-key.nvim" -- Keymaps helper
	use "alexghergh/nvim-tmux-navigation"
	use "nyngwang/NeoRoot.lua" -- Change working directory like Monkey
	use "ggandor/lightspeed.nvim" -- Motion plugin for on-screen movements

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
	-- use "github/copilot.vim" -- GitHubCopilot

	-- Snippets
	use "L3MON4D3/LuaSnip" --snippet engine
	use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

	-- LSP
	use "neovim/nvim-lspconfig" -- enable LSP
	use "williamboman/nvim-lsp-installer" -- simple tool to install LSPs
	use "jose-elias-alvarez/null-ls.nvim" -- tool to hook into linters and formatters

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

	-- Gitsigns
	use "lewis6991/gitsigns.nvim"

	-- Bufferline
	use "akinsho/bufferline.nvim"
	use "moll/vim-bbye"

	-- Commentary
	use "numToStr/Comment.nvim" -- Simple comments
	use "JoosepAlviste/nvim-ts-context-commentstring" -- Comments with context, requires treesitter

	-- Tabout
	-- use {
	-- 	"abecodes/tabout.nvim",
	-- 	wants = { "nvim-treesitter" },
	-- }

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
