-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = false

-- Make relative line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

-- determines the number of context lines you see above and below (and l/r) of the cursor (when possible)
vim.wo.scrolloff = 8
vim.wo.sidescrolloff = 8

-- Enable mouse mode
vim.o.mouse = 'a'

-- Highlight column which should be the text width (just visually)
vim.o.colorcolumn = "101"

-- Show hidden chracters, config below
-- vim.o.list = true
-- vim.o.listchars = "trail:."

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'
