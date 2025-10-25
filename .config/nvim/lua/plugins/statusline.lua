local M = {
	"nvim-lualine/lualine.nvim",
	event = "VimEnter"
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
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
		},
	}

	return opts
end

return M