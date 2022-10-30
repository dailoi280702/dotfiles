return require("packer").startup(function(use)
	use({ "wbthomason/packer.nvim" }) -- Packer can manage itself

	use({ "lewis6991/impatient.nvim" })

	use({
		"nvim-treesitter/nvim-treesitter",
		opt = true,
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		event = "BufRead",
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
		-- "norcalli/nvim-colorizer.lua",
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("colorizer-config")
		end,
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
		"windwp/nvim-ts-autotag",
		opt = true,
		after = "nvim-treesitter",
	})

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

	use({
		"nvim-lualine/lualine.nvim",
		opt = true,
		config = function()
			require("lualine-config")
		end,
		event = "bufreadpost",
	})

	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
		after = "lualine.nvim",
	})

	-- use({
	-- 	"rose-pine/neovim",
	-- 	as = "rose-pine",
	-- 	config = function()
	-- 		-- require("rose-pine").setup({
	-- 		-- 	disable_background = true,
	-- 		-- 	disable_float_background = true,
	-- 		-- })
	-- 		vim.cmd.colorscheme("rose-pine")
	-- 	end,
	-- })

	use({
		"catppuccin/nvim",
		as = "catppuccin",
		config = function()
			require("theme-config.catppuccin")
		end,
	})

	-- use({
	-- 	"EdenEast/nightfox.nvim",
	-- 	config = function()
	-- 		require("nightfox").init({ transparent = true })
	-- 		vim.cmd.colorscheme("terafox")
	-- 	end,
	-- })

	-- use({
	-- 	"sainnhe/gruvbox-material",
	-- 	config = function()
	-- 		vim.g.gruvbox_material_better_performance = 1
	-- 		vim.g.gruvbox_material_enable_italic = 1
	-- 		vim.g.gruvbox_material_ui_contrast = "high"
	-- 		-- vim.g.gruvbox_material_background = "hard"
	-- 		vim.cmd.colorscheme("gruvbox-material")
	-- 	end,
	-- })

	use({
		"akinsho/bufferline.nvim",
		config = function()
			require("bufferline-config")
		end,
		after = "lualine.nvim",
	})
end)
