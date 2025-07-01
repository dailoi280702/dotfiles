local M = {
	"nvim-lualine/lualine.nvim",
	event = "VimEnter",
	enabled = true,
}

local transparent = {
	normal = {
		a = { bg = "None", gui = "None" },
		b = { bg = "None", gui = "None" },
		c = { bg = "None", gui = "None" },
		x = { bg = "None", gui = "None" },
		y = { bg = "None", gui = "None" },
		z = { bg = "None", gui = "None" },
	},
	insert = {
		a = { bg = "None", gui = "None" },
		b = { bg = "None", gui = "None" },
		c = { bg = "None", gui = "None" },
		x = { bg = "None", gui = "None" },
		y = { bg = "None", gui = "None" },
		z = { bg = "None", gui = "None" },
	},
	visual = {
		a = { bg = "None", gui = "None" },
		b = { bg = "None", gui = "None" },
		c = { bg = "None", gui = "None" },
		x = { bg = "None", gui = "None" },
		y = { bg = "None", gui = "None" },
		z = { bg = "None", gui = "None" },
	},
	replace = {
		a = { bg = "None", gui = "None" },
		b = { bg = "None", gui = "None" },
		c = { bg = "None", gui = "None" },
		x = { bg = "None", gui = "None" },
		y = { bg = "None", gui = "None" },
		z = { bg = "None", gui = "None" },
	},
	command = {
		a = { bg = "None", gui = "None" },
		b = { bg = "None", gui = "None" },
		c = { bg = "None", gui = "None" },
		x = { bg = "None", gui = "None" },
		y = { bg = "None", gui = "None" },
		z = { bg = "None", gui = "None" },
	},
	inactive = {
		a = { bg = "None", gui = "None" },
		b = { bg = "None", gui = "None" },
		c = { bg = "None", gui = "None" },
		x = { bg = "None", gui = "None" },
		y = { bg = "None", gui = "None" },
		z = { bg = "None", gui = "None" },
	},
}

M.opts = function()
	-- local C = require("lualine.themes.auto")
	--
	-- C.normal.c.bg = nil
	-- C.inactive.c.bg = nil

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
			-- section_separators = { left = "▓▒░", right = "░▒▓" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = { "alpha" },
		},
	}

	return opts
end

return M