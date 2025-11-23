local M = {}

table.insert(M, { "nyoom-engineering/oxocarbon.nvim" })

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "retrobox,habamax",
	callback = function()
		vim.cmd("hi clear Identifier")
		vim.cmd("hi! link TreesitterContext Normal")
		vim.cmd("hi! link StatusLine Comment")
		vim.cmd("hi! link StatusLineNC Comment")
		vim.cmd("hi! link Foled Comment")
	end,
})

vim.cmd.colorscheme("habamax")

for i, _ in ipairs(M) do
	M[i] = vim.tbl_extend("force", M[i], { lazy = false, priority = 1000 })
end

return M