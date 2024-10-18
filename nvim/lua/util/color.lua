local M = {}

M.rgb_to_hsl = function(r, g, b)
	r = r / 255
	g = g / 255
	b = b / 255

	local max = math.max(r, g, b)
	local min = math.min(r, g, b)
	local diff = max - min

	local h, s, l = 0, 0, 0

	if diff == 0 then
		h = 0
	elseif max == r then
		h = 60 * ((g - b) / diff)
	elseif max == g then
		h = 60 * ((b - r) / diff) + 120
	elseif max == b then
		h = 60 * ((r - g) / diff) + 240
	end

	if h < 0 then
		h = h + 360
	end

	if h > 360 then
		h = h - 360
	end

	if diff == 0 then
		s = 0
	else
		s = diff / max
	end

	l = (max + min) / 2

	return h, s, l
end

M.hsl_to_rgb = function(h, s, l)
	local r, g, b = 0.0, 0.0, 0.0

	if s == 0 then
		r = l
		g = l
		b = l
	else
		local c = (1 - math.abs(2 * l - 1)) * s
		local x = c * (1 - math.abs(h / 60 % 2 - 1))
		local m = l - c / 2

		if h < 60 then
			r = c + m
			g = x + m
			b = m
		elseif h < 120 then
			r = x + m
			g = c + m
			b = m
		elseif h < 180 then
			r = m
			g = c + m
			b = x + m
		elseif h < 240 then
			r = m
			g = x + m
			b = c + m
		elseif h < 300 then
			r = x + m
			g = m
			b = c + m
		else
			r = c + m
			g = m
			b = x + m
		end
	end

	r = math.floor(r * 255)
	g = math.floor(g * 255)
	b = math.floor(b * 255)

	return r, g, b
end

M.rgb_to_hex = function(r, g, b)
	return string.format("#%02x%02x%02x", r, g, b)
end

M.hex_to_rgb = function(hex)
	local r, g, b = 0, 0, 0

	if #hex == 7 then
		r = tonumber(string.sub(hex, 2, 3), 16)
		g = tonumber(string.sub(hex, 4, 5), 16)
		b = tonumber(string.sub(hex, 6, 7), 16)
	end

	return r, g, b
end

local function isHexColor(c)
	if not c then
		return false
	end

	if not string.sub(c, 1, 1) == "#" then
		return false
	end

	if #c ~= 7 and #c ~= 4 then
		return false
	end

	for i = 2, #c do
		local char = string.sub(c, i, i)
		if not (string.match(char, "%x") ~= nil) then
			return false
		end
	end

	return true
end

M.modify_lightness = function(hex_color, lightness_delta)
	if not hex_color or not lightness_delta then
		return hex_color
	end

	-- Validate hex color
	if not isHexColor(hex_color) then
		return hex_color
	end

	hex_color = hex_color:lower()

	-- Validate lightness delta
	if lightness_delta < -1 or lightness_delta > 1 then
		error("Lightness delta must be between -1 and 1")
	end

	local r, g, b = M.hex_to_rgb(hex_color)
	local h, s, l = M.rgb_to_hsl(r, g, b)

	-- Ensure lightness remains within the valid range
	if lightness_delta < 0 then
		l = math.max(0, math.min(1, l + lightness_delta))
	else
		l = math.min(1, math.max(0, l + lightness_delta))
	end

	r, g, b = M.hsl_to_rgb(h, s, l)
	return M.rgb_to_hex(r, g, b)
end

return M