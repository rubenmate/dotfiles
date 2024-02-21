vim.g.mapleader = " "

local opt = vim.opt
opt.number = true -- Print line number
opt.relativenumber = true -- Relative line numbers
opt.scrolloff = 8 -- Lines of context
opt.expandtab = true -- Use spaces for indentation
opt.tabstop = 4 -- Tab width
opt.softtabstop = 4 -- Soft tab width
opt.shiftwidth = 4 -- Indentation width
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.cursorline = true -- Enable highlighting of the current line
opt.inccommand = "nosplit" -- preview incremental substitute
opt.laststatus = 3 -- global statusline
opt.list = true -- Show some invisible characters (tabs...
opt.showmode = false -- Dont show mode since we have a statusline
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.spelllang = { "en" }
opt.termguicolors = true -- True color support
opt.guicursor = "n:blinkon1" -- Always block mode cursor, blink
opt.wrap = false -- Disable line wrap
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.fillchars = {
	foldopen = "",
	foldclose = "",
	-- fold = "⸱",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}
opt.undofile = true
opt.undolevels = 10000
opt.swapfile = false

-- TODO: Check what do these options exactly
-- opt.autowrite = true -- Enable auto write
-- opt.completeopt = "menu,menuone,noselect"
-- opt.conceallevel = 3 -- Hide * markup for bold and italic
-- opt.formatoptions = "jcroqlnt" -- tcqj
-- opt.grepformat = "%f:%l:%c:%m"
-- opt.grepprg = "rg --vimgrep"
-- opt.ignorecase = true -- Ignore case
-- opt.pumblend = 10 -- Popup blend
-- opt.pumheight = 10 -- Maximum number of entries in a popup
-- opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
-- opt.shiftround = true -- Round indent
-- opt.shortmess:append({ W = true, I = true, c = true, C = true })
-- opt.smartcase = true -- Don't ignore case with capitals
-- opt.smartindent = true -- Insert indents automatically
-- opt.splitbelow = true -- Put new windows below current
-- opt.splitkeep = "screen"
-- opt.splitright = true -- Put new windows right of current
-- opt.timeoutlen = 300
-- opt.updatetime = 200 -- Save swap file and trigger CursorHold
-- opt.winminwidth = 5 -- Minimum window width
