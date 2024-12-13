local M = {
	{ "nvim-tree/nvim-web-devicons" },
	{
		"NvChad/nvim-colorizer.lua",
		cmd = { "ColorizerToggle" },
		config = function()
			require("colorizer").setup()
		end,
	},
	-- { "HiPhish/rainbow-delimiters.nvim", event = { "VeryLazy" } },
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost", "BufNewFile", "BufWritePre", "VeryLazy" },
		lazy = false,
		main = "ibl",
		opts = {
			indent = {
				char = "▏",
			},
			scope = {
				enabled = false,
			},
		},
		config = function(_, opts)
			require("ibl").setup(opts)
		end,
	},
}

return M