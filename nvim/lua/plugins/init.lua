return require("packer").startup(function(use)
	use({ "wbthomason/packer.nvim" }) -- Packer can manage itself
	use({ "lewis6991/impatient.nvim" })
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = "require('lualine-config')",
	})
	use({ "windwp/nvim-autopairs", config = "require('nvim-autopairs').setup()" })
	use({ "nvim-telescope/telescope.nvim", requires = "nvim-lua/plenary.nvim", config = "require('telescope-config')" })
	use({ "folke/which-key.nvim", config = "require('whichkey-config')" }) -- which-key plug
	use({ "neovim/nvim-lspconfig" })
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/cmp-cmdline" })
	use({ "hrsh7th/nvim-cmp" })
	use({ "onsails/lspkind-nvim", config = "require('lspkind-config')" })
	use({ "saadparwaiz1/cmp_luasnip" }) -- Snippets source for nvim-cmp
	use({ "L3MON4D3/LuaSnip" }) -- Snippets plugin
	use({ "rafamadriz/friendly-snippets" })
	use({ "terrortylor/nvim-comment", config = "require('nvim-comment-config')" })
	use({ "kkharji/lspsaga.nvim", config = "require('lspsaga-config')" }) --lsp saga
	use({ "williamboman/nvim-lsp-installer" }) --lsp installer
	use({ "norcalli/nvim-colorizer.lua", config = "require('colorizer').setup()" }) -- colorizer
	use({ "jose-elias-alvarez/null-ls.nvim" }) -- null-ls
	use({ "shime/vim-livedown" })
	use({ "MunifTanjim/prettier.nvim" })
	use({ "MunifTanjim/eslint.nvim" })
	use({ "windwp/nvim-ts-autotag" })
	use({ "kdheepak/tabline.nvim", config = "require('tabline-config')" })
	use({ "Pocco81/AutoSave.nvim", config = "require('AutoSave-config')" })
	use({
		"nathom/filetype.nvim",
		config = function()
			require("filetype").setup({})
		end,
	})
	use({ "dstein64/vim-startuptime" })
	-- use({ "sheerun/vim-polyglot" })
	-- use({ "Mofiqul/vscode.nvim" })
	-- use({ "bluz71/vim-moonfly-colors" })
	-- use({ "rebelot/kanagawa.nvim" })
	-- use({ "tjdevries/colorbuddy.nvim" })
	-- use({ "svrana/neosolarized.nvim" })
	use({ "pineapplegiant/spaceduck" })
end)
