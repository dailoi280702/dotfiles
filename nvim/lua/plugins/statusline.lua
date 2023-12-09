local M = {
	"nvim-lualine/lualine.nvim",
	event = "VimEnter",
}

M.opts = {
	sections = {
		lualine_c = {
			{
				"filename",
				file_status = true,
				path = 4,
			},
		},
	},
	options = {
		theme = "oxocarbon",
		component_separators = { left = "", right = "" },
		-- section_separators = { left = "▓▒░", right = "░▒▓" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha" },
	},
}

return M