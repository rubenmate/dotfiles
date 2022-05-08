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
require("colorbuddy").colorscheme "gruvbuddy"
-- FIXME: Add this to a fork of colorbuddy
vim.cmd "highlight ColorColumn guibg =#414754"
vim.cmd "highlight WinSeparator guibg =#414754"
vim.cmd [[highlight NormalFloat guibg=#282c34]]
vim.cmd [[highlight FloatBorder guifg=white guibg=#282c34]]

-- Set your prefered colorscheme
-- vim.cmd([[
-- try
--   colorscheme dracula
-- catch /^Vim\%((\a\+)\)\=:E185/
--   colorscheme default
--   set background=dark
-- endtry
-- ]])
