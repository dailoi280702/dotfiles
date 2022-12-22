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
}
