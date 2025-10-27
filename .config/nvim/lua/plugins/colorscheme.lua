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
	"nvim-mini/mini.hues",
	opts = {
		foreground = "#dddddd",
		background = "#222222",
		saturation = "high",
		n_hues = 8,
	},
	config = function(_, opts)
		-- require("mini.hues").setup(opts)
	end,
})

table.insert(M, {
	"ellisonleao/gruvbox.nvim",
	opts = {
		transparent_mode = true,
	},
	config = function(_, opts)
		require("gruvbox").setup(opts)
	end,
})

table.insert(M, {
	"projekt0n/github-nvim-theme",
	config = function()
		vim.cmd.colorscheme("github_dark_dimmed")
	end,
})

for i, _ in ipairs(M) do
	M[i] = vim.tbl_extend("force", M[i], { lazy = false, priority = 1000 })
end

return M