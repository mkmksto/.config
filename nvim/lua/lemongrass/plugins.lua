local has = vim.fn.has
local is_linux = has("unix")
local is_wsl = (function()
    local output = vim.fn.systemlist("uname -r")
    return not not string.find(output[1] or "", "WSL")
end)()

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

local status, packer = pcall(require, "packer")
if not status then
    return
end

packer.init({
    snapshot_path = vim.fn.expand("~/.config/nvim/packer_snaps/"),
})

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`

return require("packer").startup(function(use)
    -- main
    use({ "wbthomason/packer.nvim" })
    use({ "nvim-lua/plenary.nvim", lock = true })

    -- color schemes
    use({ "nyoom-engineering/oxocarbon.nvim", lock = true, opt = true })
    use({ "olimorris/onedarkpro.nvim", lock = true, opt = true })
    use({ "catppuccin/nvim", as = "catppuccin", lock = true })

    -- refactoring
    use({
        "ThePrimeagen/refactoring.nvim",
        lock = true,
        opt = true,
        config = [[require('lemongrass.lazyload.refactoring')]],
    })
    use({ "windwp/nvim-spectre", lock = true, cmd = "Spectre", config = [[require('lemongrass.lazyload.spectre')]] })

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

    -- aucomplete / cmp / autocomplettion
    use({
        "hrsh7th/nvim-cmp",
        lock = true,
        config = function()
            require("lemongrass.lazyload.nvimcmp")
        end,
    })
    use({ "hrsh7th/cmp-buffer", lock = true, event = "InsertEnter" })
    use({ "hrsh7th/cmp-path", lock = true, event = "InsertEnter" })
    use({ "hrsh7th/cmp-cmdline", lock = true })
    use({ "lukas-reineke/cmp-under-comparator", lock = true })
    use({ "hrsh7th/cmp-nvim-lsp-signature-help", lock = true, event = "InsertEnter" })

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
            require("lemongrass.lazyload.debugging")
        end,
        cmd = { "DapContinue", "DapToggleBreakpoint" },
    })
    use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" }, lock = true })

    -- Treesitter
    -- examples of lazyloading: https://github.com/jdhao/nvim-config/blob/master/lua/plugins.lua#L36
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        lock = true,
        event = "BufWinEnter",
        config = [[require('lemongrass.lazyload.treesitter')]],
    })
    -- autoclosing
    use({ "windwp/nvim-autopairs", lock = true })
    use({
        "windwp/nvim-ts-autotag",
        lock = true,
        after = "nvim-treesitter",
        event = "InsertEnter",
    })

    -- git (https://www.youtube.com/watch?v=ZgyVY7tArwg)
    use({ "lewis6991/gitsigns.nvim", lock = true })

    -- terminal
    use({
        "akinsho/toggleterm.nvim",
        tag = "*",
        config = function()
            require("lemongrass.lazyload.toggleterm")
        end,
        lock = true,
        cmd = { "ToggleTerm", "ToggleTermToggleAll" },
    })

    --scrollbar and other UI elements
    use({ "dstein64/nvim-scrollview", lock = true })
    use({
        "lukas-reineke/indent-blankline.nvim",
        lock = true,
        event = "BufRead",
        config = [[require('lemongrass.lazyload.indent-blank')]],
    })
    -- Lua
    use({
        "folke/zen-mode.nvim",
        lock = true,
        event = "BufRead",
        config = [[require('lemongrass.lazyload.zenmode')]],
    })

    -- Telescope
    use({
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        lock = true,
    })
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make", lock = true, after = "telescope.nvim" })
    use({
        "nvim-telescope/telescope-live-grep-args.nvim",
        lock = true,
        after = "telescope.nvim",
        config = function()
            require("telescope").load_extension("live_grep_args")
            -- Telescope with rg syntax
            local telescope_rg = require("telescope").extensions.live_grep_args
            vim.keymap.set("n", "<leader>trg", function()
                telescope_rg.live_grep_args()
            end, { desc = "[Telescope] live grep with args (defaults to cwd)" })
        end,
    })
    use({
        "AckslD/nvim-neoclip.lua",
        lock = true,
        after = "telescope.nvim",
    })

    -- project and session management
    use({ "cljoly/telescope-repo.nvim", lock = true, after = "telescope.nvim" })
    use({ "gnikdroy/projections.nvim", lock = true })
    use({
        "rmagatti/auto-session",
        config = function()
            require("auto-session").setup({
                log_level = "error",
                cwd_change_handling = {
                    post_cwd_changed_hook = function() -- example refreshing the lualine status line _after_ the cwd changes
                        require("lualine").refresh() -- refresh lualine so the new session name is displayed in the status bar
                    end,
                },
                auto_session_enabled = true,
                auto_save_enabled = true,
                auto_restore_enabled = true,
            })
        end,
        lock = true,
    })

    -- colors
    use({ "uga-rosa/ccc.nvim", branch = "0.7.2", lock = true })

    -- games
    use({ "ThePrimeagen/vim-be-good", lock = true, cmd = "VimBeGood" })

    -- notetaking
    use({ "opdavies/toggle-checkbox.nvim", lock = true, ft = { "markdown" } })
    -- install without yarn or npm
    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
        lock = true,
    })

    if is_wsl then
        -- https://github.com/ekickx/clipboard-image.nvim/issues/34
        use({
            "ekickx/clipboard-image.nvim",
            lock = true,
            branch = "feat_WSL",
            ft = { "markdown" },
            config = [[require('lemongrass.lazyload.clip-image')]],
        })
    elseif is_linux then
        use({
            "ekickx/clipboard-image.nvim",
            lock = true,
            ft = { "markdown" },
            config = [[require('lemongrass.lazyload.clip-image')]],
        })
    end

    use({ "ixru/nvim-markdown", lock = true, ft = { "markdown" } }) -- some tools for markdown files
    use({ "jghauser/follow-md-links.nvim", lock = true, ft = { "markdown" } })

    -- profiling
    use({ "dstein64/vim-startuptime", lock = true })
end)
