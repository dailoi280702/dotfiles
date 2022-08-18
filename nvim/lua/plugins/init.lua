return require("packer").startup(function(use)
	use({ "wbthomason/packer.nvim" }) -- Packer can manage itself

	use({ "lewis6991/impatient.nvim" })

	use({
		"nvim-treesitter/nvim-treesitter",
		opt = true,
		run = ":TSUpdate",
		event = "BufReadPost",
		config = function()
			require("treesitter-config")
		end,
	})

	use({
		"neovim/nvim-lspconfig",
		opt = true,
		config = "require('lsp')",
		event = "BufReadPre",
		-- after = "nvim-lsp-installer",
	})

	use({
		opt = false,
		"williamboman/nvim-lsp-installer",
	})

	use({
		"glepnir/lspsaga.nvim",
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
		-- event = "VimEnter",
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
		after = "nvim-cmp",
		config = "require('nvim-autopairs').setup()",
	})

	use({
		"p00f/nvim-ts-rainbow",
		opt = true,
		-- after = "nvim-treesitter",
		event = "BufReadPost",
	})

	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim", opt = false },
			{ "nvim-lua/popup.nvim", opt = true },
		},
		config = function()
			require("telescope").load_extension("file_browser")
			require("telescope-config")
		end,
		after = "telescope-file-browser.nvim",
	})

	use({
		"nvim-telescope/telescope-file-browser.nvim",
		-- after = "telescope.nvim",
		configs = function()
			require("telescope").load_extension("file_browser")
		end,
	})

	use({
		"folke/which-key.nvim",
		config = "require('whichkey-config')",
		event = { "BufRead", "BufWinEnter", "BufNewFile" },
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
		"phaazon/hop.nvim",
		-- branch = "v2",
		config = function()
			require("hop").setup({})
		end,
	})

	use({
		"norcalli/nvim-colorizer.lua",
		config = "require('colorizer').setup()",
		-- event = { "BufReadPost", "BufNewFile" },
	}) -- colorizer

	use({
		"jose-elias-alvarez/null-ls.nvim",
	}) -- null-ls

	use({
		"shime/vim-livedown",
	})

	use({
		"MunifTanjim/prettier.nvim",
		config = function()
			require("prettier-config")
		end,
	})

	use({
		"MunifTanjim/eslint.nvim",
		config = function()
			require("eslint-config")
		end,
	})

	use({
		"windwp/nvim-ts-autotag",
		opt = true,
		after = "nvim-treesitter",
	})

	-- use({
	-- 	"Pocco81/auto-save.nvim",
	-- 	config = function()
	-- 		require("AutoSave-config")
	-- 	end,
	-- 	-- event = "BufReadPost",
	-- 	after = "null-ls.nvim",
	-- })

	use({
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup({})
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
		"romgrk/barbar.nvim",
		config = function()
			require("bufferline-config")
		end,
		after = "nvim-web-devicons",
		-- event = "BufReadPost",
	})

	-- use({
	-- 	"kdheepak/tabline.nvim",
	-- 	config = function()
	-- 		require("tabline-config")
	-- 	end,
	-- 	event = "BufReadPost",
	-- })

	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("indent-blankline-config")
		end,
		event = "bufreadpost",
	})

	use({
		"kyazdani42/nvim-web-devicons",
		-- opt = true,
	})

	-- use({
	-- 	"rebelot/heirline.nvim",
	-- 	opt = true,
	-- 	config = function()
	-- 		require("heirline-config")
	-- 	end,
	-- 	event = "bufreadpost",
	-- 	-- after = "tabline.nvim",
	-- })

	use({
		"nvim-lualine/lualine.nvim",
		opt = true,
		config = function()
			require("lualine-config")
		end,
		event = "bufreadpost",
		-- after = "tabline.nvim",
	})

	use({
		opt = true,
		"SmiteshP/nvim-gps",
		config = function()
			require("nvim-gps").setup({})
		end,
		event = "bufreadpost",
		after = "lualine.nvim",
	})

	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
		after = "nvim-gps",
	})

	-- use({
	-- 	"sainnhe/gruvbox-material",
	-- 	config = function()
	-- 		require("theme-config")
	-- 	end,
	-- })

	use({
		"catppuccin/nvim",
		as = "catppuccin",
		run = ":CatppuccinCompile",
		config = function()
			require("theme-config.catppuccin")
		end,
	})
end)
