-- vim.g.vscode_transparency = 1
-- vim.g.vscode_italic_comment = 1
-- vim.g.moonflyTransparent = 1
-- require("kanagawa").setup({ transparent = true })
vim.cmd([[
  if exists("&termguicolors") && exists("&winblend")
    colorscheme kanagawa
    "highlight LineNr guibg=#222222
    "highlight CursorLineNR guibg=#222222
		"highlight LineNr guibg=#363646
		highlight CursorLineNR guibg=#363646
  endif
]])
