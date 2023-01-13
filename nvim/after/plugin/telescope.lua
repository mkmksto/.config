local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
    return
end

local actions_setup, actions = pcall(require, "telescope.actions")
if not telescope_setup then
    return
end

local builtin = require("telescope.builtin")
-- project files
vim.keymap.set("n", "<C-p>", builtin.find_files, {})
-- fuzzy finding (git file search)
vim.keymap.set("n", "<leader>pf", builtin.git_files, {})

-- something similar @ remap.lua (except that one only searches inside files, this one includes the file names)
vim.keymap.set("n", "<leader>ps", function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
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
    },
})

telescope.load_extension("fzf")
