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
		extended_mode = false,
		-- disable = { "html" },
		-- colors = {
		-- 	"#C34043", -- autumn red
		-- 	"#76946A", -- autumn green
		-- 	"#DCA561", -- autumn yellow
		-- 	"#7E9CD8",
		-- 	"#957FB8",
		-- 	"#A3D4D5",
		-- 	"#DCD7BA",
		-- },
	},
})
