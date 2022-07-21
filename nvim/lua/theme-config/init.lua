-- require("kanagawa").setup({
-- 	transparent = true,
-- })
require("neosolarized").setup({
	comment_italics = true,
})

local colorbuddy = require("colorbuddy.init")
local colors = colorbuddy.colors
local Group = colorbuddy.Group
local styles = colorbuddy.styles

vim.cmd([[
	hi PmenuSel blend=0
	colorscheme neosolarized
]])

Group.new("CursorLineNr", colors.yellow, colors.base02, styles.NONE)
Group.new("LineNr", colors.cyan, colors.none, styles.NONE)
