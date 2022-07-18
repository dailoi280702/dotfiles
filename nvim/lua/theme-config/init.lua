vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_transparent_background = 2
vim.g.gruvbox_material_ui_contrast = 1

vim.cmd([[
	syntax on
	hi PmenuSel blend=0
	colorscheme gruvbox-material
	hi Lualine guibg=none
]])
