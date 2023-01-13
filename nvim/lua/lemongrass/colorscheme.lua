-- https://youtu.be/vdn_pKJUda8?list=PLTqGJvc0HUn2GY0sW2L61lDuBaXBKnorO&t=899
local status, _ = pcall(vim.cmd, "colorscheme oxocarbon")
if not status then
    print("Colorscheme not found")
    return
end
