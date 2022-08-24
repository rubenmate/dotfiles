local status_ok, mind = pcall(require, "mind")
if not status_ok then
    return
end

require("mind").setup {
    persistence = {
        state_path = "~/mind/mind.json",
        data_dir = "~/mind/data",
    },

    ui = {
        width = 40,
    },
}

local opts = { noremap = true, silent = true }

local keymap = vim.keymap.set

keymap("n", "<leader>mm", "<cmd>MindOpenMain<CR>", opts)
keymap("n", "<leader>mp", "<cmd>MindOpenProject<CR>", opts)
keymap("n", "<leader>mr", "<cmd>MindReloadState<CR>", opts)
keymap("n", "<leader>mj", function()
    require("mind").wrap_main_tree_fn(function(args)
        local path = vim.fn.strftime "/Journal/%Y/%b/%d"
        local _, node = require("mind.node").get_node_by_path(args.tree, path, true)

        if node == nil then
            vim.notify("cannot open journal 🙁", vim.log.levels.WARN)
            return
        end

        require("mind.commands").open_data(args.tree, node, args.data_dir, args.opts)
        require("mind.state").save_state(args.opts)
    end)
end, opts)
keymap("n", "<leader>mi", function()
    vim.notify "initializing local tree"
    require("mind").wrap_project_tree_fn(function(args)
        local mind_node = require "mind.node"

        local _, tasks = mind_node.get_node_by_path(args.tree, "/Tasks", true)
        tasks.icon = " "

        local _, backlog = mind_node.get_node_by_path(args.tree, "/Tasks/Backlog", true)
        backlog.icon = " "

        local _, on_going = mind_node.get_node_by_path(args.tree, "/Tasks/On-going", true)
        on_going.icon = " "

        local _, done = mind_node.get_node_by_path(args.tree, "/Tasks/Done", true)
        done.icon = " "

        local _, cancelled = mind_node.get_node_by_path(args.tree, "/Tasks/Cancelled", true)
        cancelled.icon = " "

        local _, notes = mind_node.get_node_by_path(args.tree, "/Notes", true)
        notes.icon = " "

        require("mind.state").save_state(args.opts)
    end)
end, opts)

-- Default Keymaps
--     normal = {
--       ["<cr>"] = "open_data",
--       ["<tab>"] = "toggle_node",
--       ["/"] = "select_path",
--       I = "add_inside_start",
--       i = "add_inside_end",
--       d = "delete",
--       O = "add_above",
--       o = "add_below",
--       q = "quit",
--       r = "rename",
--       R = "change_icon",
--       u = "make_url",
--       x = "select",
--     }
--
--     selection = {
--       ["<cr>"] = "open_data",
--       ["<tab>"] = "toggle_node",
--       ["/"] = "select_path",
--       I = "move_inside_start",
--       i = "move_inside_end",
--       O = "move_above",
--       o = "move_below",
--       q = "quit",
--       x = "select",
--     }
