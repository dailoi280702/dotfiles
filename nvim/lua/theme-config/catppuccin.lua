local ok, catppuccin = pcall(require, "catppuccin")
if not ok then
	return
end

catppuccin.setup({
	flavour = "mocha",
	compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
	transparent_background = true,
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

vim.api.nvim_command("colorscheme catppuccin")
