local M = {
	"uloco/bluloco.nvim",
	lazy = false,
	priority = 1000,
	dependencies = { "rktjmp/lush.nvim" },
}

function M.config()
	vim.cmd.colorscheme("bluloco-light")
end

return M
