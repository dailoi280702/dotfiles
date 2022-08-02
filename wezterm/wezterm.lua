local wezterm = require("wezterm")
return {
	font = wezterm.font({
		family = "fira code nerd font",
		-- weight = "medium",
	}),
	enable_wayland = true,
	font_size = 16.0,
	font_hinting = "Full",
	font_hinting = "None",
	font_antialias = "Greyscale",
}
