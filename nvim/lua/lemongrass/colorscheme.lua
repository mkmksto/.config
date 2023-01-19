-- https://youtu.be/vdn_pKJUda8?list=PLTqGJvc0HUn2GY0sW2L61lDuBaXBKnorO&t=899
local status, _ = pcall(vim.cmd, "colorscheme oxocarbon")
if not status then
    print("Colorscheme not found")
    return
end

vim.cmd([[hi Normal guibg=#1b1730]])
vim.cmd([[hi SignColumn guibg=#1b1730]])
-- https://stackoverflow.com/questions/250652/vim-initial-settings-change-background-color-for-line-number-on-the-left-side
vim.cmd([[hi LineNr guibg=#1b1730]])
