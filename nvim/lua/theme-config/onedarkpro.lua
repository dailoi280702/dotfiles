local ok, onedarkpro = pcall(require, "onedarkpro")
if not ok then
	return
end

onedarkpro.setup({
	theme = "onedark_dark",
	colors = {
		bg = "#181818",
		black = "#181818",
	},
	plugins = {
		all = false,
		gitsigns_nvim = true,
		lsp_saga = true,
		native_lsp = true,
		nvim_cmp = true,
		nvim_ts_rainbow = true,
		treesitter = true,
		which_key_nvim = true,
	},
})

vim.cmd([[
	hi PmenuSel blend=0
	colorscheme onedarkpro
]])
