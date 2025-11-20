local M = {
	{
		"nvim-mini/mini.icons",
		config = function()
			require("mini.icons").setup()
			MiniIcons.mock_nvim_web_devicons()
		end,
	},

	{
		"NvChad/nvim-colorizer.lua",
		cmd = { "ColorizerToggle" },
		config = function()
			require("colorizer").setup()
		end,
	},

	{
		"nvim-mini/mini.misc",
		opts = {
			make_global = {
				"put",
				"put_text",
				"setup_termbg_sync",
				"zoom",
			},
		},
	},

	{
		"nvim-mini/mini.cursorword",
		config = function()
			require("mini.cursorword").setup({})
		end,
	},

	{
		"nvimdev/lspsaga.nvim",
		opts = {
			ui = {},

			lightbulb = {
				enable = false,
			},
		},
	},
}

for i, _ in ipairs(M) do
	M[i] = vim.tbl_extend("force", M[i], { lazy = true, event = "VeryLazy" })
end

return M