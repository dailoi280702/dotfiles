return {
	"folke/which-key.nvim",

	{
		"nvim-tree/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup({})
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
		event = "BufReadPre",
	},

	{
		"phaazon/hop.nvim",
		config = function()
			require("hop").setup()
		end,
		event = "VeryLazy",
	},

	{
		"glepnir/lspsaga.nvim",
		event = "BufReadPre",
		branch = "main",
		config = function()
			require("lspsaga").setup({
				-- custom_kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
				symbol_in_winbar = {
					enable = false,
				},
			})
		end,
	},

	{
		"folke/zen-mode.nvim",
		cmd = "ZenMode",
		opts = {
			window = {
				backdrop = 1,
				width = 91,
			},
			plugins = {
				gitsigns = true,
			},
		},
	},

	{
		"windwp/nvim-ts-autotag",
		event = "BufReadPost",
	},

	{
		"shaunsingh/nord.nvim",
		lazy = false,
	},

	-- {
	-- 	"mrjones2014/nvim-ts-rainbow",
	-- 	event = "BufReadPost",
	-- },
}
