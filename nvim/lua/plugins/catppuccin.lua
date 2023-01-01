local M = {
	"catppuccin/nvim",
	lazy = false,
}

function M.config()
	require("catppuccin").setup({
		-- flavor = "macchiato",
		transparent_background = true,
		integrations = {
			hop = true,
			lsp_saga = true,
			mini = true,
			ts_rainbow = true,
			which_key = true,
		},
	})
	vim.cmd.colorscheme("catppuccin")
end

return M
