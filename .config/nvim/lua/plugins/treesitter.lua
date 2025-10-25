local M = {}

table.insert(M, {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile", "BufWritePre", "VeryLazy" },
	init = function(plugin)
		require("lazy.core.loader").add_to_rtp(plugin)
		-- require("nvim-treesitter.query_predicates")
	end,
	dependencies = { "nvim-treesitter/nvim-treesitter-context" },
	cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
	opts = {
		highlight = {
			enable = true,
			-- additional_vim_regex_highlighting = false,
		},
		indent = { enable = true },
		ensure_installed = "all",
		ignore_install = { "ipkg" },
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
		require("treesitter-context").setup({
			max_lines = 3,
			min_window_height = 20,
			multiline_threshold = 1,
		})
	end,
})

table.insert(M, {
	"windwp/nvim-ts-autotag",
	event = { "BufReadPost", "BufNewFile", "BufWritePre" },
	dependencies = "nvim-treesitter",
	opts = {},
	entabled = false,
})

return M