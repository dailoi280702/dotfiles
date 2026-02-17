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
	"phha/zenburn.nvim",
	config = function()
		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "zenburn",
			callback = function()
				vim.api.nvim_set_hl(0, "SignColumn", { link = "LineNr", force = true })
				vim.api.nvim_set_hl(0, "@variable", { link = "Text", force = true })
			end,
		})

		-- vim.cmd.colorscheme("zenburn")
	end,
})

table.insert(M, {
	"kepano/flexoki-neovim",
	config = function()
		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "flexoki",
			callback = function()
				vim.api.nvim_set_hl(0, "Identifier", { link = "Text", force = true })
			end,
		})

		vim.cmd.colorscheme("flexoki")
	end,
})

for i, _ in ipairs(M) do
	M[i] = vim.tbl_extend("force", M[i], { lazy = false, priority = 1000 })
end

return M