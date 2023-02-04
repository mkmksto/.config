-- https://youtu.be/vdn_pKJUda8?list=PLTqGJvc0HUn2GY0sW2L61lDuBaXBKnorO&t=899
-- local status, _ = pcall(vim.cmd, "colorscheme oxocarbon")
local status, _ = pcall(vim.cmd, "colorscheme onedark_vivid")
if not status then
    print("Colorscheme not found")
    return
end

-- local global_bg = #1b1730 -- for oxocarbon

vim.cmd([[hi Normal guibg=#292734]]) -- global BG color?
vim.cmd([[hi SignColumn guibg=#292734]]) -- gutter (i think)
-- https://stackoverflow.com/questions/250652/vim-initial-settings-change-background-color-for-line-number-on-the-left-side
vim.cmd([[hi LineNr guibg=#292734 ctermbg=DarkGreen]]) -- numbers at gutter

-- vim.cmd([[hi TabLineFill guibg=#ffffff ctermbg=DarkGreen]])
-- vim.cmd([[hi TabLine guibg=#ffffff]]) -- probably the entire tabline bar
-- vim.cmd([[hi TabLineSel gui=underline guibg=#fcba03 guifg=#fcba03]]) -- active tab
vim.cmd([[hi TabLine    gui=NONE guibg=#333232]])
-- vim.cmd([[hi Title    gui=NONE guibg=#fcba03 guifg=#ffffff]])
