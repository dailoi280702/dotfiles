local M = {}

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "retrobox,habamax",
	callback = function()
		vim.cmd("hi Normal guibg=none")
		vim.cmd("hi clear Identifier")
		vim.cmd("hi! link TreesitterContext Normal")
		vim.cmd("hi! link StatusLine Comment")
		vim.cmd("hi! link StatusLineNC Comment")
		vim.cmd("hi! link Foled Comment")
	end,
})

vim.cmd.colorscheme("habamax")

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "default",
	callback = function()
		if vim.o.background == "light" then
			vim.cmd("hi Normal guibg=none")
			vim.cmd("hi NormalNC guibg=none")
			vim.cmd("hi! link TreesitterContext Normal")
			-- vim.cmd("hi! link StatusLine Comment")
			-- vim.cmd("hi! link StatusLineNC Comment")
			vim.cmd("hi! link Foled Comment")
		end
	end,
})

table.insert(M, {
	"sainnhe/everforest",
	config = function()
		vim.g.everforest_background = "hard"
		vim.cmd.colorscheme("everforest")
	end,
})

table.insert(M, {
	"navarasu/onedark.nvim",
	dependencies = "rktjmp/lush.nvim",
	config = function()
		require("onedark").setup({
			transparent = true,
		})
	end,
})

table.insert(M, {
	"ellisonleao/gruvbox.nvim",
	config = function()
		require("gruvbox").setup({
			bold = true,
			italic = {
				strings = false,
				emphasis = false,
				comments = false,
				operators = false,
				folds = true,
			},
			transparent_mode = false,
		})
	end,
})

for i, _ in ipairs(M) do
	M[i] = vim.tbl_extend("force", M[i], { lazy = false, priority = 1000 })
end

return M