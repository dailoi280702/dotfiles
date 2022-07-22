require("kanagawa").setup({
	-- transparent = true,
	colors = {
		bg = "#16161d",
	},
})

vim.cmd([[
	colorscheme kanagawa
	"hi CursorLine guibg=NONE
]])
