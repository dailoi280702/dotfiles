local lualine = {
	"nvim-lualine/lualine.nvim",
	event = "VimEnter",
	enabled = false,
}

lualine.opts = function()
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

local mini = {
	"nvim-mini/mini.statusline",
	event = "VimEnter",
	config = function()
		require("mini.statusline").setup()
	end,
}

return { lualine, mini }