require("nvim-treesitter.configs").setup({
	-- ensure_installed = {
	-- 	"html",
	-- 	"javascript",
	-- 	"lua",
	-- 	"fish",
	-- 	"python",
	-- 	"java",
	-- 	"c",
	-- },
	ensure_installed = "all",
	highlight = {
		enable = true,
		-- use_languagetree = true,
		additional_vim_regex_highlighting = false,
		-- disable = { "css" },
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
		enable = false,
		extended_mode = true,
	},
})
