local has = vim.fn.has
local is_linux = has("unix")
local is_win = has("win32")
-- https://www.reddit.com/r/neovim/comments/vr68yl/checking_for_wsl_in_initlua/
local is_wsl = (function()
    local output = vim.fn.systemlist("uname -r")
    return not not string.find(output[1] or "", "WSL")
end)()

-- -- https://youtu.be/vdn_pKJUda8?list=PLTqGJvc0HUn2GY0sW2L61lDuBaXBKnorO&t=1432
local setup, comment = pcall(require, "Comment")
if not setup then
    return
end

if is_wsl then
    comment.setup({
        opleader = {
            block = "gb",
        },
    })
elseif is_linux then
    comment.setup({
        toggler = {
            line = "<C-/>",
        },
        opleader = {
            line = "<C-/>",
            block = "gb",
        },
    })
end
