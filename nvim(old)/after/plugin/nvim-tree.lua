-- local setup, nvimtree = pcall(require, "nvim-tree")
-- if not setup then
--     return
-- end
--
-- -- nvim tree recs
-- vim.g.loaded = 1
-- vim.g.loaded_netrwPlugin = 1
--
-- vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])
--
-- nvimtree.setup({
--     -- makes it so that having the explorer and window splits works properly
--     actions = {
--         open_file = {
--             window_picker = {
--                 enable = false,
--             },
--         },
--     },
-- })
--
-- -- https://github.com/nvim-tree/nvim-tree.lua/wiki/Open-At-Startup
-- local function open_nvim_tree(data)
--     -- buffer is a directory
--     local directory = vim.fn.isdirectory(data.file) == 1
--
--     if not directory then
--         return
--     end
--
--     -- change to the directory
--     vim.cmd.cd(data.file)
--
--     -- open the tree
--     require("nvim-tree.api").tree.open()
-- end
-- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
