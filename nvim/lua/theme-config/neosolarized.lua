local ok, neosolarized = pcall(require, "neosolarized")
if not ok then
	return
else
	return
end

neosolarized.setup({
	comment_italics = true,
})

vim.cmd([[colorscheme neosolarized]])

local colorbuddy = require("colorbuddy.init")
local colors = colorbuddy.colors
local Group = colorbuddy.Group
local styles = colorbuddy.styles

Group.new("CursorLineNr", colors.yellow, colors.base02, styles.NONE)
Group.new("LineNr", colors.cyan, colors.none, styles.NONE)
Group.new("StatusLine", colors.base1, colors.none, styles.NONE)
Group.new("HopNextKey", colors.red, colors.none, styles.NONE)
Group.new("HopNextKey1", colors.red, colors.none, styles.NONE)
Group.new("HopNextKey2", colors.yellow, colors.none, styles.NONE)
