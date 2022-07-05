--
--     ██████╗ ██████╗ ██╗      ██████╗ ██████╗
--    ██╔════╝██╔═══██╗██║     ██╔═══██╗██╔══██╗
--    ██║     ██║   ██║██║     ██║   ██║██████╔╝
--    ██║     ██║   ██║██║     ██║   ██║██╔══██╗
--    ╚██████╗╚██████╔╝███████╗╚██████╔╝██║  ██║
--     ╚═════╝ ╚═════╝ ╚══════╝ ╚═════╝ ╚═╝  ╚═╝
--███████╗ ██████╗██╗  ██╗███████╗███╗   ███╗███████╗
--██╔════╝██╔════╝██║  ██║██╔════╝████╗ ████║██╔════╝
--███████╗██║     ███████║█████╗  ██╔████╔██║█████╗
--╚════██║██║     ██╔══██║██╔══╝  ██║╚██╔╝██║██╔══╝
--███████║╚██████╗██║  ██║███████╗██║ ╚═╝ ██║███████╗
--╚══════╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝╚══════╝
--
-- require("colorbuddy").colorscheme "gruvbuddy"
-- -- FIXME: Add this to a fork of colorbuddy
-- vim.cmd "highlight ColorColumn guibg=#414754"
-- vim.cmd "highlight WinSeparator guifg=#414754 guibg=#282c34]]"
-- vim.cmd [[highlight NormalFloat guibg=#282c34]]
-- vim.cmd [[highlight FloatBorder guifg=white guibg=#282c34]]

-- DiffAdd		diff mode: Added line |diff.txt|
-- 							*hl-DiffChange*
-- DiffChange	diff mode: Changed line |diff.txt|
-- 							*hl-DiffDelete*
-- DiffDelete	diff mode: Deleted line |diff.txt|
-- 							*hl-DiffText*
-- DiffText	diff mode: Changed text within a changed line |diff.txt|
-- 							*hl-EndOfBuffer*
--
-- Set your prefered colorscheme
-- Lua
-- vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
vim.cmd [[
try
  colorscheme dracula
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
