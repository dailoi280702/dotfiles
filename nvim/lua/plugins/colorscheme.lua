local M = {
	"rose-pine/neovim",
	lazy = false,
	priority = 1000,
}

M.config = function()
	local theme = require("rose-pine")
	theme.setup({
		disable_background = true,
		disable_italics = true,
	})

	vim.cmd.colorscheme("rose-pine")
end

return M