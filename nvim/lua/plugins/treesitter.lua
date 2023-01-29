return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = "BufReadPost",
	opts = {
		ensure_installed = "all",
		highlight = { enable = true },
		indent = { enable = true },
		autotag = { enable = true },
		autopairs = { enable = true },
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
