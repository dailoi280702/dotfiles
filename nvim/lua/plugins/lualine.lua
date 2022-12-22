local M = {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy"
}

function M.config()
	require("lualine").setup({
		options = {
			globalstatus = false,
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
		},
	})
end

return M
