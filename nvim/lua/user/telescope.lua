local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

-- telescope.load_extension('media_files')
telescope.load_extension "harpoon"

local actions = require "telescope.actions"

-- Custom pickers
function Edit_neovim()
	require("telescope.builtin").find_files {
		prompt_title = "~ dotfiles ~",
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
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
vim.keymap.set(
	"n",
	"<leader>th",
	"<cmd>lua require'telescope.builtin'.help_tags(require('telescope.themes').get_dropdown({ previewer = false}))<CR>",
	opts
)
-- TODO: Check TJ way of doing this: https://github.com/tjdevries/config_manager/search?q=edit_neovim
vim.keymap.set("n", "<leader>fn", "<cmd>lua Edit_neovim()<CR>", opts)
vim.keymap.set("n", "<leader>fd", "<cmd>lua Edit_dotfiles()<CR>", opts)

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

				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,

				["<CR>"] = actions.select_default,
				["<C-x>"] = actions.select_horizontal,
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
				["<C-x>"] = actions.select_horizontal,
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
