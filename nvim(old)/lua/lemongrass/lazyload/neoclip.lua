local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
    return
end

telescope.load_extension("neoclip")

require("neoclip").setup({
    default_register = { "+", '"', "*" },
    on_select = {
        move_to_front = true,
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
