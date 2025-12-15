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
	"catppuccin/nvim",
	config = function()
		require("catppuccin").setup({
			flavour = "auto",
			background = {
				light = "latte",
				dark = "macchiato",
			},
			float = {
				solid = true,
			},
			no_italic = true,
			default_integrations = true,
			auto_integrations = true,
		})

		vim.cmd.colorscheme("catppuccin")
	end,
})

for i, _ in ipairs(M) do
	M[i] = vim.tbl_extend("force", M[i], { lazy = false, priority = 1000 })
end

return M