local M = {
	"nvim-lualine/lualine.nvim",
	event = "VimEnter",
}

M.opts = {
	-- sections = {
	-- 	lualine_c = { { "filetype", path = 4 } },
	-- },
	options = {
		theme = "gruvbox",
		component_separators = { left = "", right = "" },
		-- section_separators = { left = "▓▒░", right = "░▒▓" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha" },
	},
}

return M