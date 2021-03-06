-- Lualine configuration
-- Required to fix lualine going blank when reloading init.lua
-- require("plenary.reload").reload_module("lualine", true)
local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

local hide_in_width = function()
    return vim.fn.winwidth(0) > 80
end

vim.o.winbar = " %=%m %f%{%v:lua.require'nvim-navic'.get_location()%}"

local diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    sections = { "error", "warn" },
    symbols = { error = " ", warn = " " },
    colored = false,
    update_in_insert = false,
    always_visible = true,
}

local diff = {
    "diff",
    colored = false,
    symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
    cond = hide_in_width,
}

local mode = {
    "mode",
    fmt = function(str)
        return "-- " .. str .. " --"
        -- return str
    end,
}

local filetype = {
    "filetype",
    icons_enabled = false,
    icon = nil,
}

local branch = {
    "branch",
    icons_enabled = true,
    icon = "",
}

local location = {
    "location",
    padding = 1,
}

-- cool function for progress
local progress = function()
    local current_line = vim.fn.line "."
    local total_lines = vim.fn.line "$"
    local chars = {
        "__",
        "▁▁",
        "▂▂",
        "▃▃",
        "▄▄",
        "▅▅",
        "▆▆",
        "▇▇",
        "██",
    }
    local line_ratio = current_line / total_lines
    local index = math.ceil(line_ratio * #chars)
    return chars[index]
end

lualine.setup {
    options = {
        globalstatus = true,
        icons_enabled = true,
        theme = "catppuccin",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
            "alpha",
            "dashboard",
            "NvimTree",
            "Outline",
            "NeogitStatus",
            "toggleterm",
            "TelescopePrompt",
        },
        always_divide_middle = true,
    },
    sections = {
        lualine_a = { mode },
        lualine_b = { branch, diagnostics },
        lualine_c = {
            "%=%m", -- Used to center this sections
            {
                file_status = false, -- Displays file status (readonly status, modified status)
                "filename",
                -- 0: Just the filename
                -- 1: Relative path
                -- 2: Absolute path
                path = 1,
            },
            {
                "filetype",
                colored = false,
                icon_only = true,
                padding = {
                    left = -1, --[[ , right = right_padding  ]]
                },
                icon = { align = "right" }, -- Display filetype icon on the right hand side
            },
        },
        -- lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_x = { diff, filetype },
        lualine_y = { progress },
        lualine_z = { location },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { --[[ "filename" ]]
        },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    extensions = {},
}
