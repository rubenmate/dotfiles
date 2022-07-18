local has_dap, dap = pcall(require, "dap")
if not has_dap then
    return
end

-- Setup cool Among Us as avatar
vim.fn.sign_define("DapStopped", { text = "ඞ", texthl = "Error" })

-- Dap-UI
local dapui = require "dapui"

-- nvim-dap-virtual-text
require("nvim-dap-virtual-text").setup()

-- Dap-UI
dapui.setup()
-- Go: Configured via nvim-dap-go(https://github.com/leoluz/nvim-dap-go)
-- FIXME: Config seems fine but debug server is not starting properly
require("dap-go").setup()
-- Python: Configured via dap-python
require("dap-python").setup "~/.virtualenvs/debugpy/bin/python"

-- Automatically open/close dapui when dap is initalized or exited
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

-- Keymaps
local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

keymap("n", "<F5>", "<cmd>lua require'dap'.continue()<CR>", opts)
keymap("n", "<F6>", "<cmd>lua require'dap'.step_over()<CR>", opts)
keymap("n", "<F7>", "<cmd>lua require'dap'.step_into()<CR>", opts)
keymap("n", "<F8>", "<cmd>lua require'dap'.step_out()<CR>", opts)
keymap("n", "<leader>b", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
keymap(
    "n",
    "<leader>B",
    "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
    opts
)
keymap(
    "n",
    "<leader>lp",
    "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
    opts
)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.open()<CR>", opts)

dap.adapters.node2 = {
    type = "executable",
    command = "node",
    args = { os.getenv "HOME" .. "/sources/microsoft/vscode-node-debug2/out/src/nodeDebug.js" },
}
dap.configurations.javascript = {
    {
        name = "Launch",
        type = "node2",
        request = "launch",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
        console = "integratedTerminal",
    },
    {
        -- For this to work you need to make sure the node process is started with the `--inspect` flag.
        name = "Attach to process",
        type = "node2",
        request = "attach",
        processId = require("dap.utils").pick_process,
    },
}

dap.configurations.typescript = {
    {
        name = "Launch",
        type = "node2",
        request = "launch",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
        console = "integratedTerminal",
    },
    {
        -- For this to work you need to make sure the node process is started with the `--inspect` flag.
        name = "Attach to process",
        type = "node2",
        request = "attach",
        processId = require("dap.utils").pick_process,
    },
}
