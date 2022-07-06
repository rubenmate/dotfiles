local options = {
    wrap = true, -- display long lines as one long line
    textwidth = 0,
    colorcolumn = "",
}

vim.opt.shortmess:append "c" -- TODO: Explore this

for k, v in pairs(options) do
    vim.opt[k] = v
end
