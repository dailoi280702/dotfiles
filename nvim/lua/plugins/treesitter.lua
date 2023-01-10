local M = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = "BufReadPost",
}

function M.config()
	require("nvim-treesitter.configs").setup({
		transparent = true,
		ensure_installed = "all",
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		indent = {
			enable = true,
		},
		autotag = {
			enable = true,
		},
		autopairs = {
			enable = true,
		},
		rainbow = {
			enable = false,
		},
	})
end

return M
