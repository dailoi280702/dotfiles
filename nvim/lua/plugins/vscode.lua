local M = {
	"Mofiqul/vscode.nvim",
	lazy = false,
	enabled = false,
}

function M.config()
	require("vscode").setup({ italic_comments = false })
end

return M
