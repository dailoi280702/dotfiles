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
	highlights = {
		separator = {
			fg = "#0C0C0C",
			bg = "#191919",
		},
		separator_selected = {
			fg = "#0C0C0C",
		},
		separator_visible = {
			fg = "#0C0C0C",
		},
		background = {
			-- fg = "#657b83",
			bg = "#191919",
		},
		duplicate = {
			-- fg = "#657b83",
			bg = "#191919",
		},
		buffer_selected = {
			fg = "#EFF7FB",
			bold = true,
		},
		fill = {
			bg = "#0C0C0C",
		},
	},
})
