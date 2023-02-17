-- Lazyloading instructions and caveats
--
--
-- Toggleterm:
-- just type :Toggleterm first to get the shortcuts to the other toggleterm commands
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
    "leaderss",
    "<cmd>PasteImg<CR>",
    { desc = "[Clipboard Image] Paste image from clipboard into markdown file", noremap = true, silent = true }
)
