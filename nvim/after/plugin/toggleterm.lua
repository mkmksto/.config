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
    close_on_exit = true,
    start_in_insert = true,
    shell = vim.o.shell,
    auto_scroll = true,
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
vim.keymap.set("n", "<leader>`", ":ToggleTerm direction=horizontal auto_scroll=true<C-Left><C-Left><Left>")
vim.keymap.set({ "n", "t" }, "<C-`>", "<Esc><C-\\><C-n><cmd>ToggleTermToggleAll<CR>")
-- vim.keymap.set("n", "<leader>lz", ":LazyGit<CR>")
-- vim.keymap.set("n", "<ledaer>h", "<C-w>h")

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

local Terminal = require("toggleterm.terminal").Terminal

-- !IMPORTANT NOTE:
-- Having the `count = <number>` things are necessary, otherwise, the terminals devour your open terminals
local python = Terminal:new({ cmd = "python3", hidden = true, direction = "float", count = 6 })
function _PYTHON_TOGGLE()
    python:toggle()
end
vim.keymap.set("n", "<leader>tpy", ":lua _PYTHON_TOGGLE()<CR>")

local node_js = Terminal:new({ cmd = "node", hidden = true, direction = "float", count = 7 })
function _NODE_TOGGLE()
    node_js:toggle()
end
vim.keymap.set("n", "<leader>tjs", ":lua _NODE_TOGGLE()<CR>")

local floating_term = Terminal:new({ hidden = true, direction = "float", close_on_exit = true, count = 5 })
function _FLOATING_TOGGLE()
    floating_term:toggle()
end
vim.keymap.set("n", "<leader>fl", ":lua _FLOATING_TOGGLE()<CR>")
-- vim.keymap.set("n", "<leader>fl", "<cmd>4TermExec cmd='' direction=float close_on_exit='true'<CR>")

local htop = Terminal:new({ cmd = "htop", hidden = true, direction = "float", count = 8 })
function _HTOP_TOGGLE()
    htop:toggle()
end
vim.keymap.set("n", "<leader>htop", ":lua _HTOP_TOGGLE()<CR>")

local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float", count = 9 })
function _LAZYGIT_TOGGLE()
    lazygit:toggle()
end
vim.keymap.set("n", "<leader>lz", ":lua _LAZYGIT_TOGGLE()<CR>")

-- vim.keymap.set("n", "<C-\\>", ":ToggleTerm direction=float")
-- vim.keymap.set("n", "<C-\\>", ":ToggleTerm direction=horizontal")
