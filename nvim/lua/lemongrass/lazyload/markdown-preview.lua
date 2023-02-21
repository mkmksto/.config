local has = vim.fn.has
local is_linux = has("unix")

if is_linux then
    -- https://github.com/iamcco/markdown-preview.nvim/issues/19
    -- https://github.com/iamcco/markdown-preview.nvim/issues/262
    vim.cmd([[
        function OpenMarkdownPreview (url)
          silent exec "!google-chrome --new-window " . a:url . " &"
        endfunction
    ]])
    -- TODO: check if this works
    -- vim.g.mkdp_browser = "/usr/bin/epiphany"
    vim.g.mkdp_browser = "google-chrome"
    vim.g.mkdp_theme = "light"
    vim.g.mkdp_browserfunc = "OpenMarkdownPreview"
end

-- https://www.reddit.com/r/neovim/comments/vr68yl/checking_for_wsl_in_initlua/
local is_wsl = (function()
    local output = vim.fn.systemlist("uname -r")
    return not not string.find(output[1] or "", "WSL")
end)()

if is_wsl then
    vim.g.mkdp_browser = "C:/Program Files/Mozilla Firefox/firefox.exe"
    vim.g.mkdp_theme = "light"
end
