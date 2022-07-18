local ok, bufferline = pcall(require, "bufferline")

if not ok then
	return
end

bufferline.setup({
	options = {
		numbers = "ordinal",
	},
	highlights = {
		pick = {
			guifg = "#000000",
			guibg = "#87DFEB",
		},
		pick_selected = {
			guifg = "#000000",
			guibg = "#FFE6B3",
		},
		pick_visible = {
			guifg = "#000000",
			guibg = "#87DFEB",
		},
	},
})
