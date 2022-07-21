local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local custom_kanagawa = require("lualine.themes.kanagawa")
custom_kanagawa.normal.c.bg = "#1f1f28"
custom_kanagawa.normal.c.bg = "16161d"
custom_kanagawa.visual.b.bg = "#252535"
custom_kanagawa.insert.b.bg = "#252535"
custom_kanagawa.inactive.b.bg = "#252535"
custom_kanagawa.command.b.bg = "#252535"
custom_kanagawa.replace.b.bg = "#252535"
custom_kanagawa.visual.b.bg = "#252535"

-- local neosolarized = {}
-- local colors = {}

-- colors.base03 = "#002b36"
-- colors.base02 = "#073642"
-- -- colors.base01 = "#586e75"
-- colors.base00 = "#657b83"
-- colors.base0 = "#839496"
-- colors.base1 = "#93a1a1"
-- -- colors.base2 = "#eee8d5"
-- -- colors.base3 = "#fdf6e3"
-- colors.yellow = "#b58900"
-- -- colors.orange = "#cb4b16"
-- colors.red = "#dc322f"
-- colors.magenta = "#d33682"
-- -- colors.violet = "#6c71c4"
-- colors.blue = "#268bd2"
-- -- colors.cyan = "#2aa198"
-- colors.green = "#719e07"

-- neosolarized = {
-- 	normal = {
-- 		a = { fg = colors.base03, bg = colors.blue, gui = "bold" },
-- 		b = { fg = colors.base1, bg = colors.base02 },
-- 		c = { fg = colors.base1, bg = "#001b26" },
-- 	},
-- 	insert = {
-- 		a = { fg = colors.base03, bg = colors.green, gui = "bold" },
-- 	},
-- 	visual = { a = { fg = colors.base03, bg = colors.magenta, gui = "bold" } },
-- 	replace = { a = { fg = colors.base03, bg = colors.red, gui = "bold" } },
-- 	inactive = {
-- 		a = { fg = colors.base0, bg = colors.base02, gui = "bold" },
-- 		b = { fg = colors.base03, bg = colors.base00 },
-- 		-- c = { fg = colors.base01, bg = colors.base02 },
-- 	},
-- 	command = { a = { fg = colors.base03, bg = colors.yellow, gui = "bold" } },
-- 	-- replace = { a = { fg = colors.base03, bg = colors.red, gui = "bold" } },
-- }

vim.cmd([[packadd nvim-gps]])
local gps = require("nvim-gps")

lualine.setup({
	options = {
		theme = custom_kanagawa,
		globalstatus = true,
	},

	sections = {
		lualine_c = {
			-- {
			-- 	"filename",
			-- 	file_status = true, -- displays file status (readonly status, modified status)
			-- 	path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
			-- },
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
