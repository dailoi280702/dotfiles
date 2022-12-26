local M = {
	"catppuccin/nvim",
	lazy = false,
	enabled = false,
}

function M.config()
	require("catppuccin").setup({
		flavor = "macchiato",
	})
	vim.cmd.colorscheme("catppuccin")
end

return M
