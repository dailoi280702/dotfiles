local M = {
	"rebelot/kanagawa.nvim",

	lazy = false,
	enabled = false,
}

function M.config()
	require("kanagawa").setup({
		-- commentStyle = { italic = false },
		-- functionStyle = { bold = true },
		-- keywordStyle = { italic = false },
		-- statementStyle = { bold = true },
	})
	vim.cmd.colorscheme("kanagawa")
end

return M
