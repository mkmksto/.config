-- https://youtu.be/vdn_pKJUda8?list=PLTqGJvc0HUn2GY0sW2L61lDuBaXBKnorO&t=1432
local setup, comment = pcall(require, "Comment")
if not setup then
    return
end

comment.setup({
    toggler = {
        line = "<C-/>",
    },
})
