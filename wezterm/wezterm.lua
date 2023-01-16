local wezterm = require("wezterm")

return {
	default_cursor_style = "SteadyBar",
	font = wezterm.font("victor mono", { weight = "Medium" }),
	font_size = 26,
	line_height = 0.8,
	use_fancy_tab_bar = false,
	window_background_opacity = 1,
	window_close_confirmation = "NeverPrompt",
	colors = require("colors.oxocarbon"),
	window_decorations = "RESIZE",
	window_padding = {
		top = 0,
		bottom = 20,
		left = 10,
		right = 10,
	},
	initial_cols = 95,
	initial_rows = 31,
	use_resize_increments = true,
	tab_max_width = 30,
}
