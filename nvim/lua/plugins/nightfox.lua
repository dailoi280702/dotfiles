local M = {
	"EdenEast/nightfox.nvim",
	lazy = false,
}

function M.config()
	require("nightfox").setup({
		palettes = {
			nordfox = {
				bg1 = "#1b1f26",
			},
		},
	})
	vim.cmd.colorscheme("nordfox")
end

return M
