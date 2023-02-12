local packer = require("packer")
packer.init({
    snapshot_path = vim.fn.expand("~/.config/nvim/packer_snaps/"),
})

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`

return require("packer").startup(function(use)
    -- main
    use({ "wbthomason/packer.nvim", lock = true })
    use({ "nvim-lua/plenary.nvim", lock = true })

    -- color schemes
    use({ "nyoom-engineering/oxocarbon.nvim", lock = true })
    use({ "olimorris/onedarkpro.nvim", lock = true })
    use({ "catppuccin/nvim", as = "catppuccin", lock = true })

    -- refactoring
    use({ "ThePrimeagen/refactoring.nvim", lock = true })
    use({ "windwp/nvim-spectre", lock = true })

    -- comments and docstrings
    use({ "numToStr/Comment.nvim", lock = true })
    use({
        "kkoomen/vim-doge",
        run = ":call doge#install()",
        -- config = function()
        --     require("config.doge").setup()
        -- end,
        cmd = { "DogeGenerate", "DogeCreateDocStandard" },
        disable = false,
        event = "VimEnter",
        lock = true,
    })

    -- surrounds
    use({ "tpope/vim-surround", lock = true })

    -- file explorer
    use({ "nvim-tree/nvim-tree.lua", lock = true })
    use({ "kyazdani42/nvim-web-devicons", lock = true })
    use({ "nvim-lualine/lualine.nvim", lock = true })
    -- c@m https://youtu.be/vJAmjAax2H0?list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ&t=453
    use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons", lock = true })
    use({ "moll/vim-bbye", lock = true })

    -- aucomplete
    use({ "hrsh7th/nvim-cmp", lock = true })
    use({ "hrsh7th/cmp-buffer", lock = true }) -- recommend text from current buffer
    use({ "hrsh7th/cmp-path", lock = true }) -- recommend paths
    use({ "hrsh7th/cmp-cmdline", lock = true })
    use({ "lukas-reineke/cmp-under-comparator", lock = true })
    use({ "hrsh7th/cmp-nvim-lsp-signature-help", lock = true })
    use({ "uga-rosa/cmp-dictionary", lock = true })

    -- snippets
    use({ "L3MON4D3/LuaSnip", lock = true })
    use({ "saadparwaiz1/cmp_luasnip", lock = true })
    use({ "rafamadriz/friendly-snippets", lock = true })

    -- managing and installing LSP servers (that mason will install)
    use({ "williamboman/mason.nvim", lock = true })
    use({ "williamboman/mason-lspconfig.nvim", lock = true }) -- bridges mason and nvim-lspconfig

    -- LSP servers config
    use({ "neovim/nvim-lspconfig", lock = true }) -- for configuring LSP servers
    use({ "hrsh7th/cmp-nvim-lsp", lock = true }) -- so that the lsp appears in autocompletion
    use({ "glepnir/lspsaga.nvim", branch = "main", lock = true }) -- enhanced lsp uis
    use({ "jose-elias-alvarez/typescript.nvim", lock = true })
    use({ "onsails/lspkind.nvim", lock = true }) -- vs-code like icons for autocompletion

    -- formatting and linting
    use({ "jose-elias-alvarez/null-ls.nvim", lock = true })
    use({ "jay-babu/mason-null-ls.nvim", lock = true }) -- similar to mason-lspconfig but for formatters

    -- DAP
    use({
        "mfussenegger/nvim-dap",
        lock = true,
        config = function()
            require("dap.ext.vscode").load_launchjs()
        end,
    })
    use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" }, lock = true })

    -- autoclosing
    use({ "windwp/nvim-autopairs", lock = true })
    use({ "windwp/nvim-ts-autotag", lock = true })

    -- git (https://www.youtube.com/watch?v=ZgyVY7tArwg)
    use({ "lewis6991/gitsigns.nvim", lock = true })

    -- terminal
    use({
        "akinsho/toggleterm.nvim",
        tag = "*",
        config = function()
            require("toggleterm").setup()
        end,
        lock = true,
    })

    --scrollbar and other UI elements
    use({ "dstein64/nvim-scrollview", lock = true })
    use({ "lukas-reineke/indent-blankline.nvim", lock = true })
    -- Lua
    use({ "folke/zen-mode.nvim", lock = true })

    -- Telescope
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make", lock = true })
    use({
        "nvim-telescope/telescope.nvim",
        -- https://github.com/nvim-telescope/telescope-live-grep-args.nvim#installation
        requires = {
            { "nvim-telescope/telescope-live-grep-args.nvim" },
        },
        config = function()
            require("telescope").load_extension("live_grep_args")
        end,
        branch = "0.1.x",
        lock = true,
    })

    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", lock = true })

    -- colors
    use({ "uga-rosa/ccc.nvim", branch = "0.7.2", lock = true })

    -- games
    use({ "ThePrimeagen/vim-be-good", lock = true })

    -- notetaking
    use({ "opdavies/toggle-checkbox.nvim", lock = true })
    -- install without yarn or npm
    use({
        "iamcco/markdown-preview.nvim",
        run = function()
            vim.fn["mkdp#util#install"]()
        end,
        lock = true,
    })
    use({ "ekickx/clipboard-image.nvim", lock = true })
    use({ "ixru/nvim-markdown", lock = true }) -- some tools for markdown files
    use({ "jghauser/follow-md-links.nvim", lock = true })

    -- profiling
    use({ "dstein64/vim-startuptime", lock = true })
end)
