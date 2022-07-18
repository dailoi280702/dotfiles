return require("packer").startup(function(use)
	config = "require('telescope-config')", use({ "wbthomason/packer.nvim" }) -- Packer can manage itself

	use({ "lewis6991/impatient.nvim" })

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("treesitter-config")
		end,
	})

	use({
		"neovim/nvim-lspconfig",
		opt = true,
		config = "require('lsp')",
		event = "BufReadPre",
	})

	use({
		opt = false,
		"williamboman/nvim-lsp-installer",
	}) --lsp installer

	use({
		"kkharji/lspsaga.nvim",
		opt = true,
		config = "require('lspsaga-config')",
		after = "nvim-lspconfig",
	}) --lsp saga

	use({
		"hrsh7th/nvim-cmp",
		requires = {
			{ "saadparwaiz1/cmp_luasnip", after = "LuaSnip" },
			{ "hrsh7th/cmp-nvim-lsp", after = "cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lua", after = "cmp-nvim-lsp" },
			{ "hrsh7th/cmp-path", after = "cmp-nvim-lua" },
			{ "hrsh7th/cmp-buffer", after = "cmp-path" },
			{ "hrsh7th/cmp-cmdline", after = "cmp-buffer" },
		},
		event = "InsertEnter",
		config = function()
			require("lsp.cmp")
		end,
	})

	use({
		"L3MON4D3/LuaSnip",
		after = "nvim-cmp",
		requires = "rafamadriz/friendly-snippets",
		config = function()
			require("luasnip.loaders.from_lua").lazy_load()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	}) -- Snippets plugin

	use({
		"windwp/nvim-autopairs",
		config = "require('nvim-autopairs').setup()",
	})

	use({
		"p00f/nvim-ts-rainbow",
		opt = true,
		after = "nvim-treesitter",
		event = "BufReadPost",
	})

	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim", opt = false },
			{ "nvim-lua/popup.nvim", opt = true },
		},
	})

	use({
		"nvim-telescope/telescope-file-browser.nvim",
		after = "telescope.nvim",
		configs = function()
			require("telescope").load_extension("file_browser")
		end,
	})

	use({
		"folke/which-key.nvim",
		config = "require('whichkey-config')",
	}) -- which-key plug

	use({
		"onsails/lspkind-nvim",
		config = "require('lspkind-config')",
	})

	-- use({ "saadparwaiz1/cmp_luasnip" }) -- Snippets source for nvim-cmp

	use({
		"terrortylor/nvim-comment",
		config = "require('nvim-comment-config')",
	})

	use({
		"norcalli/nvim-colorizer.lua",
		config = "require('colorizer').setup()",
	}) -- colorizer

	use({ "jose-elias-alvarez/null-ls.nvim" }) -- null-ls

	-- use({ "p00f/nvim-ts-rainbow" })

	use({ "shime/vim-livedown" })

	use({
		"MunifTanjim/prettier.nvim",
		-- config = function()
		-- 	require("prettier-config")
		-- end,
	})

	use({
		"MunifTanjim/eslint.nvim",
		-- config = function()
		-- 	require("eslint-config")
		-- end,
	})

	use({ "windwp/nvim-ts-autotag" })

	use({
		"Pocco81/AutoSave.nvim",
		config = function()
			require("AutoSave-config")
		end,
	})

	use({
		"nathom/filetype.nvim",
		config = function()
			require("filetype").setup({})
		end,
	})

	use({ "dstein64/vim-startuptime" })

	use({
		"kdheepak/tabline.nvim",
		config = function()
			require("tabline-config")
		end,
		event = "BufReadPost",
	})

	-- use({
	-- 	"akinsho/bufferline.nvim",
	-- 	requires = { "kyazdani42/nvim-web-devicons", opt = true },
	-- 	config = function()
	-- 		require("bufferline-config")
	-- 	end,
	-- 	event = "BufReadPost",
	-- })

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require("lualine-config")
		end,
		event = "BufReadPost",
	})

	-- themes
	use({
		"sainnhe/gruvbox-material",
		config = function()
			require("theme-config")
		end,
	})

	use({ "NvChad/base46" })
end)
