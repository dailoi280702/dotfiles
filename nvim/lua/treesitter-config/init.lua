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
		additional_vim_regex_highlighting = false,
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
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		colors = {
			"#9CD0e74bdCFE",
			"#569CD6",
			"#4EC9B0",
			"#608B4E",
			-- "#B5CEA8",
			-- "#DCDCAA",
			"#D7BA7D",
			-- "#CE9178",
			-- "#D16969",
			-- "#F44847",
			"#C58FC0",
			"#626695",
		}, -- table of hex strings
	},
})
