local ok, kanagawa = pcall(require, "kanagawa")
if not ok then
	return
end

kanagawa.setup({
	-- transparent = true,
	colors = {
		bg = "#16161d",
	},
})

vim.cmd([[
	colorscheme kanagawa
	highlight VertSplit guibg=NONE
	highlight HopNextKey guifg=#c34043
	highlight HopNextKey1 guifg=#c34043
	highlight HopNextKey2 guifg=#dca561
	"hi CursorLine guibg=NONE
]])
