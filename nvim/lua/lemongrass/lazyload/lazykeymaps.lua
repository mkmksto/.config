-- Lazyloading instructions and caveats
--
--
--

local keymap = vim.keymap
keymap.set(
    "n",
    "<leader>S",
    "<cmd>Spectre<CR>",
    { desc = "[Spectre] Open Spectre search and replace", noremap = true, silent = true }
)

-- DAP Debugging (for lazy loading)
local map = vim.api.nvim_set_keymap
map("n", "<F5>", "<cmd>DapContinue<CR>", { desc = "[DAP] continue" })
map("n", "<F3>", "<cmd>DapToggleBreakpoint<CR>", { desc = "[DAP] toggle breakpoint" })

keymap.set(
    "n",
    "<leader>ss",
    "<cmd>PasteImg<CR>",
    { desc = "[Clipboard Image] Paste image from clipboard into markdown file", noremap = true, silent = true }
)

keymap.set("n", "<leader>pro", "<cmd>Telescope projections<CR>", { desc = "[Telescope] Projections project manager" })

---------------------
-- Refactoring
--
--
--
--
--
--
-- Remaps for the refactoring operations currently offered by the plugin
vim.api.nvim_set_keymap(
    "v",
    "<leader>re",
    [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
    { noremap = true, silent = true, expr = false, desc = "[Refactoring] Extract to function" }
)

vim.api.nvim_set_keymap(
    "v",
    "<leader>rf",
    [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],
    { noremap = true, silent = true, expr = false, desc = "[Refactoring] Extract function to file" }
)

vim.api.nvim_set_keymap(
    "v",
    "<leader>rv",
    [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]],
    { noremap = true, silent = true, expr = false, desc = "[Refactoring] Extract Variable" }
)

vim.api.nvim_set_keymap(
    "v",
    "<leader>ri",
    [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
    { noremap = true, silent = true, expr = false, desc = "[Refactoring] Inline variable" }
)

-- Extract block doesn't need visual mode
vim.api.nvim_set_keymap(
    "n",
    "<leader>rb",
    [[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]],
    { noremap = true, silent = true, expr = false, desc = "[Refactoring] Extract Block" }
)

vim.api.nvim_set_keymap(
    "n",
    "<leader>rbf",
    [[ <Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>]],
    { noremap = true, silent = true, expr = false, desc = "[Refactoring] Extract block to file" }
)

-- Inline variable can also pick up the identifier currently under the cursor without visual mode
vim.api.nvim_set_keymap(
    "n",
    "<leader>ri",
    [[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
    { noremap = true, silent = true, expr = false, desc = "[Refactoring] Inline variable" }
)

---------------------------------------------
-- Toggleterm
-- these are dummy keymaps just so that they show up when i open telescope's keymaps
-- the real keymaps are inside the toggleterm file
--
--
--
--
--

vim.keymap.set(
    { "n", "t" },
    "<C-`>",
    "<Esc><C-\\><C-n><cmd>ToggleTermToggleAll<CR>",
    { desc = "[Toggleterm] Toggle all terminals" }
)
vim.keymap.set(
    "n",
    "<leader>tpy",
    ":lua _PYTHON_TOGGLE()<CR>",
    { desc = "[Toggleterm] Toggle Python floating terminal" }
)
vim.keymap.set(
    "n",
    "<leader>tjs",
    ":lua _NODE_TOGGLE()<CR>",
    { desc = "[Toggleterm] Toggle NODE JS floating terminal" }
)
vim.keymap.set("n", "<leader>fl", ":lua _FLOATING_TOGGLE()<CR>", { desc = "[Toggleterm] Toggle floating terminal" })
vim.keymap.set("n", "<leader>htop", ":lua _HTOP_TOGGLE()<CR>", { desc = "[Toggleterm] Toggle floating HTOP terminal" })
vim.keymap.set(
    "n",
    "<leader>lz",
    ":lua _LAZYGIT_TOGGLE()<CR>",
    { desc = "[Toggleterm] Toggle floating Lazygit terminal" }
)

-- docstrings
keymap.set(
    { "n" },
    "<leader>dpy",
    "<cmd>DogeGenerate google<CR>",
    { desc = "[Doge] Generate Python docs docstrings in google standard", noremap = true, silent = true }
)
keymap.set(
    { "n" },
    "<leader>djs",
    "<cmd>DogeGenerate jsdoc<CR>",
    { desc = "[Doge] Generate JSdoc docstrings", noremap = true, silent = true }
)

-- neoclip
keymap.set(
    "n",
    "<leader>nc",
    "<cmd>Telescope neoclip<CR>",
    { desc = "[Telescope] open neoclip clipboard manager", silent = true, noremap = true }
)

keymap.set(
    "n",
    "<leader>tmcr",
    "<cmd>lua require('telescope').extensions.macroscope.default()<CR>",
    { desc = "[Telescope] open neoclip macroscope for macro history", silent = true, noremap = true }
)

keymap.set(
    "n",
    "<leader>tnctog",
    "<cmd>lua require('neoclip').toggle()<CR>",
    { desc = "[Telescope] (toggle) start or stop neoclip", silent = true, noremap = true }
)

-- telescope repo
keymap.set("n", "<leader>trepo", "<cmd>Telescope repo<cr>", { desc = "[Telescope] browse your repositories" })
