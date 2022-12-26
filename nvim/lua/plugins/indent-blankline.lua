local M = {
	"lukas-reineke/indent-blankline.nvim",

	event = "BufReadPre",
}

function M.config()
	require("indent_blankline").setup({
		show_trailing_blankline_indent = false,
		show_first_indent_level = false,
		show_current_context = true,
		show_current_context_start = true,
	})
end

return M
