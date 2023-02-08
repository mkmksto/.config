-- import lspconfig plugin safely (prob neovim/nvim-lspconfig)
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
    return
end

-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
    return
end

-- import typescript plugin safely
local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
    return
end

-- :LspInfo to see what lsp is run on current file
local keymap = vim.keymap
local on_attach = function(client, bufnr)
    -- keybind options
    local opts = { noremap = true, silent = true, buffer = bufnr }

    -- set keybinds
    keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references (and implementation if there are any)
    -- keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration (essentially a less good version of Lspsaga goto_definition, can be buggy)
    keymap.set("n", "gP", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
    keymap.set("n", "gD", "<cmd>Lspsaga goto_definition<CR>", opts)
    keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
    keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
    keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
    keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
    keymap.set("n", "<leader>dd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
    keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
    keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
    keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
    keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side

    -- typescript specific keymaps (e.g. rename file and update imports)
    if client.name == "tsserver" then
        keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
        keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
        keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
    end
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- configure html server
lspconfig.html.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = {
        "html",
        "typescriptreact",
        "javascriptreact",
        "css",
        "sass",
        "scss",
        "less",
        "svelte", --[[ "vue"  ]]
    },
})

-- configure css server
lspconfig.cssls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = {
        "html",
        "typescriptreact",
        "javascriptreact",
        "css",
        "sass",
        "scss",
        "less",
        "svelte", --[[ "vue"  ]]
    },
})

-- python
lspconfig["pyright"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

lspconfig["bashls"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

lspconfig["jsonls"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

-- configure tailwindcss server
-- https://github.com/tailwindlabs/tailwindcss/discussions/5258#discussioncomment-1979394
lspconfig.tailwindcss.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte", "vue" },
})

-- lspconfig.tsserver.setup({})

-- -- note: this is a plugin
-- typescript.setup({
--     server = {
--         capabilities = capabilities,
--         on_attach = on_attach,
--         -- filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte", "vue" },
--     },
-- })

local util = require("lspconfig.util")
local function get_typescript_server_path(root_dir)
    -- local global_ts = "/home/[yourusernamehere]/.npm/lib/node_modules/typescript/lib"
    local global_ts = "/home/lemongrass/.local/share/pnpm/global/5/node_modules/typescript/lib"
    -- Alternative location if installed as root:
    -- local global_ts = '/usr/local/lib/node_modules/typescript/lib'
    local found_ts = ""
    local function check_dir(path)
        found_ts = util.path.join(path, "node_modules", "typescript", "lib")
        if util.path.exists(found_ts) then
            return path
        end
    end
    if util.search_ancestors(root_dir, check_dir) then
        return found_ts
    else
        return global_ts
    end
end

-- to prevent typescript errors within vue, enable takeover mode
-- https://github.com/garcia5/dotfiles/blob/master/files/nvim/lua/ag/lsp_config.lua#L243
-- https://www.reddit.com/r/neovim/comments/v4mhsv/neovim_setup_for_fullstack_web_development_with/
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#volar
-- NOTE: in order for `take over mode` to work, you have to enable the filetypes table (for ts and vue)
-- in addition to the other configs below
-- also, disable your other TS servers
lspconfig.volar.setup({
    filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
    capabilities = capabilities,
    on_new_config = function(new_config, new_root_dir)
        new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
        -- print(get_typescript_server_path(new_root_dir)) -- for debugging TS server path
    end,
    on_attach = on_attach,
})

-- configure emmet language server
lspconfig["emmet_ls"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "html", "typescriptreact", "javascriptreact", "svelte", "vue" },
})

-- configure lua server (with special settings)
lspconfig["sumneko_lua"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = { -- custom settings for lua
        Lua = {
            -- make the language server recognize "vim" global
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                -- make language server aware of runtime files
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                },
            },
        },
    },
})
