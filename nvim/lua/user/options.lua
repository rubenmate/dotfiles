-- :help options
vim.opt.backup = false                          -- creates a backup file
vim.opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
vim.opt.cmdheight = 2                           -- more space in the neovim command line for displaying messages
vim.opt.completeopt = { "menuone", "noselect" } -- just for cmp
vim.opt.conceallevel = 0                        -- so `` is visible in markdown files
vim.opt.fileencoding = "utf-8"                  -- utf-8 encoding
vim.opt.hlsearch = true                         -- highlight all matches on search pattern
vim.opt.ignorecase = true                       -- ignore case in search patterns
vim.opt.mouse = "a"                             -- allow the mouse to be used in neovim
vim.opt.pumheight = 10                          -- popup menu height
vim.opt.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 2                         -- always show tabs
vim.opt.smartcase = true                        -- smart case when searching
vim.opt.smartindent = true                      -- enable smart indenting
vim.opt.splitbelow = true                       -- force horizontal splits to go below current window
vim.opt.splitright = true                       -- force vertical splits to go below current window
vim.opt.swapfile = false                        -- creates a swapfile
-- vim.opt.termguicolors = true                    -- probably not needed, most terminals support this 
vim.opt.timeoutlen = 1000                       -- time to wait for a mapped keycombination to complete (ms)
vim.opt.undofile = true                         -- enable persistent undo
vim.opt.updatetime = 300                        -- faster completion (4000 ms default)
vim.opt.writebackup = false                     -- if a file is being edited by another program (or written with another program) it is not allowed to be edited
vim.opt.expandtab = true                        -- convert tabss to spaces
vim.opt.shiftwidth = 2                          -- the number of spaces for each indentation
vim.opt.tabstop = 2                             -- inser 2 spaces for a tab
vim.opt.cursorline = false                      -- highlight current line
vim.opt.number = true                           -- set numbered lines
vim.opt.relativenumber = true                   -- set relative numbered lines
vim.opt.numberwidth = 2                         -- set number column width to 2 (default 4)
vim.opt.signcolumn = "yes"                      -- always show the sign column
vim.opt.wrap = false                            -- display long lines as one long line
vim.opt.scrolloff = 8                           -- determines the number of context lines you see above and below of the cursor (when possible)
vim.opt.sidescrolloff = 8                       -- determines the number of context lines you see at the right and left of the cursor (when possible)
vim.opt.guifont = "monospace:h17"               -- the font used in graphical neovim applications

vim.opt.shortmess:append "c"                    -- TODO: Explore this

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
