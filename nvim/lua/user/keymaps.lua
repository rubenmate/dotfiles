--
--  ██╗  ██╗███████╗██╗   ██╗███╗   ███╗ █████╗ ██████╗ ███████╗
--  ██║ ██╔╝██╔════╝╚██╗ ██╔╝████╗ ████║██╔══██╗██╔══██╗██╔════╝
--  █████╔╝ █████╗   ╚████╔╝ ██╔████╔██║███████║██████╔╝███████╗
--  ██╔═██╗ ██╔══╝    ╚██╔╝  ██║╚██╔╝██║██╔══██║██╔═══╝ ╚════██║
--  ██║  ██╗███████╗   ██║   ██║ ╚═╝ ██║██║  ██║██║     ███████║
--  ╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝     ╚══════╝
                                                            
local opts = { noremap = true, silent = true}

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

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

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize  -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize  +2<CR>", opts)

-- Zoom vim pane, <C-w>= to re-balance
keymap("n", "<leader>-", ":wincmd _<cr>:wincmd |<cr>", opts)
keymap("n", "<leader>=", ":wincmd =<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- BufferLine
-- BufDel

-- Toggle word wrap
keymap("n", "<leader>tw", ":set wrap!<CR>", opts)

-- Clear highlight search
keymap("n", "<leader>l", ":nohlsearch<CR>", opts)

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
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

--TODO:
--Normal mode
--1. LazyGit Leader gg
--2. BufDel Delete buffer <Leader><db> :BufDel<CR>
--3. BufferLinePick Choose buffer to change <gb> :BufferLinePick<CR> 
--4. Blamer Toggle NO IDEA
--5. LSP normal
--6. LSP Telescope Code Actions 
--7. Trouble Toggle LSP
--8. Harpoon ThePrimeagen
--9. Telescope
--10. Dashboard Remaps
--11. Nvim Tree
--12. Vim commentary
--16. Insert date
--18. Sidebar Nvim Toggle
--Visual mode
--1. Commentary
--2. +y
--Insert mode
--1.Terminal mode
--2.Escape terminal mode
