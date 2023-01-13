local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
    return
end

-- nvim tree recs
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

nvimtree.setup({
    -- makes it so that having the explorer and window splits works properly
    actions = {
        open_file = {
            window_picker = {
                enable = false,
            },
        },
    },
})
