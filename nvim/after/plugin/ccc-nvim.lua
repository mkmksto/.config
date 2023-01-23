local ccc_setup, ccc = pcall(require, "ccc")
if not ccc_setup then
    return
end

ccc.setup({})

vim.cmd("CccHighlighterEnable")
