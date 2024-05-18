local M = {
	"nvim-lualine/lualine.nvim",
	event = "VimEnter",
	enabled = true,
}
-- local vscode = {}
-- local colors = {
-- 	fg = "#5A5A5A",
-- }
--
-- vscode.normal = {
-- 	a = { fg = colors.fg, bg = "none" },
-- 	b = { fg = colors.fg, bg = "none" },
-- 	c = { fg = colors.fg, bg = "none" },
-- }
--
-- vscode.visual = {
-- 	a = { fg = colors.fg, bg = "none" },
-- 	b = { fg = colors.fg, bg = "none" },
-- }
--
-- vscode.inactive = {
-- 	a = { fg = colors.fg, bg = "none" },
-- 	b = { fg = colors.inactive, bg = "none" },
-- 	c = { fg = colors.inactive, bg = "none" },
-- }
--
-- vscode.replace = {
-- 	a = { fg = colors.fg, bg = "none" },
-- 	b = { fg = colors.fg, bg = "none" },
-- 	c = { fg = colors.fg, bg = "none" },
-- }
--
-- vscode.insert = {
-- 	a = { fg = colors.fg, bg = "none" },
-- 	b = { fg = colors.fg, bg = "none" },
-- 	c = { fg = colors.fg, bg = "none" },
-- }
--
-- vscode.terminal = {
-- 	a = { fg = colors.fg, bg = "none" },
-- 	b = { fg = colors.fg, bg = "none" },
-- 	c = { fg = colors.fg, bg = "none" },
-- }
--
-- vscode.command = {
-- 	a = { fg = colors.fg, bg = "none" },
-- 	b = { fg = colors.fg, bg = "none" },
-- 	c = { fg = colors.fg, bg = "none" },
-- }

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
					path = 4,
				},
			},
		},
		options = {
			-- theme = C,
			component_separators = { left = "", right = "" },
			-- section_separators = { left = "▓▒░", right = "░▒▓" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = { "alpha" },
		},
	}

	return opts
end

return M