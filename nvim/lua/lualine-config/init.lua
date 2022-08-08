local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

vim.cmd([[packadd nvim-gps]])
local gps = require("nvim-gps")

lualine.setup({
	options = {
		-- theme = require("lualine-config.onedarkpro"),
		globalstatus = true,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_b = {
			"branch",
			"diff",
		},
		lualine_c = {
			{ gps.get_location, cond = gps.is_available },
		},
		lualine_x = { "diagnostics", "filetype" },
	},
})
