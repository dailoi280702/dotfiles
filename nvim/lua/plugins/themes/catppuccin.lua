local M = {
	"catppuccin/nvim",
	lazy = false,
	enabled = false,
}

function M.config()
	require("catppuccin").setup({
		-- flavor = "macchiato",
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
