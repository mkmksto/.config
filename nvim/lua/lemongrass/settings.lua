-- https://github.com/craftzdog/dotfiles-public/blob/master/.config/nvim/lua/craftzdog/base.lua
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.shell = "zsh"

-- ignore case if lowercase, but will not if something is uppercased
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.smartcase = true

-- line numbers + relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.linebreak = true
-- vim.opt.wrapmargin = 20
vim.opt.textwidth = 0
vim.opt.wrapmargin = 0
vim.opt.wrap = true

-- indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
-- vim.opt.viewoptions = "folds,cursor"
vim.opt.title = true

-- when searching do not keep things highlighted, enable incremental search
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 6
vim.opt.ttyfast = true

-- https://youtu.be/hY5-Q6NxQgY?list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ&t=296
vim.opt.splitbelow = true -- horizontal splits go below
vim.opt.splitright = true -- vertical splits go right

-- https://youtu.be/vdn_pKJUda8?list=PLTqGJvc0HUn2GY0sW2L61lDuBaXBKnorO&t=523
-- appearance
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true

-- backspace
vim.opt.backspace = "indent,eol,start"

-- from devaslife
vim.opt.cmdheight = 1

-- for comment remaps
vim.opt.timeoutlen = 1000
