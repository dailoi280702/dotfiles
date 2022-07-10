return require("packer").startup(function(use)
	use({ "wbthomason/packer.nvim" }) -- Packer can manage itself
	use({ "lewis6991/impatient.nvim" })
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = "require('treesitter-config')",
	})
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = "require('lualine-config')",
	})
	use({ "windwp/nvim-autopairs", config = "require('nvim-autopairs').setup()" })
	use({ "nvim-telescope/telescope.nvim", requires = "nvim-lua/plenary.nvim", config = "require('telescope-config')" })
	use({ "folke/which-key.nvim", config = "require('whichkey-config')" }) -- which-key plug
	use({ "neovim/nvim-lspconfig", config = "require('lsp')" })
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/cmp-cmdline" })
	use({ "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-vsnip" })
	use({ "onsails/lspkind-nvim", config = "require('lspkind-config')" })
	use({ "saadparwaiz1/cmp_luasnip" }) -- Snippets source for nvim-cmp
	use({ "L3MON4D3/LuaSnip" }) -- Snippets plugin
	use({ "rafamadriz/friendly-snippets" })
	use({ "terrortylor/nvim-comment", config = "require('nvim-comment-config')" })
	use({ "tami5/lspsaga.nvim", config = "require('lspsaga-config')" }) --lsp saga
	use({ "williamboman/nvim-lsp-installer" }) --lsp installer
	use({ "norcalli/nvim-colorizer.lua", config = "require('colorizer').setup()" }) -- colorizer
	use({ "jose-elias-alvarez/null-ls.nvim" }) -- null-ls
	use({ "p00f/nvim-ts-rainbow" })
	use({ "shime/vim-livedown" })
	use({ "MunifTanjim/prettier.nvim", config = "require('prettier-config')" })
	use({ "windwp/nvim-ts-autotag" })
	use({ "kdheepak/tabline.nvim", config = "require('tabline-config')" })
	use({ "Pocco81/AutoSave.nvim", config = "require('AutoSave-config')" })
	use({ "Mofiqul/vscode.nvim" })
	use({
		"nathom/filetype.nvim",
		config = function()
			require("filetype").setup({})
		end,
	})
end)
