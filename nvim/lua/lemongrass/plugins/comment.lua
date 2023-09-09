return {
    "numToStr/Comment.nvim",
    config = function()
        local is_linux = vim.loop.os_uname().sysname == "Linux"
        local is_win = vim.loop.os_uname().sysname == "Windows"

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
