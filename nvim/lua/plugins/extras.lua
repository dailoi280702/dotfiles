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
}

return M