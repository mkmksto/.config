require("lemongrass.core.keymaps")
require("lemongrass.core.options")

local has = vim.fn.has
local is_linux = has("unix")
local is_win = has("win32")
-- https://www.reddit.com/r/neovim/comments/vr68yl/checking_for_wsl_in_initlua/
local is_wsl = (function()
    local output = vim.fn.systemlist("uname -r")
    return not not string.find(output[1] or "", "WSL")
end)()

if is_linux then
    require("lemongrass.core.linux")
end

if is_win then
    require("lemongrass.core.windows")
end

if is_wsl then
    require("lemongrass.core.windows")
end

