local M = {
	"nyoom-engineering/oxocarbon.nvim",
}

vim.api.nvim_create_autocmd({ "ColorScheme" }, {
	callback = function()
		local setup_colorscheme = {
			oxocarbon = function()
				-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
				vim.api.nvim_set_hl(0, "HopNextKey", { fg = "#be95ff", bold = true })
				vim.api.nvim_set_hl(0, "HopNextKey1", { fg = "#ff7eb6" })
				vim.api.nvim_set_hl(0, "HopNextKey2", { fg = "#ee5396", bold = true })
				-- vim.api.nvim_set_hl(0, "Folded", { bg = "none" })
				vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = "#6f6f6f" })
				-- vim.cmd.highlight({ "def link @function @function.builtin", bang = true })
			end,
			retrobox = function()
				vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
				vim.api.nvim_set_hl(0, "Folded", { bg = "none" })
				vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
				vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#b8bb26" })
				vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#8ec07c" })
				vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#fb4934" })
				vim.api.nvim_set_hl(0, "HopNextKey", { fg = "#d3869b", bold = true })
				vim.api.nvim_set_hl(0, "HopNextKey1", { fg = "#83a598", bold = true })
				vim.api.nvim_set_hl(0, "HopNextKey2", { fg = "#8ec07c" })
				vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = "#fe8019", bg = "#303030" })
				vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = "#83a598" })
			end,
			default = function()
				if vim.o.background == "dark" then
					vim.api.nvim_set_hl(0, "Normal", { bg = "#151619", fg = "#E0E2EA" })
				end
			end,
			wildcharm = function()
				vim.api.nvim_set_hl(0, "Normal", { bg = "none", fg = "#b2b2b2" })
			end,
			-- lunaperche = function()
			-- 	vim.api.nvim_set_hl(0, "Normal", { bg = "#0d0d0d" })
			-- end,
			["jellybeans-nvim"] = function()
				vim.api.nvim_set_hl(0, "Normal", { bg = "none", fg = "#b2b2b2" })
			end,
			habamax = function()
				vim.api.nvim_set_hl(0, "MatchParen", { fg = "#585858" })
			end,
			gruvbox = function()
				if vim.o.background == "dark" then
					vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
				end
			end,
			flexoki = function()
				if vim.o.background == "light" then
					vim.api.nvim_set_hl(0, "@variable", { fg = "#100F0F" })
				else
					local darkYellow = "#D0A215"
					local darkFg = "#CECDC3"
					local darkMagenta = "#CE5D97"
					vim.api.nvim_set_hl(0, "@variable", { fg = darkFg })
					vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = darkYellow })
					vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = darkYellow })
					vim.api.nvim_set_hl(0, "normal", { bg = "none" })
					vim.api.nvim_set_hl(0, "@type.go", { fg = darkYellow })
					vim.api.nvim_set_hl(0, "Special", { fg = darkMagenta })
				end
				vim.api.nvim_set_hl(
					0,
					"BlinkCmpGhostText",
					vim.tbl_extend(
						"keep",
						{ italic = false },
						vim.api.nvim_get_hl(0, { name = "Comment", link = false })
					)
				)
			end,
			vscode = function()
				if vim.o.background == "dark" then
					vim.api.nvim_set_hl(0, "normal", { bg = "NONE" })
					-- vim.api.nvim_set_hl(0, "normal", { bg = "#1C1C1C" })
					vim.api.nvim_set_hl(0, "@variable", { fg = "#D4D4D4" })
					vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = "#808080" })
					vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = "#808080" })
					vim.api.nvim_set_hl(0, "@punctuation.special", { fg = "#808080" })
				end
			end,
		}

		local colorscheme = vim.g.colors_name
		if setup_colorscheme[colorscheme] then
			setup_colorscheme[colorscheme]()
		end
	end,
})

-- vim.api.nvim_create_autocmd({ "ColorSchemePre" }, {
-- 	callback = function()
-- 		vim.cmd("hi clear")
-- 	end,
-- })

vim.api.nvim_create_autocmd({ "ColorScheme" }, {
	callback = function()
		local hsl = {
			-- gruvbox = {
			-- 	s = 0.9,
			-- 	l = 0.9,
			-- },
			-- ["rose-pine"] = {
			-- 	s = 0.7,
			-- 	l = 0.8,
			-- 	-- s = 0.8,
			-- 	-- l = 0.9,
			-- },
		}

		local colorscheme = vim.g.colors_name
		if hsl[colorscheme] then
			local C = require("util.color")
			local hl_groups = vim.api.nvim_get_hl(0, {})
			for name, spec in pairs(hl_groups) do
				if spec.fg then
					local fg = "#" .. string.format("%06x", spec.fg)
					spec.fg = C.shift_hsl_percentage(fg, hsl[colorscheme])
					vim.api.nvim_set_hl(0, name, spec)
				end
			end
		end
	end,
})

