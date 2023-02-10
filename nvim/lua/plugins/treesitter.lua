return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = "BufReadPost",
	dependencies = {
		"p00f/nvim-ts-rainbow",
	},
	opts = {
		ensure_installed = "all",
		highlight = { enable = true, use_languagetree = true },
		indent = { enable = true },
		autotag = { enable = true },
		autopairs = { enable = true },
		rainbow = {
			enable = true,
			extended_mode = true,
			colors = {
				"#878d96",
				"#a8a8a8",
				"#8d8d8d",
				"#a2a9b0",
				"#8f8b8b",
				"#ada8a8",
				"#878d96",
			},
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
