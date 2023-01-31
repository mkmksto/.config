local setup, dap = pcall(require, "dap")
if not setup then
    return
end

local dapui_setup, dap_ui = pcall(require, "dapui")
if not dapui_setup then
    return
end

-- Dap Fires events before and after, trigger DAP UI when we see these events
-- https://youtu.be/H0J1c48NObc?t=5670
dap.listeners.after.event_initialized["dapui_config"] = function()
    dap_ui.open()
    vim.cmd("NvimTreeClose")
end

dap.listeners.before.event_initialized["dapui_config"] = function()
    dap_ui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
    dap_ui.close()
end

dap.adapters.python = {
    type = "executable",
    command = vim.fn.expand("~/my_programming_libraries/py_virtual_envs/debugpy/bin/python"),
    args = { "-m", "debugpy.adapter" },
}

-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#Python
dap.configurations.python = {
    {
        type = "python",
        name = "Launch file",
        request = "launch",
        -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

        program = "${file}", -- This configuration will launch the current file if used.
        pythonPath = function()
            -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
            -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
            -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
            local cwd = vim.fn.getcwd()
            if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
                return cwd .. "/venv/bin/python"
            elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
                return cwd .. "/.venv/bin/python"
            else
                return "/usr/bin/python3"
            end
        end,
    },
}

-- https://youtu.be/H0J1c48NObc?t=4990
local map = vim.api.nvim_set_keymap
map("n", "<F5>", '<cmd>lua require"dap".continue()<CR>', {})
map("n", "<F3>", '<cmd>lua require"dap".toggle_breakpoint()<CR>', {})
-- logpoint (breakpoints but simply print something to console/stdout)
map("n", "<C-l>", '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log Point Msg: "))<CR>', {})
map("n", "<F10>", '<cmd>lua require"dap".step_over()<CR>', {})
map("n", "<F11>", '<cmd>lua require"dap".step_into()<CR>', {})
map("n", "<F12>", '<cmd>lua require"dap".step_out()<CR>', {})
map("n", "<F6>", '<cmd>lua require"dap".repl.open()<CR>', {})
map("n", "<leader>bgl", '<cmd>lua require"dap".run_last()<CR>', {}) -- run last debugger

-- enter debug mode, remove nvim tree
map("n", "<leader>bgr", "<cmd>NvimTreeToggle<CR> <cmd>lua require'dapui'.toggle()<CR>", {}) -- run last debugger

---------------------------------------
-- DAP UI

dap_ui.setup()
