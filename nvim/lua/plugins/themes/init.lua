return {
	{
		"shaunsingh/oxocarbon.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("oxocarbon")
			vim.api.nvim_set_hl(0, "StatusLine", { bg = "#161616" })
			vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#161616" })
		end,
	},
}
