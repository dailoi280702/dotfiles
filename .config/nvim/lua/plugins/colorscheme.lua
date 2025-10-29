local M = {}

table.insert(M, {
	"sainnhe/everforest",
	config = function()
		vim.g.everforest_background = "soft"
		vim.g.everforest_better_performance = 1
		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "everforest",
			callback = function()
				local bg = "#2A2C33"
				vim.api.nvim_set_hl(0, "Normal", { bg = bg })
				vim.api.nvim_set_hl(0, "NormalNC", { bg = bg })
				vim.api.nvim_set_hl(0, "NormalFloat", { bg = bg })
			end,
		})
	end,
})

table.insert(M, {
	"zenbones-theme/zenbones.nvim",
	dependencies = "rktjmp/lush.nvim",
})

table.insert(M, {
	"cocopon/iceberg.vim",
	config = function()
		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "iceberg",
			callback = function()
				local second_bg = "#1F2132"

				local hl_grs = {
					"Pmenu",
					"NormalFloat",
					"StatusLine",
					"StatusLineNC",
				}

				for _, name in ipairs(hl_grs) do
					vim.api.nvim_set_hl(0, name, { bg = second_bg })
				end

				vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#6B7089", fg = "#1F2132" })
			end,
		})
	end,
})

table.insert(M, {
	"kepano/flexoki-neovim",
	config = function()
		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "flexoki",
			callback = function()
				local palette = require("flexoki.palette").palette()

				vim.api.nvim_set_hl(0, "Identifier", { fg = palette["tx"] })
			end,
		})

		vim.cmd.colorscheme("flexoki")
	end,
})

for i, _ in ipairs(M) do
	M[i] = vim.tbl_extend("force", M[i], { lazy = false, priority = 1000 })
end

return M