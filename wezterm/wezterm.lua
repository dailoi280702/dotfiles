local wezterm = require("wezterm")
local config = {}

config.default_cursor_style = "SteadyBar"

config.font = wezterm.font_with_fallback({
	-- {
	-- 	family = "input mono",
	-- 	weight = "Regular",
	--  stretch = "Expanded"
	-- },
	{
		family = "inconsolata",
		-- harfbuzz_features = { "calt=1", "clig=1", "liga=1" },
		-- weight = "Light",
	},
	{
		family = "symbols nerd font",
		scale = 1,
	},
	"nonicons",
})

config.font_rules = {
	-- { intensity = "Bold", font = config.font },
	-- { intensity = "Half", font = config.font },
}

config.cell_width = 1
config.line_height = 1
config.adjust_window_size_when_changing_font_size = false
config.font_size = 19
-- config.dpi = 144

config.front_end = "WebGpu"

config.colors = {
	background = "#181818",
}

-- config.background = {
-- 	{
-- 		source = { File = "/Users/lloyd/.config/kitty/background/paper.png" },
-- 		hsb = { brightness = 0.98, hue = 0.32, saturation = 0.05 },
-- 	},
-- }

config.color_scheme = "Gruvbox dark, medium (base16)"
-- config.colors = require("colors.rose-pine-dawn").colors()

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
