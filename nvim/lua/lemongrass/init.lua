require("lemongrass.settings")
require("lemongrass.remap")
require("lemongrass.plugins")
require("lemongrass.colorscheme")

local has = vim.fn.has
local is_linux = has("unix")
local is_win = has("win32")

if is_linux then
	require("lemongrass.linux")
end

if is_win then
	require("lemongrass.windows")
end
