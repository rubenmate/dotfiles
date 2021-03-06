-- TODO: Migrate everything here to setup
-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
-- vim.g.nvim_tree_icons = {
--     default = "",
--     symlink = "",
--     git = {
--         unstaged = "",
--         staged = "S",
--         unmerged = "",
--         renamed = "➜",
--         deleted = "",
--         untracked = "U",
--         ignored = "◌",
--     },
--     folder = {
--         default = "",
--         open = "",
--         empty = "",
--         empty_open = "",
--         symlink = "",
--     },
-- }

-- vim.g.nvim_tree_git_hl = 1
-- vim.g.nvim_tree_highlight_opened_files = 1
-- vim.g.nvim_tree_group_empty = 1

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
    return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
    -- lsp_diagnostics = true,
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = false,
    ignore_ft_on_setup = { "startify", "dashboard" },
    open_on_tab = false,
    hijack_cursor = false,
    update_cwd = false,
    -- update_to_buf_dir = {
    -- 	enable = true,
    -- 	auto_open = true,
    -- },
    renderer = {
        indent_markers = {
            enable = true,
            icons = {
                corner = "└ ",
                edge = "│ ",
                none = "  ",
            },
        },
    },
    actions = {
        open_file = {
            quit_on_open = true,
        },
    },
    diagnostics = {
        enable = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    update_focused_file = {
        enable = false,
        update_cwd = false,
        ignore_list = {},
    },
    system_open = {
        cmd = nil,
        args = {},
    },
    filters = {
        dotfiles = false,
        custom = { ".git", "node_modules", ".cache" },
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 500,
    },
    -- view = {
    -- 	width = 30,
    -- 	height = 30,
    -- 	hide_root_folder = false,
    -- 	side = "left",
    -- 	auto_resize = false,
    -- 	mappings = {
    -- 		custom_only = false,
    -- 		list = {
    -- 			{ key = "<S-v>", cb = tree_cb "vsplit" },
    -- 			{ key = "<S-x>", cb = tree_cb "split" },
    -- 		},
    -- 	},
    -- 	number = false,
    -- 	relativenumber = false,
    -- 	signcolumn = "yes",
    -- },
    trash = {
        cmd = "trash",
        require_confirm = true,
    },
    -- git_hl = 1,
    -- disable_window_picker = 0,
    -- root_folder_modifier = ":t",
    -- show_icons = {
    -- 	git = 1,
    -- 	folders = 1,
    -- 	files = 1,
    -- 	folder_arrows = 1,
    -- 	tree_width = 30,
    -- },
}
