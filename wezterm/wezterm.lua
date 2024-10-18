local wezterm = require("wezterm")
local config = {}

config.default_cursor_style = "SteadyBar"

config.font = wezterm.font_with_fallback({
	{
		family = "jetbrains mono",
		-- harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
		weight = "Medium",
		-- stretch = "Expanded",
	},
	-- { family = "meslolgl nerd font",
	-- 	-- harfbuzz_features = { "calt=1", "clig=1", "liga=1" },
	-- },
	{
		family = "symbols nerd font",
		scale = 1,
	},
	"nonicons",
})

-- config.use_resize_increments = true
-- config.freetype_load_flags = "NO_HINTING"

-- config.font_rules = {
-- 	-- { italic = true, font = config.font },
-- 	-- { intensity = "Bold", font = config.font },
-- 	-- 	-- { intensity = "Half", font = config.font },
-- 	-- 	{
-- 	-- 		intensity = "Normal",
-- 	-- 		italic = true,
-- 	-- 		font = wezterm.font_with_fallback({ { family = "blexmono nerd font", italic = true, weight = "Regular" } }),
-- 	-- 	},
-- 	-- 	{
-- 	-- 		intensity = "Bold",
-- 	-- 		italic = true,
-- 	-- 		font = wezterm.font_with_fallback({ { family = "blexmono nerd font", italic = true, weight = "Bold" } }),
-- 	-- 	},
-- }

config.cell_width = 0.9
config.line_height = 1.1
config.adjust_window_size_when_changing_font_size = false
config.font_size = 14
-- config.dpi = 144

config.front_end = "WebGpu"

-- config.color_scheme = "Oxocarbon Dark"
-- config.color_scheme = "Gruvbox dark, medium (base16)"
-- config.color_scheme = "Quiet (Gogh)"
-- config.color_scheme = "Solarized Dark (Gogh)"
-- config.color_scheme = "Solarized Dark - Patched"
-- config.color_scheme = "Tomorrow (dark) (terminal.sexy)"
config.color_scheme = "Catppuccin Frappe"

-- local theme = wezterm.plugin.require("https://github.com/neapsix/wezterm").dawn
-- config.colors = theme.colors()
-- config.window_frame = theme.window_frame()

-- local oxocarbon = require("colors/oxocarbon")
-- config.colors = {
-- 	-- background = oxocarbon.background,
-- 	background = "#1D1D1D",
-- 	tab_bar = oxocarbon.tab_bar,
-- }

-- local gruvbox_bg = "#1c1c1c"
-- -- local gruvbox_bg = "#002B36"
-- -- local gruvbox_bg = "#001E27"
-- local gruvbox_fg = "#928374"
-- local gruvbox_orange = "#FE801A"
-- local gruvbox_cyan = "#83A598"
--
-- config.colors = {
-- 	background = gruvbox_bg,
-- 	tab_bar = {
-- 		background = gruvbox_bg,
-- 		active_tab = {
-- 			bg_color = gruvbox_bg,
-- 			fg_color = gruvbox_orange,
-- 			-- bold = true,
-- 		},
-- 		inactive_tab = {
-- 			bg_color = gruvbox_bg,
-- 			fg_color = gruvbox_fg,
-- 		},
-- 		inactive_tab_hover = {
-- 			bg_color = gruvbox_bg,
-- 			fg_color = gruvbox_fg,
-- 			italic = true,
-- 		},
-- 		new_tab = {
-- 			bg_color = gruvbox_bg,
-- 			fg_color = gruvbox_cyan,
-- 		},
-- 		new_tab_hover = {
-- 			bg_color = gruvbox_bg,
-- 			fg_color = gruvbox_cyan,
-- 			-- bold = true,
-- 		},
-- 	},
-- }

-- config.window_close_confirmation = "NeverPrompt"

config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = false
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"
config.window_padding = {
	top = 0,
	bottom = 0,
	left = 3,
	right = 3,
}
config.initial_cols = 140
config.initial_rows = 30
-- config.tab_max_width = 30

-- config.inactive_pane_hsb = {
-- 	saturation = 1,
-- 	brightness = 1,
-- }

-- config.text_background_opacity = 0.0
-- config.window_background_opacity = 0.96
-- config.macos_window_background_blur = 90

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
