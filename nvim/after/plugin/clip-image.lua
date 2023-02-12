local setup, clip_image = pcall(require, "clipboard-image")
if not setup then
    return
end

clip_image.setup({
    markdown = {
        img_dir = { "%:p:h", ".img" },
        img_dir_txt = "./.img",
    },
})

-- local function paste_img()
--     -- local cwd = vim.fn.getcwd()
--     -- print("cwd is: ", vim.fn.expand("%"))
--     print("cwd is:", vim.fn.expand("%:p"))
--     return vim.api.nvim_buf_get_name(0)
-- end
--
vim.keymap.set(
    "n",
    "<leader>ss",
    "<cmd>PasteImg<CR>",
    { desc = "[Clipboard Image] Paste image from clipboard into markdown file", noremap = true, silent = true }
)
