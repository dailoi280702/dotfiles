local M = {
	{ "nvim-tree/nvim-web-devicons" },
	-- { "echasnovski/mini.icons", event = "VeryLazy" }, -- mock_devicons = true
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

	{
		"echasnovski/mini.misc",
		lazy = false,
		event = "VeryLazy",
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
		"yetone/avante.nvim",
		event = "VeryLazy",
		version = false, -- Never set this value to "*"! Never!
		opts = {
			-- add any opts here
			-- for example
			-- provider = "gemini",
			providers = {
				gemini = {
					endpoint = "https://generativelanguage.googleapis.com/v1beta/models",
					model = "gemini-2.5-pro-preview-05-06",
					timeout = 30000, -- Timeout in milliseconds
					temperature = 0,
					max_tokens = 8192,
				},
			},
		},
		-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
		build = "make",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			{
				-- Make sure to set this up properly if you have lazy=true
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
	},
}

return M