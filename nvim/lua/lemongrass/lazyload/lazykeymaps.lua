local keymap = vim.keymap
keymap.set(
    "n",
    "<leader>S",
    "<cmd>Spectre<CR>",
    { desc = "[Spectre] Open Spectre search and replace", noremap = true, silent = true }
)
