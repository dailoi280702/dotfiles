return {
	{
		"shaunsingh/oxocarbon.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("colors").setup("oxocarbon")
		end,
	},
}
