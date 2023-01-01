local M = {
	"rose-pine/neovim",
	lazy = false,
	as = "rose-pine",
	enabled = false,
}

function M.config()
	vim.cmd.colorscheme("rose-pine")
end

return M
