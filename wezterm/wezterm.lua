local wezterm = require("wezterm")

local font_name = "cartograph cf"

return {
	default_cursor_style = "SteadyBar",

	font = wezterm.font(font_name, { weight = "Regular" }),
	font_rules = {
		{
			intensity = "Bold",
			font = wezterm.font({
				family = font_name,
				weight = "Black",
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
	-- cell_width = 0.90,
	-- line_height = 0.90,
	adjust_window_size_when_changing_font_size = false,
	font_size = 23,

	enable_tab_bar = true,
	hide_tab_bar_if_only_one_tab = true,
	use_fancy_tab_bar = false,

	window_background_opacity = 1.0,
	window_close_confirmation = "NeverPrompt",
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
	tab_max_width = 30,

	inactive_pane_hsb = {
		saturation = 1,
		brightness = 1,
	},

	keys = {
		{
			key = "LeftArrow",
			mods = "CTRL|SHIFT",
			action = wezterm.action.SplitPane({
				direction = "Left",
			}),
		},
		{
			key = "RightArrow",
			mods = "CTRL|SHIFT",
			action = wezterm.action.SplitPane({
				direction = "Right",
			}),
		},
		{
			key = "DownArrow",
			mods = "CTRL|SHIFT",
			action = wezterm.action.SplitPane({
				direction = "Down",
			}),
		},
		{
			key = "UpArrow",
			mods = "CTRL|SHIFT",
			action = wezterm.action.SplitPane({
				direction = "Up",
			}),
		},
		{
			key = "h",
			mods = "CTRL|SHIFT",
			action = wezterm.action.ActivatePaneDirection("Left"),
		},
		{
			key = "l",
			mods = "CTRL|SHIFT",
			action = wezterm.action.ActivatePaneDirection("Right"),
		},
		{
			key = "j",
			mods = "CTRL|SHIFT",
			action = wezterm.action.ActivatePaneDirection("Down"),
		},
		{
			key = "k",
			mods = "CTRL|SHIFT",
			action = wezterm.action.ActivatePaneDirection("Up"),
		},
	},
}
