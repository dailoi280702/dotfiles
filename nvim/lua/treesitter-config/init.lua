require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"html",
		"javascript",
		"lua",
		"fish",
		"python",
		"java",
		"c",
	},
	highlight = {
		enable = true,
		-- use_languagetree = true,
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
	rainbow = {
		enable = true,
		extended_mode = true,
		disable = { "html" },
		colors = {
			"#A3D4D5",
			"#E46876",
			"#D27E99",
			"#FF9E3B",
			"#76946A",
			"#957FB8",
			"#7E9CD8",
		},
	},
})
