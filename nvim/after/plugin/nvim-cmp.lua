-- import nvim-cmp plugin safely
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
    return
end

-- import nvim-cmp plugin safely
local cmp_types_status, cmp_types_config = pcall(require, "cmp.types")
if not cmp_types_status then
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

-- https://www.reddit.com/r/neovim/comments/woih9n/how_to_set_lsp_autocomplete_priority/
-- https://github.com/hrsh7th/nvim-cmp/blob/main/lua/cmp/types/lsp.lua
local function deprioritize_snippet(entry1, entry2)
    if entry1:get_kind() == cmp_types_config.lsp.CompletionItemKind.Snippet then
        return false
    end
    if entry2:get_kind() == cmp_types_config.lsp.CompletionItemKind.Snippet then
        return true
    end
end

-- -- https://www.youtube.com/watch?v=z5mqa4ELjhw&list=PLOe6AggsTaVuIXZU4gxWJpIQNHMrDknfN&index=24
-- -- local kind_mapper = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14 }
-- local kind_mapper = cmp_types_config.lsp.CompletionItemKind
--
-- local kind_score = {
--     Class = 1,
--     Method = 2,
--     Variable = 3,
-- }

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
        ["<S-Tab>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<Tab>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(), -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
    }),
    -- sources for autocompletion
    sources = cmp.config.sources({
        { name = "nvim_lsp", max_item_count = 13, priority = 10 }, -- lsp as source for autocompletion
        -- { name = "nvim_lsp", max_item_count = 8, keyword_length = 6 }, -- lsp as source for autocompletion
        { name = "buffer", priority = 8 }, -- text within current buffer
        { name = "path", max_item_count = 8, priority = 7 }, -- file system paths
        { name = "luasnip", max_item_count = 8, priority = 5 }, -- snippets
    }),
    -- https://github.com/hrsh7th/nvim-cmp/issues/183
    -- https://www.reddit.com/r/neovim/comments/u3c3kw/how_do_you_sorting_cmp_completions_items/
    -- (Lower Emmet Snippets) https://www.reddit.com/r/neovim/comments/woih9n/how_to_set_lsp_autocomplete_priority/
    sorting = {
        priority_weight = 1.0,
        comparators = {
            deprioritize_snippet,
            require("cmp-under-comparator").under,
            cmp.config.compare.exact,
            cmp.config.compare.recently_used,
            cmp.config.compare.locality,
            -- function(entry1, entry2)
            --     local kind1 = kind_score[kind_mapper[entry1:get_kind()]] or 50
            --     local kind2 = kind_score[kind_mapper[entry2:get_kind()]] or 50
            --     if kind1 < kind2 then
            --         return true
            --     end
            -- end,
            cmp.config.compare.score, -- based on :  score = score + ((#sources - (source_index - 1)) * sorting.priority_weight)
            cmp.config.compare.offset,
            cmp.config.compare.scopes,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.order,
        },
    },
    formatting = {
        format = lspkind.cmp_format({
            maxwidth = 35,
            ellipsis_char = "...",
            menu = {
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                luasnip = "[LuaSnip]",
                path = "[Path]",
            },
        }),
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
})

-- https://github.com/hrsh7th/cmp-cmdline
cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline({
        ["<C-j>"] = { c = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }) },
        ["<C-k>"] = { c = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }) },
        ["<Tab>"] = { c = cmp.mapping.confirm({ select = false }) },
        ["<C-Space>"] = { c = cmp.mapping.complete() }, -- show completion suggestions
    }),
    sources = {
        { name = "buffer" },
    },
})

-- `:` cmdline setup.
cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline({
        ["<C-j>"] = { c = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }) },
        ["<C-k>"] = { c = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }) },
        ["<Tab>"] = { c = cmp.mapping.confirm({ select = false }) },
        ["<C-Space>"] = { c = cmp.mapping.complete() }, -- show completion suggestions
    }),
    sources = cmp.config.sources({
        { name = "path" },
    }, {
        {
            name = "cmdline",
            option = {
                ignore_cmds = { "Man", "!" },
            },
        },
    }),
})
