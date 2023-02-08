local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
    return
end

local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
    return
end

local builtin = require("telescope.builtin")
-- -- project files
-- vim.keymap.set("n", "<C-p>", builtin.find_files, {})
-- -- fuzzy finding (git file search)
-- vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
--
-- something similar @ remap.lua (except that one only searches inside files, this one includes the file names)
vim.keymap.set("n", "<leader>ps", function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

-- live grep over all of my projects and notes
vim.keymap.set("n", "<leader>nts", function()
    builtin.live_grep({
        search_dirs = { "~/Documents/Github-repos/", "~/Documents/notes/", "~/Documents/reference-repos/" },
    })
end)

telescope.setup({
    defaults = {
        mappings = {
            i = {
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            },
        },
        file_ignore_patterns = {
            "static",
            "templates",
            "**/pnpm%-lock.yaml",
            "**/package%-lock.json",
            "dictionary_files",
            ".json",
            ".ico",
            ".jpg",
            ".jpeg",
            ".png",
            ".gif",
            ".svg",
        },
    },
    -- -- doesn't work
    -- extensions = {
    --     live_grep_args = {
    --         search_dirs = { "~/Documents/Github-repos/" },
    --     },
    -- },
})

telescope.load_extension("fzf")
