local palette = {
	black = { base = "#002b36", bright = "#002b36", dim = "#002b36" },
	magenta = { base = "#dc322f", bright = "#fc322f", dim = "#bc322f" },
	cyan = { base = "#859900", bright = "#859900", dim = "#859900" }, -- #25be6a or #42BE65
	yellow = { base = "#b58900", bright = "#b58900", dim = "#b58900" },
	blue = { base = "#268bd2", bright = "#268bd2", dim = "#268bd2" },
	orange = { base = "#d33682", bright = "#d33682", dim = "#d33682" },
	green = { base = "#2aa198", bright = "#2aa198", dim = "#2aa198" },
	white = { base = "#93a1a1", bright = "#fdf6e3", dim = "#839496" },
	pink = { base = "#cb4b16", bright = "#cb4b16", dim = "#cb4b16" },
	red = { base = "#6c71c4", bright = "#6c71c4", dim = "#6c71c4" },

	comment = "",

	bg0 = "#002b36", -- Dark bg (status line and float)
	bg1 = "#001217", -- Default bg
	bg2 = "#002b36",
	bg3 = "#002b36",
	bg4 = "#2aa198",

	fg0 = "#839496",
	fg3 = "#93a1a1", -- Default fg
	fg2 = "#657b83", -- Darker fg (status line)
	fg1 = "#586e75", -- Darker fg (line numbers, fold colums)

	sel0 = "#002b36", -- Popup bg, visual selection bg
	sel1 = "#002b36", -- Popup sel bg, search bg
}

require("nightfox").setup({
	options = {
		transparent = false,
	},
	palettes = {
		nightfox = {
			bg1 = "#0f141c",
		},
		duskfox = {
			bg1 = "#12111c",
		},
		nordfox = {
			bg1 = "#1b1f26",
		},
		-- terafox = {
		-- 	bg1 = "#0b1314",
		-- },
		terafox = palette,
	},
})

vim.cmd.colorscheme("terafox")
