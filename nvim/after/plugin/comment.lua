-- -- -- https://youtu.be/vdn_pKJUda8?list=PLTqGJvc0HUn2GY0sW2L61lDuBaXBKnorO&t=1432
-- local setup, comment = pcall(require, "Comment")
-- if not setup then
--     return
-- end

-- comment.setup({
--     toggler = {
--         line = "<C-/>",
--         -- block = "gc",
--     },
-- })

-- https://youtu.be/vdn_pKJUda8?list=PLTqGJvc0HUn2GY0sW2L61lDuBaXBKnorO&t=1432
local nvim_comment_setup, nvim_comment = pcall(require, "nvim_comment")
if not nvim_comment_setup then
    return
end

nvim_comment.setup({
    -- line_mapping = "<leader>/",
    operator_mapping = "<C-/>",
})
