local ok, catppuccin = pcall(require, "catppuccin")
if not ok then
	return
end

vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
catppuccin.setup({
	compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
	-- transparent_background = true,
	integrations = {
		lsp_saga = true,
		which_key = true,
		hop = true,
		ts_rainbow = true,
		indent_blankline = {
			colored_indent_levels = true,
		},
	},
})

vim.cmd.colorscheme("catppuccin")
