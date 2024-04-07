local wezterm = require("wezterm")
local config = {}

config.default_cursor_style = "SteadyBar"

config.font = wezterm.font_with_fallback({
	{
		family = "iosevka comfy",
		weight = "Regular",
		stretch = "Expanded",
		-- harfbuzz_features = {
		-- 	"calt=1",
		-- 	"clig=1",
		-- 	"liga=1",
		-- 	"ss01=0",
		-- 	"ss02=1",
		-- 	"ss03=1",
		-- 	"ss04=1",
		-- 	"ss05=1",
		-- 	"ss06=1",
		-- 	"ss07=1",
		-- 	"ss08=1",
		-- 	"ss09=1",
		-- },
	},
	{ family = "liga sfmono nerd font" },
	{ family = "juliamono", weight = "Regular", stretch = "Normal" },
	"symbols nerd font",
	"nonicons",
})
-- config.cell_width = 0.95
-- config.line_height = 1.2
config.adjust_window_size_when_changing_font_size = false
config.font_size = 14
config.dpi = 144

config.front_end = "WebGpu"

-- config.colors = require("colors.rose-pine").colors()
-- config.color_scheme = "Modus-Vivendi"
config.color_scheme = "GruvboxDarkHard"
config.colors = {
	background = "#181616",
}

-- config.macos_window_background_blur = 50
-- config.window_background_opacity = 0.9
-- config.colors = require("./colors/oxocarbon")
-- config.color_scheme = "github-dark-dimmed"
-- config.color_scheme = "Dracula (Official)"

-- local C = {
-- 	-- bg = "#161616",
-- 	bg = "#1f1f1f",
-- 	fg = "#ECE1D7",
-- 	c0 = "#34302C",
-- 	c1 = "#BD8183",
-- 	c2 = "#78997A",
-- 	c3 = "#E49B5D",
-- 	c4 = "#7F91B2",
-- 	c5 = "#B380B0",
-- 	c6 = "#7B9695",
-- 	c7 = "#C1A78E",
-- 	c8 = "#867462",
-- 	c9 = "#D47766",
-- 	c10 = "#85B695",
-- 	c11 = "#EBC06D",
-- 	c12 = "#A3A9CE",
-- 	c13 = "#CF9BC2",
-- 	c14 = "#89B3B6",
-- 	c15 = "#ECE1D7",
-- }
--
-- config.colors = {
-- 	foreground = C.fg,
-- 	background = C.bg,
-- 	cursor_fg = C.bg,
-- 	cursor_bg = C.c8,
-- 	cursor_border = C.c8,
-- 	selection_fg = C.bg,
-- 	selection_bg = C.c7,
-- 	scrollbar_thumb = C.bg,
-- 	split = C.c8,
-- 	ansi = {
-- 		C.c0,
-- 		C.c1,
-- 		C.c2,
-- 		C.c3,
-- 		C.c4,
-- 		C.c5,
-- 		C.c6,
-- 		C.c7,
-- 	},
-- 	brights = {
-- 		C.c8,
-- 		C.c9,
-- 		C.c10,
-- 		C.c11,
-- 		C.c12,
-- 		C.c13,
-- 		C.c14,
-- 		C.c15,
-- 	},
-- 	tab_bar = {
-- 		background = C.bg,
-- 		active_tab = {
-- 			bg_color = C.bg,
-- 			fg_color = C.c3,
-- 		},
-- 		inactive_tab = {
-- 			bg_color = C.bg,
-- 			fg_color = C.fg,
-- 		},
-- 		inactive_tab_hover = {
-- 			bg_color = C.bg,
-- 			fg_color = C.fg,
-- 			italic = true,
-- 		},
-- 		new_tab = {
-- 			bg_color = C.bg,
-- 			fg_color = C.fg,
-- 		},
-- 		new_tab_hover = {
-- 			bg_color = C.bg,
-- 			fg_color = C.fg,
-- 			intensity = "Bold",
-- 		},
-- 	},
-- }

config.window_close_confirmation = "NeverPrompt"
config.use_fancy_tab_bar = false
config.enable_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"
-- config.window_padding = {
-- 	top = 0,
-- 	bottom = 0,
-- 	left = 0,
-- 	right = 0,
-- }
config.initial_cols = 60
config.initial_rows = 20
-- config.tab_max_width = 30

config.inactive_pane_hsb = {
	saturation = 1,
	brightness = 1,
}
--
-- config.keys = {
-- 	{
-- 		key = "LeftArrow",
-- 		mods = "CTRL|SHIFT",
-- 		action = wezterm.action.SplitPane({
-- 			direction = "Left",
-- 		}),
-- 	},
-- 	{
-- 		key = "RightArrow",
-- 		mods = "CTRL|SHIFT",
-- 		action = wezterm.action.SplitPane({
-- 			direction = "Right",
-- 		}),
-- 	},
-- 	{
-- 		key = "DownArrow",
-- 		mods = "CTRL|SHIFT",
-- 		action = wezterm.action.SplitPane({
-- 			direction = "Down",
-- 		}),
-- 	},
-- 	{
-- 		key = "UpArrow",
-- 		mods = "CTRL|SHIFT",
-- 		action = wezterm.action.SplitPane({
-- 			direction = "Up",
-- 		}),
-- 	},
-- 	{
-- 		key = "h",
-- 		mods = "CTRL|SHIFT",
-- 		action = wezterm.action.ActivatePaneDirection("Left"),
-- 	},
-- 	{
-- 		key = "l",
-- 		mods = "CTRL|SHIFT",
-- 		action = wezterm.action.ActivatePaneDirection("Right"),
-- 	},
-- 	{
-- 		key = "j",
-- 		mods = "CTRL|SHIFT",
-- 		action = wezterm.action.ActivatePaneDirection("Down"),
-- 	},
-- 	{
-- 		key = "k",
-- 		mods = "CTRL|SHIFT",
-- 		action = wezterm.action.ActivatePaneDirection("Up"),
-- 	},
-- }

return config
