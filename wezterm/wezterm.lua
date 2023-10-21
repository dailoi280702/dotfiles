local wezterm = require("wezterm")
local config = {}

config.default_cursor_style = "SteadyBar"

config.font = wezterm.font_with_fallback({
	{
		family = "liga sfmono nerd font",
		weight = "Medium",
		stretch = "Normal",
		-- harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
	},
	{ family = "juliamono", weight = "Regular", stretch = "Normal" },
	"symbols nerd font",
	"nonicons",
})
config.cell_width = 0.95
config.line_height = 1.0
config.adjust_window_size_when_changing_font_size = false
config.font_size = 18
config.dpi = 144

config.macos_window_background_blur = 70
config.window_background_opacity = 1
-- config.colors = require("./colors/oxocarbon")
-- config.color_scheme = "github-dark-dimmed"
config.color_scheme = "Gruvbox dark, medium (base16)"

local C = {
	bg = "#282828",
	fg = "#ebdbb2",
	c3 = "#fe8019",
	-- bg = "#f9f5d7",
	-- -- bg = "#EFF0DF",
	-- fg = "#654735",
	-- c0 = "#bdae93",
	-- c1 = "#c14a4a",
	-- c2 = "#6c782e",
	-- c3 = "#c35e0a",
	-- c4 = "#45707a",
	-- c5 = "#945e80",
	-- c6 = "#4c7a5d",
	-- c7 = "#654735",
	-- c8 = "#928374",
	-- c9 = "#c14a4a",
	-- c10 = "#6c782e",
	-- c11 = "#b47109",
	-- c12 = "#45707a",
	-- c13 = "#945e80",
	-- c14 = "#4c7a5d",
	-- c15 = "#654735",
}

config.colors = {
	-- foreground = C.fg,
	-- background = C.bg,
	-- cursor_fg = C.bg,
	-- cursor_bg = C.c8,
	-- cursor_border = C.c8,
	-- selection_fg = C.bg,
	-- selection_bg = C.c7,
	-- scrollbar_thumb = C.bg,
	-- split = C.c8,
	-- ansi = {
	-- 	C.c0,
	-- 	C.c1,
	-- 	C.c2,
	-- 	C.c3,
	-- 	C.c4,
	-- 	C.c5,
	-- 	C.c6,
	-- 	C.c7,
	-- },
	-- brights = {
	-- 	C.c8,
	-- 	C.c9,
	-- 	C.c10,
	-- 	C.c11,
	-- 	C.c12,
	-- 	C.c13,
	-- 	C.c14,
	-- 	C.c15,
	-- },
	tab_bar = {
		background = C.bg,
		active_tab = {
			bg_color = C.bg,
			fg_color = C.c3,
		},
		inactive_tab = {
			bg_color = C.bg,
			fg_color = C.fg,
		},
		inactive_tab_hover = {
			bg_color = C.bg,
			fg_color = C.fg,
			italic = true,
		},
		new_tab = {
			bg_color = C.bg,
			fg_color = C.fg,
		},
		new_tab_hover = {
			bg_color = C.bg,
			fg_color = C.fg,
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
config.initial_cols = 110
config.initial_rows = 34
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
