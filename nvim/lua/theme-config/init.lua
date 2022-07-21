require("onedarkpro").setup({
	theme = "onedark_dark",
	colors = {
		bg = "#181818",
		black = "#181818",
	},
	plugins = {
		all = false,
		gitsigns_nvim = true,
		lsp_saga = true,
		native_lsp = true,
		nvim_cmp = true,
		nvim_ts_rainbow = true,
		treesitter = true,
		which_key_nvim = true,
	},
})
-- require("kanagawa").setup({
-- 	-- transparent = true,
-- 	colors = {
-- 		bg = "#16161d",
-- 	},
-- })

-- require("neosolarized").setup({
-- 	comment_italics = true,
-- })

-- local colorbuddy = require("colorbuddy.init")
-- local colors = colorbuddy.colors
-- local Group = colorbuddy.Group
-- local styles = colorbuddy.styles

vim.cmd([[
	hi PmenuSel blend=0
	colorscheme onedarkpro
]])

-- Group.new("CursorLineNr", colors.yellow, colors.base02, styles.NONE)
-- Group.new("LineNr", colors.cyan, colors.none, styles.NONE)
-- Group.new("StatusLine", colors.base1, colors.none, styles.NONE)
