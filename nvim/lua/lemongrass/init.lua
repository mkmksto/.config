require("lemongrass.settings")
require("lemongrass.remap")
require("lemongrass.plugins")
require("lemongrass.colorscheme")
require("lemongrass.lsp.mason")
require("lemongrass.lsp.lspsaga")
require("lemongrass.lsp.lspconfig")
require("lemongrass.lsp.null-ls")
require("lemongrass.re_command")

local has = vim.fn.has
local is_linux = has("unix")
local is_win = has("win32")
-- https://www.reddit.com/r/neovim/comments/vr68yl/checking_for_wsl_in_initlua/
local is_wsl = (function()
    local output = vim.fn.systemlist("uname -r")
    return not not string.find(output[1] or "", "WSL")
end)()

if is_linux then
    require("lemongrass.linux")
end

if is_win then
    require("lemongrass.windows")
end

if is_wsl then
    require("lemongrass.windows")
end
