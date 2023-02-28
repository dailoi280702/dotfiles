local wezterm = require("wezterm")

local font_name = "liga sfmono nerd font"

return {
	default_cursor_style = "SteadyBar",
	font = wezterm.font(font_name, { weight = "Regular" }),
	-- dpi = 74.0,
	font_rules = {
		{
			intensity = "Bold",
			font = wezterm.font({
				family = font_name,
				weight = "Bold",
			}),
		},
		{
			intensity = "Half",
			font = wezterm.font({
				family = font_name,
				weight = "DemiBold",
			}),
		},
	},
	enable_tab_bar = true,
	hide_tab_bar_if_only_one_tab = true,
	cell_width = 0.90,
	line_height = 0.95,
	font_size = 25,
	use_fancy_tab_bar = false,
	window_background_opacity = 1.0,
	window_close_confirmation = "NeverPrompt",
	-- colors = require("colors.oxocarbon"),
	color_scheme = "Oxocarbon Dark",
	window_decorations = "RESIZE",
	window_padding = {
		top = 0,
		bottom = 0,
		left = 10,
		right = 10,
	},
	initial_cols = 100,
	initial_rows = 30,
	-- use_resize_increments = true,
	tab_max_width = 30,
}
