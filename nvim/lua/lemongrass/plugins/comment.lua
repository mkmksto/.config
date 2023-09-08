return {
    "numToStr/Comment.nvim",
    config = function()
        local has = vim.fn.has
        local is_linux = has("unix")
        local is_win = has("win32")

        -- https://www.reddit.com/r/neovim/comments/vr68yl/checking_for_wsl_in_initlua/
        local is_wsl = (function()
            local output = vim.fn.systemlist("uname -r")
            return not not string.find(output[1] or "", "WSL")
        end)()

        local comment = require("Comment")
        if is_wsl or is_win then
            comment.setup({
                pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
                toggler = {
                    line = "//",
                },
                opleader = {
                    block = "gb",
                },
            })
        elseif is_linux then
            comment.setup({
                pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
                toggler = {
                    line = "<C-/>",
                },
                opleader = {
                    line = "<C-/>",
                    block = "gb",
                },
            })
        end
    end,
}
