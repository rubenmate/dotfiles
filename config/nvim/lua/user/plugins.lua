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
-- TODO: Instead of just running PackerSync ask if you want to run it
vim.api.nvim_create_augroup("packer_user_config", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "plugins.lua",
    command = "source <afile> | PackerSync",
    group = "packer_user_config",
})

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
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins
    -- Color schemes
    use "olimorris/onedarkpro.nvim"
    use "Mofiqul/dracula.nvim"

    use {
        "s1n7ax/nvim-window-picker",
        tag = "v1.*",
        config = function()
            require("window-picker").setup()
        end,
    }

    use {
        "mrshmllow/document-color.nvim",
        config = function()
            require("document-color").setup {
                -- Default options
                mode = "background", -- "background" | "foreground" | "single"
            }
        end,
    }
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
    use "windwp/nvim-ts-autotag" -- Auto html tags, integrates with treesitter
    use "norcalli/nvim-colorizer.lua" -- Color highlighter
    use "lukas-reineke/indent-blankline.nvim" -- Show indent lines
    use "alexghergh/nvim-tmux-navigation"
    use {
        "nacro90/numb.nvim",
        config = function()
            require("numb").setup {}
        end,
    }
    use { -- LSP progress report
        "j-hui/fidget.nvim",
        config = function()
            require("fidget").setup {
                vim.cmd [[highlight FidgetTitle guifg=#ff79c6]],
            }
        end,
    }
    use { "stevearc/dressing.nvim" }
    use {
        "TimUntersberger/neogit",
        requires = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
        },
    }
    use "max397574/better-escape.nvim"
    use "mbbill/undotree" -- undotree
    use "jghauser/mkdir.nvim" -- automatically creates parent folders if necessary
    use "kylechui/nvim-surround" -- vim surround but in lua
    use { "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" } -- Folding

    -- XCode
    -- use {
    --     "tami5/xbase",
    --     run = "make install",
    --     requires = {
    --         "nvim-lua/plenary.nvim",
    --         "nvim-telescope/telescope.nvim",
    --     },
    -- }
    -- My plugins
    -- use "/Users/rubenmate/Developerino/nvim-plugins/tailwind-colorizer.nvim"

    use "ThePrimeagen/harpoon" -- ThePrime Harpoon

    -- Completion
    use "hrsh7th/nvim-cmp" -- The completion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    -- Snippets
    use "L3MON4D3/LuaSnip" --snippet engine

    -- LSP
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua" -- neovim Lua API
    use "David-Kunz/cmp-npm" -- npm packages completion
    use { "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" }

    -- LSP
    use "neovim/nvim-lspconfig" -- enable LSP
    use "williamboman/mason.nvim" -- nvim lsp installer sucessor
    use "williamboman/mason-lspconfig.nvim"
    use "jose-elias-alvarez/null-ls.nvim" -- tool to hook into linters and formatters
    use "glepnir/lspsaga.nvim" -- LSP UI
    use "Issafalcon/lsp-overloads.nvim"

    -- Trouble
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
    }

    -- Telescope
    use "nvim-telescope/telescope.nvim"
    -- use "nvim-telescope/telescope-file-browser.nvim"

    -- Lualine
    use "hoob3rt/lualine.nvim"

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
    use {
        "nvim-treesitter/nvim-treesitter-context",
        config = function()
            require("treesitter-context").setup {}
        end,
    }

    -- treesitter modules, treesitter required
    use "p00f/nvim-ts-rainbow" -- Rainbow parentheses for neovim
    use "nvim-treesitter/playground" -- Treesitter information directly in Neovim

    -- Gitsigns
    use "lewis6991/gitsigns.nvim"

    -- Bufferline
    use "akinsho/bufferline.nvim"
    use {
        "tiagovla/scope.nvim", -- Changes how tabs work, only showing buffers active in the tab itself
        config = function()
            require("scope").setup()
        end,
    }
    use "moll/vim-bbye"

    -- Commentary
    use { "numToStr/Comment.nvim", branch = "jsx" } -- Simple comments
    -- use "JoosepAlviste/nvim-ts-context-commentstring" -- Comments with context, requires treesitter

    -- Refactoring
    -- use {
    --     "ThePrimeagen/refactoring.nvim",
    --     requires = {
    --         { "nvim-lua/plenary.nvim" },
    --         { "nvim-treesitter/nvim-treesitter" },
    --     },
    -- }

    -- Rust
    use {
        -- TODO: Check for branch merge
        "simrat39/rust-tools.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        branch = "modularize_and_inlay_rewrite",
    }

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
