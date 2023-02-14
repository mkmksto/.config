local setup, projections = pcall(require, "projections")
if not setup then
    return
end

projections.setup({
    workspaces = {
        { "~/Documents/Github-repos/", { ".git" } },
        { "~/Documents/reference-repos/", { ".git" } },
        { "~/Documents/", { ".git" } },
        { "~/", { ".git" } }, -- for .config, dotfiles, etc.
        -- { "~/dotfiles/", { ".git" } },
    },
})

require("telescope").load_extension("projections")

local map = vim.keymap.set
map("n", "<leader>pro", "<cmd>Telescope projections<CR>", { desc = "[Telescope] Projections project manager" })
