-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use("nvim-lua/plenary.nvim")

	use("bluz71/vim-nightfly-guicolors")

	use("mhartington/oceanic-next")

	use("nyoom-engineering/oxocarbon.nvim")

	use({
		"rose-pine/neovim",
		as = "rose-pine",
		-- config = function()
		-- 	vim.cmd("colorscheme rose-pine")
		-- end,
	})

	use("lmburns/kimbox")
	use({
		"NvChad/ui",

		config = function()
			local present, nvchad_ui = pcall(require, "nvchad_ui")

			if present then
				nvchad_ui.setup()
			end
		end,
	})

	use({
		"ray-x/starry.nvim",
		setup = function()
			-- see example setup below
			vim.g.starry_italic_comments = true
		end,
	})

	-- refactoring
	use("ThePrimeagen/refactoring.nvim")

	use("numToStr/Comment.nvim")

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
	use("jayp0521/mason-null-ls.nvim") -- similar to mason-lspconfig but for formatters

	-- autoclosing
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")

	-- git
	use("lewis6991/gitsigns.nvim")

	-- terminal
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("toggleterm").setup()
		end,
	})

	--scrollbar
	use("dstein64/nvim-scrollview")

	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })

	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
end)
