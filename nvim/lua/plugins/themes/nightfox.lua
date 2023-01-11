local M = {
	"EdenEast/nightfox.nvim",
	lazy = false,
}

function M.config()
	require("nightfox").setup({
		-- options = {
		-- 	transparent = true,
		-- },
		palettes = {
			nordfox = {
				bg1 = "#1b1f26",
				sel0 = "#242c36",
			},
		},
		groups = {
			nordfox = {
				CursorLine = { bg = "#232831" },
			},
		},
	})
	vim.cmd.colorscheme("dawnfox")
end

return M
