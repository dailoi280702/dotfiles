local wezterm = require("wezterm")

-- wezterm.on("update-right-status", function(window)
-- 	local date = wezterm.strftime("%a %b %-d ")
-- 	local time = wezterm.strftime("%H:%M")
--
-- 	local CLOCK_ICONS = {
-- 		"󱑖 ",
-- 		"󱑌 ",
-- 		"󱑋 ",
-- 		"󱑍 ",
-- 		"󱑎 ",
-- 		"󱑏 ",
-- 		"󱑐 ",
-- 		"󱑑 ",
-- 		"󱑒 ",
-- 		"󱑓 ",
-- 		"󱑔 ",
-- 		"󱑕 ",
-- 	}
--
-- 	local function capture(cmd)
-- 		local handle = assert(io.popen(cmd, "r"))
-- 		local output = assert(handle:read("*a"))
-- 		handle:close()
-- 		return output
-- 	end
--
-- 	local pomo = capture("/Users/loi/golang/bin/pomo")
-- 	if string.len(pomo) > 0 then
-- 		pomo = " " .. pomo
-- 	end
--
-- 	window:set_right_status(wezterm.format({
-- 		{ Foreground = { Color = "#6f6f6f" } },
-- 		{ Text = date },
-- 		{ Foreground = { Color = "#dde1e6" } },
-- 		{ Text = CLOCK_ICONS[(math.floor(os.date("*t").min / 60 * 12) + 1)] },
-- 		{ Text = time },
-- 		{ Foreground = { Color = "#be95ff" } },
-- 		{ Text = pomo },
-- 	}))
-- end)
--
-- wezterm.on("format-tab-title", function(tab)
-- 	return " " .. tab.tab_index + 1 .. " "
-- end)

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
	enable_tab_bar = false,
	cell_width = 0.95,
	line_height = 0.95,
	font_size = 25,
	use_fancy_tab_bar = false,
	window_background_opacity = 1.0,
	window_close_confirmation = "NeverPrompt",
	colors = require("colors.oxocarbon"),
	window_decorations = "RESIZE",
	window_padding = {
		top = 20,
		bottom = 0,
		left = 10,
		right = 10,
	},
	initial_cols = 100,
	initial_rows = 30,
	-- use_resize_increments = true,
	tab_max_width = 30,
}
