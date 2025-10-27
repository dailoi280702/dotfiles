local M = {}

table.insert(M, {
	"NLKNguyen/papercolor-theme",
	config = function()
		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "PaperColor",
			callback = function()
				vim.api.nvim_set_hl(0, "Pmenu", { bg = "#e1e1e1" })
				vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#cccccc" })
				vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#e1e1e1" })
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
					"PmenuSel",
					"NormalFloat",
					"StatusLine",
					"StatusLineNC",
				}

				for _, name in ipairs(hl_grs) do
					vim.api.nvim_set_hl(0, name, { bg = second_bg })
				end
			end,
		})
		vim.cmd.colorscheme("iceberg")
	end,
})

table.insert(M, {
	"projekt0n/github-nvim-theme",
})

for i, _ in ipairs(M) do
	M[i] = vim.tbl_extend("force", M[i], { lazy = false, priority = 1000 })
end

return M