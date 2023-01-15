local M = {
	"rose-pine/neovim",
	lazy = false,
	as = "rose-pine",
}

function M.config()
	require("rose-pine").setup({
		-- disable_background = true,
		disable_italics = true,
	})
	-- vim.o.background = "light"
	vim.cmd.colorscheme("rose-pine")
end

return M
