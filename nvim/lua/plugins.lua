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
		config = function()
			require("lspsaga").init_lsp_saga({})
		end,
	},

	{
		"folke/zen-mode.nvim",
		cmd = "ZenMode",
		config = {
			window = {
				backdrop = 1,
				width = 81,
			},
			plugins = {
				gitsigns = true,
			},
		},
	},
}
