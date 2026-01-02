local M = {}

vim.api.nvim_create_autocmd("ColorSchemePre", {
	pattern = "*",
	callback = function()
		vim.cmd("hi clear")
	end,
})

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

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "default",
	callback = function()
		if vim.o.background == "light" then
			vim.cmd("hi Normal guibg=none")
			vim.cmd("hi NormalNC guibg=none")
			vim.cmd("hi! link TreesitterContext Normal")
			vim.cmd("hi! link Foled Comment")
		end
	end,
})

table.insert(M, {
	"maxmx03/solarized.nvim",
	config = function()
		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "solarized",
			callback = function()
				vim.cmd("hi! link Identifier Text")
			end,
		})

		vim.opt.bg = "light"
		vim.cmd.colorscheme("solarized")
	end,
})

table.insert(M, {
	"ellisonleao/gruvbox.nvim",
	config = function()
		require("gruvbox").setup({
			contrast = "hard",
		})
	end,
})

table.insert(M, {
	"nickkadutskyi/jb.nvim",
})

table.insert(M, {
	"edeneast/nightfox.nvim",
})

for i, _ in ipairs(M) do
	M[i] = vim.tbl_extend("force", M[i], { lazy = false, priority = 1000 })
end

return M