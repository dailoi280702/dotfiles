local M = {
	{
		"echasnovski/mini.icons",
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

	-- {
	-- 	"lukas-reineke/indent-blankline.nvim",
	-- 	event = { "BufReadPost", "BufNewFile", "BufWritePre", "VeryLazy" },
	-- 	lazy = false,
	-- 	main = "ibl",
	-- 	opts = {
	-- 		indent = {
	-- 			char = "▏",
	-- 		},
	-- 		scope = {
	-- 			enabled = false,
	-- 		},
	-- 	},
	-- 	config = function(_, opts)
	-- 		require("ibl").setup(opts)
	-- 	end,
	-- },

	{
		"echasnovski/mini.misc",
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