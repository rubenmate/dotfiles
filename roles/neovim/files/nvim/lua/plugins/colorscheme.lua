return {
    "mcchrish/zenbones.nvim", -- Colorscheme
    dependencies = {
        "rktjmp/lush.nvim",
    },
    config = function()
        vim.cmd("set termguicolors")
        vim.cmd("set background=dark")
        vim.cmd("colorscheme zenbones")
    end,
}
