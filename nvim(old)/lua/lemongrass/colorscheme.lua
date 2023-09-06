-- local status, colorscheme = pcall(require, "catppuccin")
-- if not status then
--     return
-- end

-- local status, colorscheme = pcall(require, "onedarkpro")
-- if not status then
--     return
-- end
-- colorscheme.setup({
--     colors = {
--         dark = {
--             bg = "#464646", -- yellow
--         },
--     },
-- })

-- colorscheme.setup({
--     overrides = { NormalNC = { bg = "##C0C0C0", fg = "#808080" } },
-- })

-- colorscheme.setup({
--     flavour = "macchiato", -- latte, frappe, macchiato, mocha
--     dim_inactive = {
--         enabled = true,
--         shade = "dark",
--         percentage = 0.25,
--     },
--     no_italic = false, -- Force no italic
--     no_bold = false, -- Force no bold
--     styles = {
--         comments = { "italic" },
--     },
--     integrations = {
--         telescope = true,
--     },
-- })

-- setup must be called before loading
-- vim.cmd.colorscheme("catppuccin-macchiato")
-- vim.cmd.colorscheme("ayumirage")
-- vim.cmd("colorscheme onedark_dark")
vim.cmd.colorscheme("ayu-mirage")

-------------------------------------------
--
--
--
--
-- OLD CONFIG

-- local status, _ = pcall(vim.cmd, "colorscheme catppuccin-macchiato")
-- if not status then
--     print("Colorscheme not found")
--     return
-- end

-- -- local global_bg = #1b1730 -- for oxocarbon
--
-- vim.cmd([[hi Normal guibg=#292734]]) -- global BG color?
-- vim.cmd([[hi SignColumn guibg=#292734]]) -- gutter (i think)
-- -- https://stackoverflow.com/questions/250652/vim-initial-settings-change-background-color-for-line-number-on-the-left-side
-- vim.cmd([[hi LineNr guibg=#292734 ctermbg=DarkGreen]]) -- numbers at gutter
--
-- -- vim.cmd([[hi TabLineFill guibg=#ffffff ctermbg=DarkGreen]])
-- -- vim.cmd([[hi TabLine guibg=#ffffff]]) -- probably the entire tabline bar
-- -- vim.cmd([[hi TabLineSel gui=underline guibg=#fcba03 guifg=#fcba03]]) -- active tab
-- vim.cmd([[hi TabLine    gui=NONE guibg=#333232]])
-- -- vim.cmd([[hi Title    gui=NONE guibg=#fcba03 guifg=#ffffff]])
