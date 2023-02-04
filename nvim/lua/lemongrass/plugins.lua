local packer = require("packer")
packer.init({
    snapshot_path = vim.fn.expand("~/.config/nvim/packer_snaps/"),
})

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`

return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    use("nvim-lua/plenary.nvim")

    -- color schemes
    use("nyoom-engineering/oxocarbon.nvim")
    use("olimorris/onedarkpro.nvim")
    -- use("bluz71/vim-nightfly-guicolors")
    -- use("lmburns/kimbox")

    -- refactoring
    use("ThePrimeagen/refactoring.nvim")
    use("windwp/nvim-spectre")

    use("numToStr/Comment.nvim")

    -- docstrings
    use({
        "kkoomen/vim-doge",
        run = ":call doge#install()",
        -- config = function()
        --     require("config.doge").setup()
        -- end,
        cmd = { "DogeGenerate", "DogeCreateDocStandard" },
        disable = false,
        event = "VimEnter",
    })

    -- surrounds
    use("tpope/vim-surround")

    -- file explorer
    use("nvim-tree/nvim-tree.lua")
    use("kyazdani42/nvim-web-devicons")
    use("nvim-lualine/lualine.nvim")
    -- c@m https://youtu.be/vJAmjAax2H0?list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ&t=453
    use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })
    use("moll/vim-bbye")

    -- aucomplete
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer") -- recommend text from current buffer
    use("hrsh7th/cmp-path") -- recommend paths
    use("hrsh7th/cmp-cmdline")
    use("lukas-reineke/cmp-under-comparator")
    use("hrsh7th/cmp-nvim-lsp-signature-help")
    use("uga-rosa/cmp-dictionary")

    -- snippets
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    use("rafamadriz/friendly-snippets")

    -- managing and installing LSP servers (that mason will install)
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim") -- bridges mason and nvim-lspconfig

    -- LSP servers config
    use("neovim/nvim-lspconfig") -- for configuring LSP servers
    use("hrsh7th/cmp-nvim-lsp") -- so that the lsp appears in autocompletion
    use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
    use("jose-elias-alvarez/typescript.nvim")
    use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

    -- formatting and linting
    use("jose-elias-alvarez/null-ls.nvim")
    use("jay-babu/mason-null-ls.nvim") -- similar to mason-lspconfig but for formatters

    -- DAP
    use({ "mfussenegger/nvim-dap" })
    use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })

    -- autoclosing
    use("windwp/nvim-autopairs")
    use("windwp/nvim-ts-autotag")

    -- git (https://www.youtube.com/watch?v=ZgyVY7tArwg)
    use("lewis6991/gitsigns.nvim")
    -- use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
    use("kdheepak/lazygit.nvim")

    -- terminal
    use({
        "akinsho/toggleterm.nvim",
        tag = "*",
        config = function()
            require("toggleterm").setup()
        end,
    })

    --scrollbar and other UI elements
    use("dstein64/nvim-scrollview")
    use("lukas-reineke/indent-blankline.nvim")
    -- Lua
    use({
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup({
                window = {
                    width = 105,
                },
            })
        end,
    })

    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
    use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })

    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

    -- color pickers/colorizers
    -- https://www.reddit.com/r/neovim/comments/xk75hb/cccnvim_added_colors_highlighting/
    use({
        "uga-rosa/ccc.nvim",
        branch = "0.7.2",
    })

    -- games
    use("ThePrimeagen/vim-be-good")

    -- notetaking
    use("opdavies/toggle-checkbox.nvim")
    -- install without yarn or npm
    use({
        "iamcco/markdown-preview.nvim",
        run = function()
            vim.fn["mkdp#util#install"]()
        end,
    })
    use("ekickx/clipboard-image.nvim")

    -- profiling
    use("dstein64/vim-startuptime")
end)
