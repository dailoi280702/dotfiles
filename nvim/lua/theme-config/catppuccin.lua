local ok, catppuccin = pcall(require, "catppuccin")
if not ok then
	return
end

catppuccin.setup({
	-- flavour = "macchiato",
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
	-- color_overrides = {
	-- 	all = {
	-- 		base = "#181a24",
	-- 	},
	-- },
})

vim.api.nvim_command("colorscheme catppuccin")
