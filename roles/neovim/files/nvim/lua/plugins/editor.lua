local Util = require("lazyvim.util")

return {
  {
    "echasnovski/mini.bufremove",
    -- stylua: ignore
    keys = {
      { "<leader>bd", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
      { "<leader>bD", function() require("mini.bufremove").delete(0, true) end, desc = "Delete Buffer (Force)" },
    },
  },
  -- Nvim-spectre
  {
    "windwp/nvim-spectre",
    -- stylua: ignore
    keys = {
      { "<leader>sr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
    },
  },
  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false, -- telescope did only one release, so use HEAD for now
    init = function ()
      -- Enable telescope fzf native, if installed
      pcall(require('telescope').load_extension, 'fzf')
    end,
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { '<leader><space>', Util.telescope("buffers"), desc = '[ ] Find existing buffers' },
      {'<leader>?', Util.telescope("oldfiles"), desc = '[?] Find recently opened files' },
      { "<leader>sf", Util.telescope("find_files"), desc = "[S]earch [F]iles" },
      { "<leader>sF", Util.telescope("files", { cwd = false }), desc = "[S]earch [F]iles (cwd)" },
      { "<leader>sh", Util.telescope("help_tags"), desc = "[S]earch [H]elp" },
      { "<leader>sk", Util.telescope("keymaps"), desc = "[S]earch [K]eymaps" },
      { "<leader>sw", Util.telescope("grep_string"), desc = "[S]earch current [W]ord" },
      { "<leader>sW", Util.telescope("grep_string", { cwd = false }), desc = "[S]earch current [W]ord (cwd)" },
      { "<leader>sg", Util.telescope("live_grep"), desc = "[S]earch by [G]rep" },
      { "<leader>sG", Util.telescope("live_grep", { cwd = false }), desc = "[S]earch by [G]rep (cwd)" },
      { "<leader>sd", Util.telescope("diagnostics"), desc = "[S]earch [D]iagnostics" },
      { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "[S]earch [C]ommand history" },
      { "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "[S]earch [A]utocommands" },
      { "<leader>/", Util.telescope("current_buffer_fuzzy_find", { theme = "dropdown", previewer = false, winblend = 10 }), desc = "[/] Fuzzily search in current buffer" },
      { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
      { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "[S]earch vim [O]ptions" },
      {
        "<leader>ss",
        Util.telescope("lsp_document_symbols", {
          symbols = {
            "Class",
            "Function",
            "Method",
            "Constructor",
            "Interface",
            "Module",
            "Struct",
            "Trait",
            "Field",
            "Property",
          },
        }),
        desc = "Goto Symbol",
      },
      -- git
      { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
      { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },
    },

    opts = {
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        mappings = {
          i = {
            ["<c-t>"] = function(...)
              return require("trouble.providers.telescope").open_with_trouble(...)
            end,
            ["<a-i>"] = function()
              Util.telescope("find_files", { no_ignore = true })()
            end,
            ["<a-h>"] = function()
              Util.telescope("find_files", { hidden = true })()
            end,
            ["<C-Down>"] = function(...)
              return require("telescope.actions").cycle_history_next(...)
            end,
            ["<C-Up>"] = function(...)
              return require("telescope.actions").cycle_history_prev(...)
            end,
          },
        },
      },
    },
  },
  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', cond = vim.fn.executable 'make' == 1 },
  -- Trouble
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    opts = { use_diagnostic_signs = true },
    keys = {
      { "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
      { "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
    },
  },
  -- vim-illuminate
  {
    "RRethy/vim-illuminate",
    event = "BufReadPost",
    opts = { delay = 200 },
    config = function(_, opts)
      require("illuminate").configure(opts)
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          local buffer = vim.api.nvim_get_current_buf()
          pcall(vim.keymap.del, "n", "]]", { buffer = buffer })
          pcall(vim.keymap.del, "n", "[[", { buffer = buffer })
        end,
      })
    end,
    -- stylua: ignore
    keys = {
      { "]]", function() require("illuminate").goto_next_reference(false) end, desc = "Next Reference", },
      { "[[", function() require("illuminate").goto_prev_reference(false) end, desc = "Prev Reference" },
    },
  },
}
