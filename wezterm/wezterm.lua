local wezterm = require("wezterm")
local config = {}

config.default_cursor_style = "SteadyBar"

config.font = wezterm.font_with_fallback({
	-- { family = "iosevka mayukai codepro", weight = "Medium" },
	{ family = "jetbrains mono", weight = "Medium" },
	"nonicons",
	"symbols nerd font",
})
config.cell_width = 0.90
config.line_height = 0.90

config.adjust_window_size_when_changing_font_size = false
config.font_size = 16
config.dpi = 144

config.macos_window_background_blur = 50
config.window_background_opacity = 0.9
-- config.color_scheme = "github-dark-dimmed"
config.color_scheme = "Gruvbox light, hard (base16)"

config.colors = {
	foreground = "#654735",
	background = "#f9f5d7",
	cursor_bg = "#f9f5d7",
	cursor_fg = "#928374",
	cursor_border = "#928374",
	selection_fg = "#f9f5d7",
	selection_bg = "#654735",
	scrollbar_thumb = "#f9f5d7",
	split = "#928374",
	ansi = {
		"#bdae93",
		"#c14a4a",
		"#6c782e",
		"#c35e0a",
		"#45707a",
		"#945e80",
		"#4c7a5d",
		"#654735",
	},
	brights = {
		"#928374",
		"#c14a4a",
		"#6c782e",
		"#b47109",
		"#45707a",
		"#945e80",
		"#4c7a5d",
		"#654735",
	},
	tab_bar = {
		background = "#f9f5d7",
		active_tab = {
			bg_color = "#f9f5d7",
			fg_color = "#c35e0a",
			bold = false,
			-- intensity = "Bold",
		},
		inactive_tab = {
			bg_color = "#f9f5d7",
			fg_color = "#654735",
		},
		inactive_tab_hover = {
			bg_color = "#f9f5d7",
			fg_color = "#654735",
			italic = true,
		},
		new_tab = {
			bg_color = "#f9f5d7",
			fg_color = "#654735",
		},
		new_tab_hover = {
			bg_color = "#f9f5d7",
			fg_color = "#654735",
			intensity = "Bold",
		},
	},
}

config.window_close_confirmation = "NeverPrompt"
config.use_fancy_tab_bar = false
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"
config.window_padding = {
	top = 0,
	bottom = 0,
	left = 10,
	right = 10,
}
config.initial_cols = 100
config.initial_rows = 30
config.tab_max_width = 30

config.inactive_pane_hsb = {
	saturation = 1,
	brightness = 1,
}

config.keys = {
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
}

return config
