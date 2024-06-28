local wezterm = require("wezterm")
local config = {}

config.default_cursor_style = "SteadyBar"

config.font = wezterm.font_with_fallback({
	{
		family = "lilex",
		weight = "Regular",
		-- stretch = "Expanded",
	},
	-- {
	-- 	family = "meslolgl nerd font",
	-- 	-- harfbuzz_features = { "calt=1", "clig=1", "liga=1" },
	-- },
	{
		family = "symbols nerd font",
		scale = 1,
	},
	"nonicons",
})

config.use_resize_increments = true
-- config.freetype_load_flags = "NO_HINTING"

config.font_rules = {
	{ italic = true, font = config.font },
	-- 	-- { intensity = "Bold", font = config.font },
	-- 	-- { intensity = "Half", font = config.font },
	-- 	{
	-- 		intensity = "Normal",
	-- 		italic = true,
	-- 		font = wezterm.font_with_fallback({ { family = "blexmono nerd font", italic = true, weight = "Regular" } }),
	-- 	},
	-- 	{
	-- 		intensity = "Bold",
	-- 		italic = true,
	-- 		font = wezterm.font_with_fallback({ { family = "blexmono nerd font", italic = true, weight = "Bold" } }),
	-- 	},
}

config.cell_width = 1
config.line_height = 1
config.adjust_window_size_when_changing_font_size = false
config.font_size = 16
-- config.dpi = 144

-- config.front_end = "OpengGL"

-- config.color_scheme = "zenwritten_light"
config.color_scheme = "Vs Code Dark+ (Gogh)"

-- config.colors = {
-- 	-- background = "#1A1816",
-- 	-- background = "#141311",
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
config.initial_cols = 200
config.initial_rows = 100
-- config.tab_max_width = 30

-- config.inactive_pane_hsb = {
-- 	saturation = 1,
-- 	brightness = 1,
-- }

-- config.window_background_opacity = 0.9
-- config.macos_window_background_blur = 10

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
