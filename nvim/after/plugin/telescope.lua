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
end, { desc = "[Telescope] Search through all of my repos, reference repos and notes (live grep, live_grep)" })

-- live grep over the python docs (searches for functions)
vim.keymap.set("n", "<leader>pfun", function()
    builtin.live_grep({
        search_dirs = {
            "~/.config/telescope_programming_docs/library_python/",
            "~/.config/telescope_programming_docs/python3-2022/",
        },
        default_text = "^",
    })
end, { desc = "[Telescope] Search inside the python docs (particularly [F]unctions) (live grep, live_grep)" })

-- live grep over the python docs (searches for functions)
vim.keymap.set("n", "<leader>jfun", function()
    builtin.live_grep({
        search_dirs = { "~/.config/telescope_programming_docs/mdn-2022/" },
        default_text = "^",
    })
end, { desc = "[Telescope] Search inside the MDN JS docs (live grep, live_grep)" })

-----------------------
--
-- Cusotm Telescope finders
-- https://www.youtube.com/watch?v=hQSZEZeZIPk
-- TODO
--
--
--
--

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local sorters = require("telescope.sorters")

------------------------
--
--
--
--
-- TELESCOPE SETUP
--
--
--
--
--
telescope.setup({
    defaults = {
        -- https://github.com/nvim-telescope/telescope.nvim/issues/895
        path_display = { "truncate" },
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
telescope.load_extension("neoclip")

----------------------------------------
--
-- Telescope Plugins
--
--
--

local map = vim.keymap.set

map(
    "n",
    "<leader>nc",
    "<cmd>Telescope neoclip<CR>",
    { desc = "[Telescope] open neoclip clipboard manager", silent = true, noremap = true }
)

map(
    "n",
    "<leader>tmcr",
    "<cmd>lua require('telescope').extensions.macroscope.default()<CR>",
    { desc = "[Telescope] open neoclip macroscope for macro history", silent = true, noremap = true }
)

map(
    "n",
    "<leader>tnctog",
    "<cmd>lua require('neoclip').toggle()<CR>",
    { desc = "[Telescope] (toggle) start or stop neoclip", silent = true, noremap = true }
)
