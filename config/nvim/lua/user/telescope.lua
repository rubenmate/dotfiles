local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

-- local function telescope_buffer_dir()
--     return vim.fn.expand "%:p:h"
-- end

local actions = require "telescope.actions"
-- local fb_actions = require("telescope").extensions.file_browser.actions

-- Custom pickers
function Edit_neovim()
    require("telescope.builtin").find_files {
        prompt_title = "~ neovim ~",
        shorten_path = false,
        cwd = "~/.config/nvim",
        width = 0.25,

        layout_strategy = "horizontal",
        layout_config = {
            preview_width = 0.65,
        },
    }
end

function Edit_dotfiles()
    require("telescope.builtin").find_files {
        prompt_title = "~ dotfiles ~",
        shorten_path = false,
        cwd = "~/.dotfiles/",
        width = 0.25,

        layout_strategy = "horizontal",
        layout_config = {
            preview_width = 0.65,
        },
    }
end

-- Telescope
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>ff", function()
    require("telescope.builtin").find_files()
end, opts)
vim.keymap.set("n", "<leader>fg", function()
    require("telescope.builtin").live_grep()
end, opts)
vim.keymap.set("n", "<leader>fb", function()
    require("telescope.builtin").buffers(
        require("telescope.themes").get_dropdown { previewer = false }
    )
end, opts)
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope current_buffer_fuzzy_find<CR>", opts)
vim.keymap.set("n", "<leader>th", "<cmd>Telescope help_tags<CR>", opts)
vim.keymap.set("n", "<leader>tk", "<cmd>Telescope keymaps<CR>", opts)
vim.keymap.set("n", "<leader>fp", "<cmd>Telescope registers<CR>", opts)
-- TODO: Check TJ way of doing this: https://github.com/tjdevries/config_manager/search?q=edit_neovim
vim.keymap.set("n", "<leader>fn", "<cmd>lua Edit_neovim()<CR>", opts)
vim.keymap.set("n", "<leader>fd", "<cmd>lua Edit_dotfiles()<CR>", opts)
-- vim.keymap.set("n", "<C-n>", function()
--     require("telescope").extensions.file_browser.file_browser {
--         path = "%:p:h",
--         cwd = telescope_buffer_dir(),
--         respect_git_ignore = false,
--         hidden = true,
--         grouped = true,
--         -- layout_config = { height = 40 },
--     }
-- end, opts)

-- Configuration
telescope.setup {
    defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "smart" },

        mappings = {
            i = {
                ["<C-n>"] = actions.cycle_history_next,
                ["<C-p>"] = actions.cycle_history_prev,

                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,

                ["<C-c>"] = actions.close,
                ["<C-x>"] = actions.delete_buffer,

                ["<Down>"] = actions.move_selection_next,
                ["<Up>"] = actions.move_selection_previous,

                ["<CR>"] = actions.select_default,
                ["<C-h>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-t>"] = actions.select_tab,

                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,

                ["<PageUp>"] = actions.results_scrolling_up,
                ["<PageDown>"] = actions.results_scrolling_down,

                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                ["<C-l>"] = actions.complete_tag,
                ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
            },

            n = {
                ["<esc>"] = actions.close,
                ["<CR>"] = actions.select_default,
                ["<C-h>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-t>"] = actions.select_tab,

                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

                ["j"] = actions.move_selection_next,
                ["k"] = actions.move_selection_previous,
                ["H"] = actions.move_to_top,
                ["M"] = actions.move_to_middle,
                ["L"] = actions.move_to_bottom,

                ["<Down>"] = actions.move_selection_next,
                ["<Up>"] = actions.move_selection_previous,
                ["gg"] = actions.move_to_top,
                ["G"] = actions.move_to_bottom,

                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,

                ["<PageUp>"] = actions.results_scrolling_up,
                ["<PageDown>"] = actions.results_scrolling_down,

                ["?"] = actions.which_key,
            },
        },
    },
    pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
    },
    extensions = {
        -- file_browser = {
        --     theme = "ivy",
        --     -- Disables netrw and use telescope-actions in its place
        --     hijack_netrw = true,
        --     initial_mode = "normal",
        --     mappings = {
        --         -- Your custom  insert mode mappings
        --         ["i"] = {
        --             ["<C-w>"] = function()
        --                 vim.cmd "normal vbd"
        --             end,
        --         },
        --         ["n"] = {
        --             ["N"] = fb_actions.create,
        --             ["h"] = fb_actions.goto_parent_dir,
        --             ["/"] = function()
        --                 vim.cmd "startinsert"
        --             end,
        --         },
        --     },
        -- },
        -- media_files = {
        --     -- filetypes whitelist
        --     -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
        --     filetypes = {"png", "webp", "jpg", "jpeg"},
        --     find_cmd = "rg" -- find command (defaults to `fd`)
        --   }
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
    },
}

-- telescope.load_extension('media_files')
telescope.load_extension "harpoon"
-- telescope.load_extension "file_browser"
