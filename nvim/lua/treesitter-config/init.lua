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
		-- colors = {
		-- 	"#fa7970",
		-- 	"#FF9E3B",
		-- 	"#7ce38b",
		-- 	"#a2d2fb",
		-- 	"#77bdfb",
		-- 	"#cea5fb",
		-- },
	},
})
