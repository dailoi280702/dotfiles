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

	-- {
	-- 	"uloco/bluloco.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	dependencies = { "rktjmp/lush.nvim" },
	-- },
	--
	-- {
	-- 	"sainnhe/gruvbox-material",
	-- 	lazy = false,
	-- 	priority = 100000,
	-- 	config = function()
	-- 		vim.g.gruvbox_material_better_performance = 1
	-- 		vim.cmd.colorscheme("gruvbox-material")
	-- 	end,
	-- },
}
