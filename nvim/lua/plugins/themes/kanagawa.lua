local M = {
	"rebelot/kanagawa.nvim",

	lazy = false,
}

function M.config()
	-- local my_colors = {
	-- 	bg = "#16161D",
	-- }
	-- require("kanagawa").setup({
	-- 	transparent = true,
	-- 	colors = my_colors,
	-- })
	vim.cmd.colorscheme("kanagawa")
end

return M
