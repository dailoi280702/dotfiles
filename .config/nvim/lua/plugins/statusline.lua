local M = {
	"nvim-lualine/lualine.nvim",
	event = "VimEnter",
	enabled = true,
}

M.opts = function()
	local opts = {
		sections = {
			lualine_c = {
				{
					"filename",
					file_status = true,
					path = 1,
				},
			},
		},
		options = {
			theme = transparent,
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
		},
	}

	return opts
end

return M