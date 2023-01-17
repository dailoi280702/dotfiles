local wezterm = require("wezterm")

return {
	default_cursor_style = "SteadyBar",
	font = wezterm.font("liga sfmono nerd font"),
	cell_width = 0.9,
	line_height = 0.9,
	font_size = 24,
	use_fancy_tab_bar = false,
	window_background_opacity = 1,
	window_close_confirmation = "NeverPrompt",
	colors = require("colors.oxocarbon"),
	window_decorations = "RESIZE",
	window_padding = {
		top = 0,
		bottom = 10,
		left = 10,
		right = 10,
	},
	initial_cols = 100,
	initial_rows = 41,
	use_resize_increments = true,
	tab_max_width = 30,
}
