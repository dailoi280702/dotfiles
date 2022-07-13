vim.g.moonflyTransparent = 1
vim.cmd([[
  if exists("&termguicolors") && exists("&winblend")
    colorscheme spaceduck
  endif
]])
