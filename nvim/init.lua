--
--   ██╗███╗   ██╗██╗████████╗██╗     ██╗   ██╗ █████╗
--   ██║████╗  ██║██║╚══██╔══╝██║     ██║   ██║██╔══██╗
--   ██║██╔██╗ ██║██║   ██║   ██║     ██║   ██║███████║
--   ██║██║╚██╗██║██║   ██║   ██║     ██║   ██║██╔══██║
--   ██║██║ ╚████║██║   ██║██╗███████╗╚██████╔╝██║  ██║
--   ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝
--                    @rubenmate
-- TODO: Add preview hunks keybinding to gitsigns
-- TODO: Add harpoon settings
require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.colorscheme"
require "user.cmp"
require "user.lsp"
require "user.telescope"
require "user.treesitter"
require "user.nvim-tree"
require "user.lualine"
require "user.autopairs"
require "user.gitsigns"
require "user.bufferline"
require "user.comment"
require "user.toggleterm"
require "user.neoscroll"
require "user.nvim-colorizer"
require "user.alpha"
require "user.impatient"
require "user.indentline"
-- require "user.whichkey"
require "user.nvim-tmux-navigation"

-- TODO: Missing keybindings
-- nnoremap <Leader>ha :lua require("harpoon.mark").add_file()<CR>
-- nnoremap <C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>
--
--
-- nnoremap <leader>fw <cmd>Telescope tmux windows<cr>
-- nnoremap <leader>fm :lua require('telescope').extensions.harpoon.marks{}<cr>
