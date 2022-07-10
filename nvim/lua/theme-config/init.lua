vim.g.vscode_transparency = 1
vim.g.vscode_italic_comment = 1
vim.cmd([[
  if exists("&termguicolors") && exists("&winblend")
    colorscheme vscode
    highlight LineNr guibg=#222222
    highlight CursorLineNR guibg=#222222
  endif
]])
