local spectre_setup, spectre = pcall(require, "spectre")
if not spectre_setup then
    return
end

spectre.setup()

local keymap = vim.keymap
keymap.set(
    { "n" },
    "<leader>sw",
    "<cmd>lua require('spectre').open_visual({select_word=true})<CR>",
    { desc = "[Spectre] Search and replace using word under cursor", noremap = true, silent = true }
)
