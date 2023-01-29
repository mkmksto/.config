local keymap = vim.keymap
local opts = { noremap = true, silent = true }
vim.g.mapleader = " "

-- maintain centered lines
keymap.set("n", "<C-j>", "<C-d>zz")
keymap.set("n", "<C-k>", "<C-u>zz")
keymap.set("n", "{", "{zz")
keymap.set("n", "}", "}zz")

-- my remaps
-- keymap.set("i", "<S-space", "<Esc>")
keymap.set("i", "<C-j>", "<Esc>o")
keymap.set("n", "<C-Enter>", "o<Esc>")
keymap.set({ "i", "n", "v" }, "<C-z>", "")
keymap.set("n", " ", "")

keymap.set({ "n", "v" }, "<S-j>", "")
keymap.set("n", "<Up>", "")
keymap.set("n", "<Down>", "")
keymap.set("n", "<Left>", "")
keymap.set("n", "<Right>", "")

-- Buffers
keymap.set("n", "<Tab>", "<cmd>bnext<CR>")
keymap.set("n", "<S-Tab>", "<cmd>bprevious<CR>")
keymap.set("n", "<leader>bd", "<cmd>Bdelete!<CR>")

-- keep cursor in the middle when jumping through search results
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- Resize window
keymap.set("n", "<C-left>", "<C-w>10<")
keymap.set("n", "<C-right>", "<C-w>10>")
keymap.set("n", "<C-up>", "<C-w>6+")
keymap.set("n", "<C-down>", "<C-w>6-")

-- https://youtu.be/vdn_pKJUda8?list=PLTqGJvc0HUn2GY0sW2L61lDuBaXBKnorO&t=1064
keymap.set("n", "x", '"_x') -- do not copy a deleted char to register

-- managing tabs
keymap.set("n", "<leader>tn", ":tabnew<CR>", opts) -- new tab
keymap.set("n", "<leader>tc", ":tabclose<CR>", opts) -- close tab
keymap.set("n", "<leader><Tab>", ":tabn<CR>", opts) -- next tab
keymap.set("n", "<leader><S-Tab>", ":tabp<CR>", opts) -- previous tab

-- nvim tree toglee
keymap.set("n", "<C-b>", "<cmd>NvimTreeToggle<CR>", opts)

--  telescope
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find text throughout project
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string the cursor is on throught proj
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

-- Move text up and down (https://github.com/LunarVim/LunarVim/blob/master/lua/lvim/keymappings.lua)
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")
keymap.set("n", "<A-j>", ":m .+1<CR>==")
keymap.set("n", "<A-k>", ":m .-2<CR>==")

-- pasting stuff (from prime's vid) (https://youtu.be/w7i4amO_zaE?t=1610)
keymap.set("x", "<leader>p", '"_dP')
keymap.set("n", "Q", "<nop>")

-- visual line comments
-- keymap.set({ "n", "o" }, "<C-/>", "<cmd>CommentToggle<CR>")

-- docstrings
keymap.set({ "n" }, "<leader>dpy", "<cmd>DogeGenerate google<CR>", opts)
keymap.set({ "n" }, "<leader>djs", "<cmd>DogeGenerate jsdoc<CR>", opts)

-- toggles markdown checkboxes
keymap.set("n", "<leader>tt", "<cmd>lua require('toggle-checkbox').toggle()<CR>", opts)
