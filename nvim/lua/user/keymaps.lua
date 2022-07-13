--
--  ██╗  ██╗███████╗██╗   ██╗███╗   ███╗ █████╗ ██████╗ ███████╗
--  ██║ ██╔╝██╔════╝╚██╗ ██╔╝████╗ ████║██╔══██╗██╔══██╗██╔════╝
--  █████╔╝ █████╗   ╚████╔╝ ██╔████╔██║███████║██████╔╝███████╗
--  ██╔═██╗ ██╔══╝    ╚██╔╝  ██║╚██╔╝██║██╔══██║██╔═══╝ ╚════██║
--  ██║  ██╗███████╗   ██║   ██║ ╚═╝ ██║██║  ██║██║     ███████║
--  ╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝     ╚══════╝
local opts = { noremap = true, silent = true }

-- local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap.set

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c"

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- -- Tag stack jumping
-- keymap("n", "<A-t>", "<cmd>pop<CR>", opts)
--
-- Keymap to jump closing pairs
keymap("i", "<A-a>", "<ESC>la", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize  -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize  +2<CR>", opts)

-- Go full screen
-- TODO: Add toggle to switch between full mode and not full mode
keymap("n", "<C-w>z", "<C-w>|<C-w>_", opts)

-- Zoom vim pane, <C-w>= to re-balance
keymap("n", "<leader>-", ":wincmd _<cr>:wincmd |<cr>", opts)
keymap("n", "<leader>=", ":wincmd =<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", "<cmd>bnext<CR>", opts)
keymap("n", "<S-h>", "<cmd>bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- BufferLine
keymap("n", "<leader>db", "<cmd>Bdelete<CR>", opts)

-- Gitsigns
keymap("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", opts)

-- Harpoon
keymap("n", "<leader>hh", '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)
keymap("n", "<leader>ha", '<cmd>lua require("harpoon.mark").add_file()<CR>', opts)
keymap("n", "<leader>hn", '<cmd>lua require("harpoon.ui").nav_next()<CR>', opts)
keymap("n", "<leader>hp", '<cmd>lua require("harpoon.ui").nav_prev()<CR>', opts)
keymap("n", "<leader>fh", '<cmd>lua require("telescope").extensions.harpoon.marks{}<CR>', opts)

-- Neogen
keymap("n", "gcd", "<cmd>Neogen<CR>", opts)

-- Icon-Picker
keymap("i", "<A-i>", "<cmd>PickEverythingInsert<cr>", opts)
-- Toggle word wrap
keymap("n", "<leader>tw", "<cmd>set wrap!<CR>", opts)

-- Clear highlight search
keymap("n", "<leader>l", "<cmd>nohlsearch<CR>", opts)

-- Chmod +x
keymap("n", "<leader>x", ":!chmod +x %<CR>", opts)
-- Open $MYVIMRC and source it
keymap("n", "<leader>ov", ":vsplit $MYVIMRC<CR>", opts)
keymap("n", "<leader>sv", ":source $MYVIMRC<CR>", opts)

-- Insert
-- Press jk fast to exit
keymap("i", "jk", "<ESC>", opts)

-- Visual
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

keymap("n", "<leader><leader>x", "<cmd>source %<CR>", opts)

-- Nvim-Tree
keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opts)
-- keymap("n", "<leader>r", ":NvimTreeRefresh<CR>", opts)
keymap("n", "<leader>n", ":NvimTreeFindFile<CR>", opts)
