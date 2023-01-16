-- https://alpha2phi.medium.com/neovim-for-beginners-code-annotation-and-documentation-4e8c1dd2552
local M = {}

function M.setup()
    vim.g.doge_doc_standard_python = "google"
    -- vim.g.doge_mapping_comment_jump_forward = "<C-j>"
    -- vim.g.doge_mapping_comment_jump_backward = "<C-k>"
    -- vim.g.doge_buffer_mappings = 1
    -- vim.g.doge_comment_jump_modes = { "n", "i", "s" }
end

return M