M.config = function()
	-- vim.cmd.colorscheme("oxocarbon")
end

local plugins = {
	M,
	{
		"rose-pine/neovim",
		opts = {
			dark_variant = "moon",
			styles = {
				bold = true,
				italic = false,
				transparency = false,
			},
			palette = {
				-- Override the builtin palette per variant
				moon = {
					base = "#23222B",
				},
				dawn = {
					_nc = "#f8f0e7",
					base = "#faf4ed",
					surface = "#fffaf3",
					overlay = "#f2e9e1",
					muted = "#938ea2",
					subtle = "#787393",
					text = "#474360",
					love = "#af5e75",
					gold = "#927052",
					rose = "#bc5953",
					pine = "#587c8f",
					foam = "#577d85",
					iris = "#856d9f",
					leaf = "#557f78",
					highlight_low = "#f4ede8",
					highlight_med = "#dfdad9",
					highlight_high = "#cecacd",
				},
			},
			-- before_highlight = function(_, hl, _)
			-- 	C = require("util.color")
			-- 	hl.fg = C.shift_hsl(hl.fg, {
			-- 		l = -10,
			-- 		s = -10,
			-- 		h = 0,
			-- 	})
			-- end,
		},
		config = function(_, opts)
			require("rose-pine").setup(opts)
		end,
	},

	{
		"ellisonleao/gruvbox.nvim",
		opts = {
			bold = false,
			italic = {
				strings = false,
				emphasis = false,
				comments = false,
				operators = false,
				folds = false,
			},
			transparent_mode = false,
			palette_overrides = {
				dark0 = "#171414",
				dark1 = "#272525",
				dark2 = "#3c3838",
				dark3 = "#565151",
				dark4 = "#726e6e",
			},
			overrides = {
				SignColumn = { link = "LineNr" },
			},
		},
		config = function(_, opts)
			require("gruvbox").setup(opts)
		end,
	},

	-- {
	-- 	"rebelot/kanagawa.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {
	-- 		transparent = true,
	-- 		overrides = function(colors)
	-- 			local theme = colors.theme
	-- 			return {
	-- 				TelescopeTitle = { fg = theme.ui.special, bold = true },
	-- 				TelescopePromptNormal = { bg = theme.ui.bg_p1 },
	-- 				TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
	-- 				TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
	-- 				TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
	-- 				TelescopePreviewNormal = { bg = theme.ui.bg_dim },
	-- 				TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
	-- 			}
	-- 		end,
	-- 	},
	-- },

	{
		"zenbones-theme/zenbones.nvim",
		dependencies = "rktjmp/lush.nvim",
		config = function()
			vim.api.nvim_create_autocmd({ "ColorScheme" }, {
				pattern = { "zenwritten", "zenbones" },
				callback = function()
					local disable_italic = function(hl)
						vim.api.nvim_set_hl(
							0,
							hl,
							vim.tbl_extend(
								"keep",
								{ bold = false, italic = false },
								vim.api.nvim_get_hl(0, { name = hl, link = false })
							)
						)
					end
					disable_italic("Comment")
					disable_italic("Number")
					disable_italic("Constant")
					disable_italic("Boolean")
				end,
			})
		end,
	},

	{
		"EdenEast/nightfox.nvim",
		opts = {
			options = {},
			palettes = {
				nightfox = {
					-- bg1 = "#161c22",
					bg1 = "#20272f",
				},
				terafox = {
					-- bg1 = "#141b1b",
					bg1 = "#1f2425",
				},
				duskfox = {
					bg1 = "#23222b",
				},
				nordfox = {
					bg1 = "#2a2d32",
				},
			},
		},
		config = function(_, opts)
			require("nightfox").setup(opts)
		end,
	},

	{
		"maxmx03/solarized.nvim",
	},

	{
		"folke/tokyonight.nvim",
		config = function()
			require("tokyonight").setup({
				transparent = true,
			})
		end,
	},

	{
		"catppuccin/nvim",
		config = function()
			require("catppuccin").setup({
				transparent_background = true,
				-- color_overrides = {
				-- 	frappe = {
				-- 		rosewater = "#894f41",
				-- 		flamingo = "#9c4141",
				-- 		pink = "#8a4777",
				-- 		mauve = "#513a7c",
				-- 		red = "#9a424a",
				-- 		maroon = "#9a424a",
				-- 		peach = "#894f41",
				-- 		yellow = "#755840",
				-- 		green = "#446740",
				-- 		teal = "#446466",
				-- 		sky = "#466176",
				-- 		sapphire = "#44636b",
				-- 		blue = "#4c5b98",
				-- 		lavender = "#4d59a0",
				-- 		text = "#3b3b3b",
				-- 		subtext1 = "#474747",
				-- 		subtext0 = "#525252",
				-- 		overlay2 = "#5e5e5e",
				-- 		overlay1 = "#6a6a6a",
				-- 		overlay0 = "#777777",
				-- 		surface2 = "#ababab",
				-- 		surface1 = "#b9b9b9",
				-- 		surface0 = "#c6c6c6",
				-- 		base = "#e2e2e2",
				-- 		mantle = "#f1f1f1",
				-- 		crust = "#000000",
				-- 	},
				-- 	latte = {
				-- 		rosewater = "#ac6453",
				-- 		flamingo = "#c35353",
				-- 		pink = "#ad5a96",
				-- 		mauve = "#8369b9",
				-- 		red = "#c0545f",
				-- 		maroon = "#c1545b",
				-- 		peach = "#ac6453",
				-- 		yellow = "#947052",
				-- 		green = "#578152",
				-- 		teal = "#577e81",
				-- 		sky = "#597b95",
				-- 		sapphire = "#577d87",
				-- 		blue = "#6273ba",
				-- 		lavender = "#6772ba",
				-- 		text = "#3b3b3b",
				-- 		subtext1 = "#474747",
				-- 		subtext0 = "#525252",
				-- 		overlay2 = "#5e5e5e",
				-- 		overlay1 = "#6a6a6a",
				-- 		overlay0 = "#777777",
				-- 		surface2 = "#ababab",
				-- 		surface1 = "#b9b9b9",
				-- 		surface0 = "#c6c6c6",
				-- 		base = "#e2e2e2",
				-- 		mantle = "#f1f1f1",
				-- 		crust = "#000000",
				-- 	},
				-- 	macchiato = {
				-- 		rosewater = "#b78578",
				-- 		flamingo = "#bd8282",
				-- 		pink = "#b580a7",
				-- 		mauve = "#9a89b3",
				-- 		red = "#bb8189",
				-- 		maroon = "#bc8186",
				-- 		peach = "#ad8978",
				-- 		yellow = "#9c8f78",
				-- 		green = "#7f9878",
				-- 		teal = "#7b9692",
				-- 		sky = "#7c969a",
				-- 		sapphire = "#7d94a1",
				-- 		blue = "#8291b3",
				-- 		lavender = "#8a8eb3",
				-- 		text = "#c6c6c6",
				-- 		subtext1 = "#b6b6b6",
				-- 		subtext0 = "#ababab",
				-- 		overlay2 = "#9e9e9e",
				-- 		overlay1 = "#919191",
				-- 		overlay0 = "#848484",
				-- 		surface2 = "#777777",
				-- 		surface1 = "#303030",
				-- 		surface0 = "#262626",
				-- 		base = "#1b1b1b",
				-- 		mantle = "#111111",
				-- 		crust = "#000000",
				-- 	},
				-- 	mocha = {
				-- 		rosewater = "#cba298",
				-- 		flamingo = "#c97c7c",
				-- 		pink = "#c7a0bc",
				-- 		mauve = "#b2a6c5",
				-- 		red = "#c9a1a6",
				-- 		maroon = "#caa1a4",
				-- 		peach = "#cca290",
				-- 		yellow = "#b8aa8e",
				-- 		green = "#97b38e",
				-- 		teal = "#91b2ac",
				-- 		sky = "#93b0b6",
				-- 		sapphire = "#94afbe",
				-- 		blue = "#a0abc6",
				-- 		lavender = "#a7a9c5",
				-- 		text = "#c6c6c6",
				-- 		subtext1 = "#b6b6b6",
				-- 		subtext0 = "#ababab",
				-- 		overlay2 = "#9e9e9e",
				-- 		overlay1 = "#919191",
				-- 		overlay0 = "#848484",
				-- 		surface2 = "#777777",
				-- 		surface1 = "#303030",
				-- 		surface0 = "#262626",
				-- 		base = "#1b1b1b",
				-- 		mantle = "#111111",
				-- 		crust = "#000000",
				-- 	},
				-- },
			})
		end,
	},

	{
		"navarasu/onedark.nvim",
		config = function()
			require("onedark").setup({
				style = "warmer",
				transparent = true,

				code_style = {
					comments = "italic",
					keywords = "none",
					functions = "none",
					strings = "none",
					variables = "none",
				},

				lualine = {
					transparent = false,
				},

				diagnostics = {
					darker = false,
					undercurl = true,
					background = true,
				},
			})

			vim.cmd.colorscheme("catppuccin")
		end,
	},
}

for i, _ in ipairs(plugins) do
	plugins[i] = vim.tbl_extend("force", plugins[i], { lazy = false, priority = 1000 })
end

return plugins