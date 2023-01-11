local M = {
	"savq/melange",
	lazy = false,
	priority = 1000,
}

function M.config()
	vim.o.background = "light"
	vim.cmd.colorscheme("melange")
end

return M
