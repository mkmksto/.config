-- https://youtu.be/vdn_pKJUda8?list=PLTqGJvc0HUn2GY0sW2L61lDuBaXBKnorO&t=899
local status, _ = pcall(vim.cmd, "colorscheme oxocarbon")
if not status then
    print("Colorscheme not found")
    return
end

vim.cmd([[hi Normal guibg=#1b1730]])
vim.cmd([[hi SignColumn guibg=#1b1730]])
-- https://stackoverflow.com/questions/250652/vim-initial-settings-change-background-color-for-line-number-on-the-left-side
vim.cmd([[hi LineNr guibg=#1b1730 ctermbg=DarkGreen]])

-- vim.cmd([[hi TabLineFill guibg=#ffffff ctermbg=DarkGreen]])
-- vim.cmd([[hi TabLine guibg=#ffffff]]) -- probably the entire tabline bar
-- vim.cmd([[hi TabLineSel gui=underline guibg=#fcba03 guifg=#fcba03]]) -- active tab
vim.cmd([[hi TabLine    gui=NONE guibg=#333232]])
-- vim.cmd([[hi Title    gui=NONE guibg=#fcba03 guifg=#ffffff]])
