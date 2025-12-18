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

vim.cmd.colorscheme("habamax")

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
	"nickkadutskyi/jb.nvim",
})

table.insert(M, {
	"edeneast/nightfox.nvim",
	config = function()
		require("nightfox").setup({})
		vim.cmd.colorscheme("dawnfox")
	end,
})

for i, _ in ipairs(M) do
	M[i] = vim.tbl_extend("force", M[i], { lazy = false, priority = 1000 })
end

return M