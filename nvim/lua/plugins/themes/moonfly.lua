local M = {
	"bluz71/vim-moonfly-colors",

	lazy = false,
	priority = 1000,
}

function M.config()
	vim.g.moonflyTransparent = true

	-- vim.api.nvim_create_autocmd("ColorScheme", {
	-- 	pattern = "moonfly",
	-- 	callback = function()
	-- 		vim.api.nvim_set_hl(0, "Function", { fg = "#74b2ff", bold = true })
	-- 	end,
	-- 	group = custom_highlight,
	-- })

	vim.cmd.colorscheme("moonfly")
end

return M
