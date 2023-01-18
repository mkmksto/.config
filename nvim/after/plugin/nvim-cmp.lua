-- import nvim-cmp plugin safely
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
    return
end

-- import luasnip plugin safely
local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
    return
end

-- import lspkind plugin safely (vs-code - like icons)
local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
    return
end

-- load vs-code like snippets from plugins (e.g. friendly-snippets)
require("luasnip/loaders/from_vscode").lazy_load()

vim.opt.completeopt = "menu,menuone,noselect"

-- https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources
cmp.setup({
    -- https://github.com/hrsh7th/nvim-cmp/issues/209
    completion = {
        completeopt = "menu,menuone,noinsert",
    },
    -- https://github.com/hrsh7th/nvim-cmp/wiki/Advanced-techniques
    enabled = function()
        -- disable completion in comments
        local context = require("cmp.config.context")
        -- keep command mode completion enabled when cursor is in a comment
        if vim.api.nvim_get_mode().mode == "c" then
            return true
        else
            return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
        end
    end,

    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<S-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<S-j>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(), -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
    }),
    -- sources for autocompletion
    sources = cmp.config.sources({
        { name = "nvim_lsp", max_item_count = 8 }, -- lsp as source for autocompletion
        -- { name = "nvim_lsp", max_item_count = 8, keyword_length = 6 }, -- lsp as source for autocompletion
        -- { name = "luasnip", max_item_count = 8 }, -- snippets
        { name = "buffer" }, -- text within current buffer
        { name = "path", max_item_count = 8 }, -- file system paths
    }),
    formatting = {
        format = lspkind.cmp_format({
            maxwidth = 35,
            ellipsis_char = "...",
        }),
    },
})
