local M = {
	"rose-pine/neovim",
	lazy = false,
	as = "rose-pine",
}

function M.config()
	require("rose-pine").setup({
		disable_background = true,
	})
	vim.cmd.colorscheme("rose-pine")
end

return M
