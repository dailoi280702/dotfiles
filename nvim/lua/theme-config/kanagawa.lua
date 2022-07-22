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
	"hi CursorLine guibg=NONE
]])
