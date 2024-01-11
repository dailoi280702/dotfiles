local M = {
	"nyoom-engineering/oxocarbon.nvim",
	lazy = false,
	priority = 1000,
}

M.init = function()
	-- vim.api.nvim_create_autocmd({ "ColorSchemePre" }, {
	-- 	callback = function()
	-- 		vim.cmd([[hi clear]])
	-- 	end,
	-- })

	vim.api.nvim_create_autocmd({ "ColorScheme" }, {
		callback = function()
			local setup_colorscheme = {
				oxocarbon = function()
					vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
					vim.api.nvim_set_hl(0, "HopNextKey", { fg = "#be95ff", bold = true })
					vim.api.nvim_set_hl(0, "HopNextKey1", { fg = "#ff7eb6" })
					vim.api.nvim_set_hl(0, "HopNextKey2", { fg = "#ee5396", bold = true })
					vim.api.nvim_set_hl(0, "Folded", { bg = "none" })
					vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = "#6f6f6f" })
					-- vim.cmd.highlight({ "def link @function @function.builtin", bang = true })
				end,
				retrobox = function()
					vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#b8bb26" })
					vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#8ec07c" })
					vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#fb4934" })
					vim.api.nvim_set_hl(0, "HopNextKey", { fg = "#d3869b", bold = true })
					vim.api.nvim_set_hl(0, "HopNextKey1", { fg = "#83a598", bold = true })
					vim.api.nvim_set_hl(0, "HopNextKey2", { fg = "#8ec07c" })
					vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = "#fe8019", bg = "#303030" })
					vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = "#83a598" })
				end,
				wildcharm = function()
					vim.api.nvim_set_hl(0, "Normal", { bg = "#121212" })
				end,
				["gruvbox-material"] = function()
					vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
					vim.api.nvim_set_hl(0, "LspInfoBorder", { link = "Normal" })
					vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
					vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = "#383330" })
				end,
				flexoki = function()
					vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
				end,
			}

			local colorscheme = vim.g.colors_name
			if setup_colorscheme[colorscheme] then
				setup_colorscheme[colorscheme]()
			end
		end,
	})
end

-- M.config = function()
-- 	vim.cmd.colorscheme("oxocarbon")
-- 	-- vim.cmd.colorscheme("retrobox")
-- end

local N = {
	"rose-pine/neovim",
	lazy = false,
	priority = 999,
	enabled = true,
}

N.config = function()
	local theme = require("rose-pine")
	theme.setup({
		disable_background = true,
		disable_italics = true,
	})

	-- vim.cmd.colorscheme("rose-pine")
	-- vim.cmd.colorscheme("retrobox")
end

P = {
	"rebelot/kanagawa.nvim",
	lazy = false,
	priority = 998,
	enabled = false,
}

P.config = function()
	require("kanagawa").setup({
		compile = true,
		transparent = false,
		overrides = function(colors)
			local theme = colors.theme

			local overrides = {
				TelescopeTitle = { fg = theme.ui.special, bold = true },
				TelescopePromptNormal = { bg = theme.ui.bg_p1 },
				TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
				TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
				TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
				TelescopePreviewNormal = { bg = theme.ui.bg_dim },
				TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
				NormalFloat = { bg = "none" },
				FloatBorder = { bg = "none" },
				FloatTitle = { bg = "none" },
				NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
				LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
				MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
				Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
				PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
				PmenuSbar = { bg = theme.ui.bg_m1 },
				PmenuThumb = { bg = theme.ui.bg_p2 },
			}

			return overrides
		end,
		colors = {
			palette = {
				-- change all usages of these colors
				sumiInk0 = "#000000",
				fujiWhite = "#FFFFFF",
			},
			theme = {
				all = {
					ui = {
						bg_gutter = "none",
					},
				},
			},
		},
	})

	vim.cmd.colorscheme("kanagawa-dragon")
end

Q = {
	"sainnhe/gruvbox-material",
	priority = 990,
	lazy = false,
	enabled = false,
}

Q.config = function()
	vim.g.gruvbox_material_background = "hard"
	vim.g.gruvbox_material_transparent_background = 2
	vim.g.gruvbox_material_diagnostic_line_highlight = 1
	vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
	vim.g.gruvbox_material_enable_bold = 1
	vim.g.gruvbox_material_enable_italic = 1

	vim.cmd.colorscheme("gruvbox-material")
end

return {
	M,
	N,
	P,
	Q,
	{
		"folke/tokyonight.nvim",
		lazy = false,
	},
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		opts = {
			-- transparent_background = true
			kitty = false
		},
		priority = 998,
		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd.colorscheme("catppuccin-macchiato")
		end,
	},
	{
		"Mofiqul/vscode.nvim",
		lazy = false,
		priority = 998,
		enabled = false,
		opts = {
			transparent = true,
			color_overrides = {
				vscFront = "#C0C0C0",
			},
		},
		config = function(_, opts)
			require("vscode").setup(opts)
			vim.cmd.colorscheme("vscode")
		end,
	},
}

-- " Color: neutralred              #cc241d        160            DarkRed
-- " Color: neutralgreen            #98971a        100            DarkGreen
-- " Color: neutralyellow           #d79921        172            DarkYellow
-- " Color: neutralblue             #458588        66             DarkBlue
-- " Color: neutralpurple           #b16286        132            DarkMagenta
-- " Color: neutralaqua             #689d6a        71             DarkCyan
-- " Color: neutralorange           #d65d0e        166            LightRed
-- " Background: dark
-- " Color: bg0                     #1c1c1c        234            Black
-- " Color: bg1                     #3c3836        237            DarkGray
-- " Color: bg2                     #504945        239            DarkGray
-- " Color: bg3                     #303030        236
-- " Color: bg4                     #7c6f64        243
-- " Color: bg5                     #000000        16             DarkGray
-- " Color: bg6                     #121212        233            DarkGray
-- " Color: fg0                     #fbf1c7        230            White
-- " Color: fg1                     #ebdbb2        187            White
-- " Color: fg2                     #d5c4a1        187
-- " Color: fg3                     #bdae93        144
-- " Color: fg4                     #a89984        102            gray
-- " Color: grey                    #928374        102            DarkGray
-- " Color: red                     #fb4934        203            Red
-- " Color: green                   #b8bb26        142            Green
-- " Color: yellow                  #fabd2f        214            Yellow
-- " Color: blue                    #83a598        109            Blue
-- " Color: purple                  #d3869b        175            Magenta
-- " Color: aqua                    #8ec07c        107            Cyan
-- " Color: orange                  #fe8019        208            Magenta