local M = {}

table.insert(M, {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile", "BufWritePre", "VeryLazy" },
	init = function(plugin)
		require("lazy.core.loader").add_to_rtp(plugin)
		require("nvim-treesitter.query_predicates")
	end,
	dependencies = {},
	cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
	opts = {
		highlight = {
			enable = true,
			-- additional_vim_regex_highlighting = false,
		},
		indent = { enable = true },
		ensure_installed = "all",
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
})

table.insert(M, {
	"windwp/nvim-ts-autotag",
	event = { "BufReadPost", "BufNewFile", "BufWritePre" },
	dependencies = "nvim-treesitter",
	opts = {},
})

return M