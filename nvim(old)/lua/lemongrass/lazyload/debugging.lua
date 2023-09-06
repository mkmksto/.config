local setup, dap = pcall(require, "dap")
if not setup then
    return
end

local dapui_setup, dap_ui = pcall(require, "dapui")
if not dapui_setup then
    return
end

----------------------------
-- Open or close DAP UI based on DAP events

-- Dap Fires events before and after, trigger DAP UI when we see these events
-- https://youtu.be/H0J1c48NObc?t=5670
dap.listeners.after.event_initialized["dapui_config"] = function()
    dap_ui.open()
    vim.cmd("NvimTreeClose")
    -- require("dap.ext.vscode").load_launchjs()
end

dap.listeners.before.event_initialized["dapui_config"] = function()
    -- require("dap.ext.vscode").load_launchjs()
    dap_ui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
    dap_ui.close()
end

----------------------------------------------------------------
-- DAP adapters config
--

-- dap.adapters.chrome = {
--     type = "executable",
--     command = "node",
--     args = {
--         vim.fn.expand("~/my_programming_libraries/js_debug_adapters/vscode_chrome_debug/out/src/chromeDebug.js"),
--     },
-- }

-- dap.adapters.firefox = {
--     type = "executable",
--     command = "node",
--     args = {
--         vim.fn.expand("~/my_programming_libraries/js_debug_adapters/vscode_firefox_debug/dist/adapter.bundle.js"),
--     },
-- }

-- dap.configurations.typescript = {
--     {
--         name = "Debug with Firefox",
--         type = "firefox",
--         request = "launch",
--         reAttach = true,
--         url = "http://localhost:5173",
--         webRoot = "${workspaceFolder}/frontend",
--         firefoxExecutable = "/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/lib/firefox/firefox-bin",
--         skipFiles = {
--             "<node_internals>/**",
--             "node_modules/**",
--             "**/node_modules/*",
--             "**/<node_internals>/*",
--             "dist/**",
--             "build/**",
--             "**/build/**",
--             "index.js",
--             "**/index.js",
--         },
--     },
--     {
--         name = "chrome debug",
--         type = "chrome",
--         request = "attach",
--         program = "${file}",
--         cwd = vim.fn.getcwd(),
--         sourceMaps = true,
--         protocol = "inspector",
--         port = 5173,
--         webRoot = "${workspaceFolder}/frontend",
--         skipFiles = {
--             "<node_internals>/**",
--             "node_modules/**",
--             "dist/**",
--             "build/**",
--             "**/build/**",
--         },
--     },
-- }

-- dap.configurations.vue = {
--     {
--         name = "Debug with Firefox",
--         type = "firefox",
--         request = "launch",
--         reAttach = true,
--         url = "http://localhost:5173",
--         webRoot = "${workspaceFolder}/frontend",
--         firefoxExecutable = "/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/lib/firefox/firefox-bin",
--         skipFiles = {
--             "<node_internals>/**",
--             "node_modules/**",
--             "**/node_modules/*",
--             "**/<node_internals>/*",
--             "dist/**",
--             "build/**",
--             "**/build/**",
--             "index.js",
--             "**/index.js",
--         },
--     },
--     {
--         name = "chrome debug",
--         type = "chrome",
--         request = "attach",
--         program = "${file}",
--         cwd = vim.fn.getcwd(),
--         sourceMaps = true,
--         protocol = "inspector",
--         port = 5173,
--         webRoot = "${workspaceFolder}/frontend",
--         skipFiles = {
--             "<node_internals>/**",
--             "node_modules/**",
--             "dist/**",
--             "build/**",
--             "**/build/**",
--         },
--     },
-- }

