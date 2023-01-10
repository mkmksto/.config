local keymap = vim.keymap
vim.g.mapleader = " "

-- scroll up down
keymap.set("n", "<C-j>", "<C-d>zz")
keymap.set("n", "<C-k>", "<C-u>zz")

-- my remaps
-- keymap.set("i", "<S-space", "<Esc>")
keymap.set("i", "<C-j>", "<Esc>o")
keymap.set("n", "<C-Enter>", "o<Esc>")
keymap.set({ "i", "n", "v" }, "<C-z>", "")

keymap.set("n", "<S-j>", "")
keymap.set("n", "<Up>", "")
keymap.set("n", "<Down>", "")
keymap.set("n", "<Left>", "")
keymap.set("n", "<Right>", "")

-- navigate buffers (tab and shift tab to navigate bufferline buffers)
keymap.set("n", "<Tab>", ":bnext<CR>")
keymap.set("n", "<S-Tab>", ":bprevious<CR>")

-- keep cursor in the middle when jumping through search results
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- Resize window
keymap.set("n", "<C-left>", "<C-w><")
keymap.set("n", "<C-right>", "<C-w>>")
keymap.set("n", "<C-up>", "<C-w>+")
keymap.set("n", "<C-down>", "<C-w>-")

-- https://youtu.be/vdn_pKJUda8?list=PLTqGJvc0HUn2GY0sW2L61lDuBaXBKnorO&t=1064
keymap.set("n", "x", '"_x') -- do not copy a deleted char to register
-- managing tabs
-- keymap.set("n", "<leader>to", ":tabnew<CR>") -- new tab
-- keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close tab (kinda unnecessary since I use <C-w>q anyway but whatever
-- keymap.set("n", "<Tab>", ":tabn<CR>") -- next tab
-- keymap.set("n", "<S-Tab>", ":tabp<CR>") -- previous tab

-- nvim tree toglee
keymap.set("n", "<C-b>", ":NvimTreeToggle<CR>")

--  telescope
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find text throughout project
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string the cursor is on throught proj
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

-- Move text up and down (https://www.chiarulli.me/Neovim-2/02-keymaps/)
local opts = { noremap = true, silent = true }
-- keymap.set("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
-- keymap.set("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)

-- Move text up and down
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")
