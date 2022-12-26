local M = {
	"sainnhe/sonokai",
	lazy = false,
	enabled = false,
}

function M.config()
	vim.g.sonokai_better_performance = 1
	vim.g.sonokai_enable_italic = 1
	vim.g.sonokai_diagnostic_virtual_text = "colored"

	vim.g.sonokai_style = "atlantis"
	vim.cmd.colorscheme("sonokai")
end

return M