-- dap.configurations.javascript = {
--     {
--         name = "Debug with Firefox",
--         type = "firefox",
--         request = "launch",
--         reAttach = true,
--         url = "http://localhost:5173",
--         webRoot = "${workspaceFolder}/frontend",
--         firefoxExecutable = "/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/lib/firefox/firefox-bin",
--         skipFiles = {
--             "<node_internals>/**",
--             "node_modules/**",
--             "**/node_modules/*",
--             "**/<node_internals>/*",
--             "dist/**",
--             "build/**",
--             "**/build/**",
--             "index.js",
--             "**/index.js",
--         },
--     },
--     {
--         name = "chrome debug",
--         type = "chrome",
--         request = "attach",
--         program = "${file}",
--         cwd = vim.fn.getcwd(),
--         sourceMaps = true,
--         protocol = "inspector",
--         port = 5173,
--         webRoot = "${workspaceFolder}/frontend",
--         skipFiles = {
--             "<node_internals>/**",
--             "node_modules/**",
--             "dist/**",
--             "build/**",
--             "**/build/**",
--         },
--     },
-- }

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
            elseif vim.fn.executable(cwd .. "/backend/venv/bin/python") == 1 then
                return cwd .. "/backend/venv/bin/python"
            else
                return "/usr/bin/python3"
            end
        end,
    },
    {
        name = "Python: Flask",
        type = "python",
        request = "launch",
        -- stopOnEntry = "false",
        pythonPath = function()
            -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
            -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
            -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
            local cwd = vim.fn.getcwd()
            if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
                return cwd .. "/venv/bin/python"
            elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
                return cwd .. "/.venv/bin/python"
            elseif vim.fn.executable(cwd .. "/backend/venv/bin/python") == 1 then
                return cwd .. "/backend/venv/bin/python"
            else
                return "/usr/bin/python3"
            end
        end,
        program = "${workspaceFolder}/app.py",
        env = {
            FLASK_APP = "${workspaceRoot}/app.py",
        },
        args = { "run" },
        envFile = "${workspaceFolder/backend/venv}",
    },
}

-----------------------------------------------
--
--
--
--
--
--
--
-- DAP remaps

-- https://youtu.be/H0J1c48NObc?t=4990
local map = vim.api.nvim_set_keymap
map("n", "<F5>", '<cmd>lua require"dap".continue()<CR>', { desc = "[DAP] continue" })
map("n", "<F3>", '<cmd>lua require"dap".toggle_breakpoint()<CR>', { desc = "[DAP] toggle breakpoint" })
-- logpoint (breakpoints but simply print something to console/stdout)
map(
    "n",
    "<C-l>",
    '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log Point Msg: "))<CR>',
    { desc = "[DAP] breakpoint: Log Point Msg" }
)

map("n", "<Right>", '<cmd>lua require"dap".step_over()<CR>', { desc = "[DAP] step over" })
map("n", "<Left>", '<cmd>lua require"dap".step_back()<CR>', { desc = "[DAP] step back" })
map("n", "<Down>", '<cmd>lua require"dap".step_into()<CR>', { desc = "[DAP] step into (goes inside function calls )" })
map(
    "n",
    "<Up>",
    '<cmd>lua require"dap".step_out()<CR>',
    { desc = "[DAP] step out (exit from inner call stack, i.e. from step into)" }
)

map("n", "<F6>", '<cmd>lua require"dap".repl.open()<CR>', { desc = "[DAP] open REPL" })
map("n", "<leader>bgl", '<cmd>lua require"dap".run_last()<CR>', { desc = "[DAP] run last debugger" })

-- enter debug mode, remove nvim tree
map(
    "n",
    "<leader>bgt",
    "<cmd>NvimTreeToggle<CR> <cmd>lua require'dapui'.toggle()<CR>",
    { desc = "[DAP] run last debugger" }
)

---------------------------------------
--
--
--
--
--
--
-- DAP UI

dap_ui.setup()

-- https://github.com/mfussenegger/nvim-dap/discussions/355
vim.api.nvim_set_hl(0, "blue", { fg = "#3d59a1" })
vim.api.nvim_set_hl(0, "green", { fg = "#9ece6a" })
vim.api.nvim_set_hl(0, "yellow", { fg = "#FFFF00" })
vim.api.nvim_set_hl(0, "orange", { fg = "#f09000" })

vim.fn.sign_define(
    "DapBreakpoint",
    { text = "", texthl = "blue", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.fn.sign_define(
    "DapBreakpointCondition",
    { text = "ﳁ", texthl = "blue", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.fn.sign_define(
    "DapBreakpointRejected",
    { text = "", texthl = "orange", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.fn.sign_define("DapLogPoint", { text = "", texthl = "yellow", linehl = "DapLogPoint", numhl = "DapLogPoint" })
vim.fn.sign_define("DapStopped", { text = "", texthl = "green", linehl = "DapStopped", numhl = "DapStopped" })
