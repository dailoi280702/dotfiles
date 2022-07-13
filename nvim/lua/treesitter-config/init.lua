require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"c",
		"html",
		"javascript",
		"lua",
		"fish",
		"php",
		"python",
		"yaml",
		"java",
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
	indent = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
	autopairs = {
		enable = true,
	},
})
