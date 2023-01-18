local toggleterm_setup, toggleterm = pcall(require, "toggleterm")
if not toggleterm_setup then
    return
end

toggleterm.setup({
    -- size can be a number or function which is passed the current terminal
    size = 20,
    open_mapping = [[<c-\>]],
    hide_numbers = true, -- hide the number column in toggleterm buffers
    persist_size = true,
    direction = "horizontal",
    start_in_insert = true,
})

function _G.set_terminal_keymaps()
    local opts = { noremap = true }
    vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
    -- vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
    -- vim.api.nvim_buf_set_keymap(0, "t", "<leader>h", [[<C-W>h]], opts)
    -- vim.api.nvim_buf_set_keymap(0, "t", "<leader>j", [[<C-W>j]], opts)
    -- vim.api.nvim_buf_set_keymap(0, "t", "<leader>k", [[<C-W>k]], opts)
    -- vim.api.nvim_buf_set_keymap(0, "t", "<leader>l", [[<C-W>l]], opts)
    -- vim.api.nvim_buf_set_keymap(0, "t", "<C-w>v", [[]], opts)
    -- vim.api.nvim_buf_set_keymap(0, "t", "<C-]>", [[:ToggleTerm2]], opts)
end

-- https://stackoverflow.com/questions/13511084/vim-set-cursor-position-in-command-line
vim.keymap.set("n", "<leader>`", ":ToggleTerm direction=horizontal<C-Left><Left>")
vim.keymap.set("n", "<C-`>", ":ToggleTermToggleAll<CR>")
vim.keymap.set("n", "<leader>lz", ":LazyGit<CR>")
-- vim.keymap.set("n", "<ledaer>h", "<C-w>h")

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

local Terminal = require("toggleterm.terminal").Terminal

local python = Terminal:new({ cmd = "python3", hidden = true, direction = "float" })
function _PYTHON_TOGGLE()
    python:toggle()
end
vim.keymap.set("n", "<leader>tpy", ":lua _PYTHON_TOGGLE()<CR>")

local floating_term = Terminal:new({ hidden = true, direction = "float" })
function _FLOATING_TOGGLE()
    floating_term:toggle()
end
vim.keymap.set("n", "<leader>fl", ":lua _FLOATING_TOGGLE()<CR>")

local htop = Terminal:new({ cmd = "htop", hidden = true, direction = "float" })
function _HTOP_TOGGLE()
    htop:toggle()
end
vim.keymap.set("n", "<leader>htop", ":lua _HTOP_TOGGLE()<CR>")

-- local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
-- function _LAZYGIT_TOGGLE()
--     lazygit:toggle()
-- end
-- vim.keymap.set("n", "<leader>lz", ":lua _LAZYGIT_TOGGLE()<CR>")

-- vim.keymap.set("n", "<C-\\>", ":ToggleTerm direction=float")
-- vim.keymap.set("n", "<C-\\>", ":ToggleTerm direction=horizontal")
