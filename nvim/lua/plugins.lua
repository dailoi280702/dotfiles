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

	{ "savq/melange-nvim", lazy = false },

	{
		"Mofiqul/vscode.nvim",
		lazy = false,
		config = function()
			require("vscode")
		end,
	},
}
