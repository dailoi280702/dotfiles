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
	-- rainbow = {
	-- 	enable = true,
	-- 	extended_mode = true,
	-- 	-- disable = { "html" },
	-- },
})
