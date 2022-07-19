local status_ok, nvim_tmux_navigation = pcall(require, "nvim-tmux-navigation")
if not status_ok then
    return
end

nvim_tmux_navigation.setup {
    disable_when_zoomed = true,
}

local opts = { silent = true, noremap = true }

vim.keymap.set("n", "<A-k>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateUp()<CR>", opts)
vim.keymap.set("n", "<A-j>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateDown()<CR>", opts)
vim.keymap.set("n", "<A-h>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateLeft()<CR>", opts)
vim.keymap.set("n", "<A-l>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateRight()<CR>", opts)
