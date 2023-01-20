local wezterm = require("wezterm")

wezterm.on("update-right-status", function(window, pane)
	local date = wezterm.strftime("%a %b %-d ")
	local time = wezterm.strftime(" %H:%M")

	local CLOCK_ICONS = {
		"󱑖 ",
		"󱑌 ",
		"󱑋 ",
		"󱑍 ",
		"󱑎 ",
		"󱑏 ",
		"󱑐 ",
		"󱑑 ",
		"󱑒 ",
		"󱑓 ",
		"󱑔 ",
		"󱑕 ",
	}

	local function capture(cmd, raw)
		local handle = assert(io.popen(cmd, "r"))
		local output = assert(handle:read("*a"))
		handle:close()

		if raw then
			return output
		end

		output = string.gsub(string.gsub(string.gsub(output, "^%s+", ""), "%s+$", ""), "[\n\r]+", " ")
		return output
	end

	local pomo = capture("/Users/loi/golang/bin/pomo", true)
	if string.len(pomo) > 0 then
		pomo = " pomo: " .. pomo
	end

	window:set_right_status(wezterm.format({
		{ Foreground = { Color = "#6f6f6f" } },
		{ Text = date },
		{ Foreground = { Color = "#dde1e6" } },
		{ Text = CLOCK_ICONS[(math.floor(os.date("*t").min / 60 * 12) + 1)] },
		{ Text = time },
		{ Text = pomo },
	}))
end)

local font_name = "Jetbrainsmono Nerd Font"

return {
	default_cursor_style = "SteadyBar",
	font = wezterm.font(font_name),
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
	-- cell_width = 0.9,
	line_height = (5 / 6),
	font_size = 27,
	use_fancy_tab_bar = false,
	window_background_opacity = 1,
	window_close_confirmation = "NeverPrompt",
	colors = require("colors.oxocarbon"),
	window_decorations = "RESIZE",
	window_padding = {
		top = 0,
		bottom = 10,
		left = 10,
		right = 10,
	},
	initial_cols = 90,
	initial_rows = 31,
	use_resize_increments = true,
	tab_max_width = 30,
}
