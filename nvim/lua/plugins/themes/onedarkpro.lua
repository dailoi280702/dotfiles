local M = {
	"olimorris/onedarkpro.nvim",

	priority = 1000,
	lazy = false,
}

function M.config()
	require("onedarkpro").setup({
		plugins = {
			gitsigns = true,
			hop = true,
			lsp_saga = true,
			nvim_cmp = true,
			nvim_ts_rainbow = true,
			telescope = true,
			treesitter = true,
			which_key = true,
		},
		styles = {
			comments = "italic",
			functions = "bold",
			virtual_text = "italic",
		},
		options = {
			transparency = true,
		},
	})
	vim.cmd.colorscheme("onedark_dark")
end

return M
