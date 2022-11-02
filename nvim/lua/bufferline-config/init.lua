local ok, bufferline = pcall(require, "bufferline")

if not ok then
	return
end

bufferline.setup({
	options = {
		show_close_icon = false,
		show_buffer_close_icons = false,
		separator_style = "slant",
		-- diagnostics = "nvim_lsp",
		always_show_bufferline = false,
	},
	highlights = require("bufferline-config.kanagawa"),
})
