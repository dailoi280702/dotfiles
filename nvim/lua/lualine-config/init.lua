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
	},
	sections = {
		lualine_c = {
			{ gps.get_location, cond = gps.is_available },
		},
	},
	inactive_sections = {
		lualine_c = {
			{
				"filename",
				file_status = true, -- displays file status (readonly status, modified status)
				path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
			},
		},
	},
})
