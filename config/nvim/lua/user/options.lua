--
--  ██████╗ ██████╗ ████████╗██╗ ██████╗ ███╗   ██╗███████╗
-- ██╔═══██╗██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
-- ██║   ██║██████╔╝   ██║   ██║██║   ██║██╔██╗ ██║███████╗
-- ██║   ██║██╔═══╝    ██║   ██║██║   ██║██║╚██╗██║╚════██║
-- ╚██████╔╝██║        ██║   ██║╚██████╔╝██║ ╚████║███████║
--  ╚═════╝ ╚═╝        ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
--
local options = {
    backup = false, -- creates a backup file
    clipboard = "unnamedplus", -- allows neovim to access the system clipboard
    cmdheight = 0, -- more space in the neovim command line for displaying messages
    completeopt = { "menuone", "noselect" }, -- just for cmp
    conceallevel = 0, -- so `` is visible in markdown files
    fileencoding = "utf-8", -- utf-8 encoding
    hlsearch = true, -- highlight all matches on search pattern
    ignorecase = true, -- ignore case in search patterns
    mouse = "a", -- allow the mouse to be used in neovim
    pumheight = 10, -- popup menu height
    showmode = false, -- we don't need to see things like -- INSERT -- anymore
    showtabline = 2, -- always show tabs
    smartcase = true, -- smart case when searching
    smartindent = true, -- enable smart indenting
    splitbelow = true, -- force horizontal splits to go below current window
    splitright = true, -- force vertical splits to go below current window
    swapfile = false, -- creates a swapfile
    termguicolors = true, -- most terminals support this
    timeoutlen = 500, -- time to wait for a mapped keycombination to complete (ms)
    undofile = true, -- enable persistent undo
    updatetime = 300, -- faster completion (4000 ms default)
    writebackup = false, -- if a file is being edited by another program (or written with another program) it is not allowed to be edited
    expandtab = true, -- convert tabs to spaces
    shiftwidth = 4, -- the number of spaces for each indentation
    tabstop = 4, -- insert 2 spaces for a tab
    cursorline = false, -- highlight current line
    number = true, -- set numbered lines
    relativenumber = true, -- set relative numbered lines
    numberwidth = 2, -- set number column width to 2 (default 4)
    signcolumn = "yes", -- always show the sign column
    wrap = false, -- display long lines as one long line
    scrolloff = 8, -- determines the number of context lines you see above and below of the cursor (when possible)
    sidescrolloff = 8, -- determines the number of context lines you see at the right and left of the cursor (when possible)
    guifont = "monospace:h17", -- the font used in graphical neovim applications
    textwidth = 100,
    colorcolumn = "101", -- Highlight column after textwidth
    list = true, -- Show hidden chracters, config below
    listchars = { -- Chracters to show
        tab = "  ",
        trail = ".",
    },
}

vim.opt.shortmess:append "c" -- TODO: Explore this

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
