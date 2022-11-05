local ok, kanagawa = pcall(require, "kanagawa")
if not ok then
	return
end

vim.cmd([[
	colorscheme kanagawa
	highlight HopNextKey guifg=#c34043
	highlight HopNextKey1 guifg=#c34043
	highlight HopNextKey2 guifg=#dca561
]])
