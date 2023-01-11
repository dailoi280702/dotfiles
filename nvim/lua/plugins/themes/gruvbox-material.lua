local M = {
	"sainnhe/gruvbox-material",

	lazy = false,
}

function M.config()
	vim.g.gruvbox_material_background = "medium"
	-- vim.g.gruvbox_material_foreground = "original"
	vim.g.gruvbox_material_better_performance = 1
	vim.g.gruvbox_material_enable_bold = 1
	vim.g.gruvbox_material_enable_italic = 1
	vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
	vim.g.gruvbox_material_better_performance = 1
	vim.cmd.colorscheme("gruvbox-material")
end

return M
