return {
    {
        "b0o/incline.nvim", -- Floating statuslines (filename)
        opts = {
            hide = {
                -- If `"focused_win"`, the Incline statusline for the focused window 
                -- will be hidden if the cursor is on the same line.
                cursorline = "focused_win"
            },
        },
    },
    {
        "folke/noice.nvim", -- Ui for cmdline, messages and popupmenu
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        }
    }
}
