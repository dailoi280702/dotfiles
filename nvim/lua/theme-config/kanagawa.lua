local ok, kanagawa = pcall(require, "kanagawa")
if not ok then
	return
end

-- kanagawa.setup({
-- 	colors = {
-- 		-- bg = "#181818",
-- 		bg = "#16161d",
-- 	},
-- 	-- transparent = true,
-- })

vim.cmd([[
	colorscheme kanagawa
	"highlight VertSplit guibg=NONE
	highlight HopNextKey guifg=#c34043
	highlight HopNextKey1 guifg=#c34043
	highlight HopNextKey2 guifg=#dca561
	"hi CursorLine guibg=NONE
]])
