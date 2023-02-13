require("neoclip").setup({
    default_register = { "+", '"', "*" },
    enable_macro_history = true,
    on_select = {
        move_to_front = true,
        -- close_telescope = true,
    },
    keys = {
        telescope = {
            i = {
                select = "<CR>",
                paste = "<c-p>",
                paste_behind = "<leader>bH",
                replay = "<c-q>", -- replay a macro
                delete = "<c-d>", -- delete an entry
                edit = "<c-e>", -- edit an entry
                -- custom = {
                --     ["<c-j>"] = print("halllooo"),
                --     ["<c-k>"] = print("halllooo"),
                -- },
            },
            n = {
                select = "<CR>",
                paste = "p",
                paste_behind = "P",
                replay = "q",
                delete = "d",
                edit = "e",
            },
        },
    },
})
