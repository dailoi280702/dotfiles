require("kanagawa").setup({
	-- transparent = true,
	colors = {
		bg = "#16161d",
	},
})
-- require("neosolarized").setup({
-- 	comment_italics = true,
-- })

-- local colorbuddy = require("colorbuddy.init")
-- local colors = colorbuddy.colors
-- local Group = colorbuddy.Group
-- local styles = colorbuddy.styles

vim.cmd([[
	hi PmenuSel blend=0
	colorscheme kanagawa
]])

-- Group.new("CursorLineNr", colors.yellow, colors.base02, styles.NONE)
-- Group.new("LineNr", colors.cyan, colors.none, styles.NONE)
-- Group.new("StatusLine", colors.base1, colors.none, styles.NONE)
