local spectre_setup, spectre = pcall(require, "spectre")
if not spectre_setup then
    return
end

spectre.setup()

local keymap = vim.keymap
local opts = { noremap = true, silent = true }
keymap.set("n", "<leader>S", "<cmd>lua require('spectre').open()<CR>", opts)
keymap.set({ "n" }, "<leader>sw", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", opts)

-- testing spectre xixihahx
-- hahahahx
-- haha ha haha
