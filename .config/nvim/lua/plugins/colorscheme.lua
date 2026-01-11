local M = {}

vim.api.nvim_create_autocmd("ColorSchemePre", {
	pattern = "*",
	callback = function()
		vim.cmd("hi clear")
	end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "retrobox,habamax,wildcharm",
	callback = function()
		vim.cmd("hi Normal guibg=none")
		vim.cmd("hi clear Identifier")
		vim.cmd("hi! link TreesitterContext Normal")
		vim.cmd("hi! link StatusLine Comment")
		vim.cmd("hi! link StatusLineNC Comment")
		vim.cmd("hi! link Foled Comment")
	end,
})

vim.cmd.colorscheme("wildcharm")

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "default",
	callback = function()
		if vim.o.background == "light" then
			vim.cmd("hi Normal guibg=none")
			vim.cmd("hi NormalNC guibg=none")
			vim.cmd("hi! link TreesitterContext Normal")
			vim.cmd("hi! link Foled Comment")

			-- vim.api.nvim_set_hl(0, "LineNr", { link = "CursorLine" })
			-- vim.api.nvim_set_hl(0, "CursorLineNr", { link = "LineNr" })
			-- vim.api.nvim_set_hl(0, "SignColumn", { link = "LineNr" })
			-- vim.api.nvim_set_hl(0, "TreesitterContext", { link = "LineNr" })
		end
	end,
})

table.insert(M, {
	"sainnhe/everforest",
	config = function()
		vim.g.everforest_background = "hard"
		vim.g.everforest_transparent_background = 1
		vim.g.everforest_better_performance = 1
	end,
})

table.insert(M, {
	"sainnhe/gruvbox-material",
	config = function()
		vim.g.gruvbox_material_better_performance = 1
		-- vim.cmd.colorscheme("gruvbox-material")
	end,
})

table.insert(M, {
	"kepano/flexoki-neovim",
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