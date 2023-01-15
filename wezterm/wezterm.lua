local wezterm = require("wezterm")

return {
	default_cursor_style = "SteadyBar",
	font = wezterm.font("Liga SFmono Nerd Font"),
	font_size = 28.0,
	use_fancy_tab_bar = false,
	window_background_opacity = 1,
	window_close_confirmation = "NeverPrompt",
	colors = require("colors.oxocarbon"),
	window_decorations = "RESIZE",
	window_padding = {
		top = 0,
		bottom = 0,
		left = 0,
		right = 0,
	},
	initial_cols = 80,
	initial_rows = 31,
	use_resize_increments = true,
}
