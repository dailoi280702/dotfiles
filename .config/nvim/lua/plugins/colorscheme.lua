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
		vim.cmd.colorscheme("PaperColor")
	end,
})

table.insert(M, {
	"zenbones-theme/zenbones.nvim",
	dependencies = "rktjmp/lush.nvim",
})

table.insert(M, {
	"Mofiqul/adwaita.nvim",
	config = function()
		vim.g.adwaita_transparent = true
	end,
})

for i, _ in ipairs(M) do
	M[i] = vim.tbl_extend("force", M[i], { lazy = false, priority = 1000 })
end

return M