--
--   ██╗███╗   ██╗██╗████████╗██╗     ██╗   ██╗ █████╗
--   ██║████╗  ██║██║╚══██╔══╝██║     ██║   ██║██╔══██╗
--   ██║██╔██╗ ██║██║   ██║   ██║     ██║   ██║███████║
--   ██║██║╚██╗██║██║   ██║   ██║     ██║   ██║██╔══██║
--   ██║██║ ╚████║██║   ██║██╗███████╗╚██████╔╝██║  ██║
--   ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝
--                    @rubenmate
-- TODO: Add protected calls to plugins
-- TODO: Add preview hunks keybinding to gitsigns
-- TODO: Missing plugins: Neoscroll, nvim-colorizer
-- TODO: Maybe plugins trouble nvim, diagnosticls-configs
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


-- TODO: Missing keybindings
-- nnoremap <leader>xx <cmd>TroubleToggle<cr>
-- nnoremap <leader>xw <cmd>TroubleToggle lsp_workspace_diagnostics<cr>
-- nnoremap <leader>xd <cmd>TroubleToggle lsp_document_diagnostics<cr>
-- nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
-- nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
-- nnoremap <leader>gR <cmd>TroubleToggle lsp_references<cr>
--
--
-- nnoremap <Leader>ha :lua require("harpoon.mark").add_file()<CR>
-- nnoremap <C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>
--
--
-- nnoremap <leader>ff :lua require'telescope.builtin'.find_files{ hidden = true }<cr>
-- nnoremap <leader>fb <cmd>Telescope buffers<cr>
-- nnoremap <Leader>fs :lua require'telescope.builtin'.file_browser{ cwd = vim.fn.expand('%:p:h') }<cr>
-- nnoremap <Leader>fc :lua require'telescope.builtin'.git_status{}<cr>
-- nnoremap <Leader>cb :lua require'telescope.builtin'.git_branches{}<cr>
-- nnoremap <leader>fw <cmd>Telescope tmux windows<cr>
-- nnoremap <leader>fr :lua require'telescope.builtin'.resume{}<CR>
-- nnoremap <leader>fm :lua require('telescope').extensions.harpoon.marks{}<cr>
--
