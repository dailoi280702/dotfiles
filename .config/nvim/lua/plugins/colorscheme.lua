local M = {
	"nyoom-engineering/oxocarbon.nvim",
	lazy = false,
	priority = 1000,
}

M.init = function()
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
				-- gruvbox = function()
				-- 	vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
				-- 	vim.api.nvim_set_hl(0, "FoldColumn", { bg = "none" })
				-- end,
				default = function()
					vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
				end,
				wildcharm = function()
					vim.api.nvim_set_hl(0, "Normal", { bg = "none", fg = "#b2b2b2" })
				end,
				["jellybeans-nvim"] = function()
					vim.api.nvim_set_hl(0, "Normal", { bg = "none", fg = "#b2b2b2" })
				end,
				habamax = function()
					vim.api.nvim_set_hl(0, "MatchParen", { fg = "#585858" })
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
						vim.tbl_extend("keep", { italic = false }, vim.api.nvim_get_hl(0, { name = "Comment", link = false }))
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
end

M.config = function()
	-- vim.cmd.colorscheme("oxocarbon")
	-- vim.cmd.colorscheme("retrobox")
	-- vim.cmd.colorscheme("habamax")
	-- vim.cmd.colorscheme("wildcharm")
	-- vim.cmd.colorscheme("default")
end

return {
	M,
	{
		"Mofiqul/vscode.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- local c = require("vscode.colors").get_colors()
			require("vscode").setup({
				transparent = true,
				-- italic_comments = true,
				-- underline_links = true,
				-- group_overrides = {
				-- 	["@punctuation.bracket"] = { fg = c.vscGray },
				-- 	["@punctuation.delimiter"] = { fg = c.vscGray },
				-- 	["@punctuation.special"] = { fg = c.vscGray },
				-- 	["@variable"] = { fg = c.vscFront },
				-- },
			})
			-- vim.o.background = "dark"
			-- require("vscode").load()
			-- vim.cmd.colorscheme("vscode")
		end,
	},

	-- {
	-- 	"maxmx03/solarized.nvim",
	-- 	lazy = false,
	-- 	opts = {
	-- 		transparent = {
	-- 			enabled = true, -- Master switch to enable transparency
	-- 			pmenu = true, -- Popup menu (e.g., autocomplete suggestions)
	-- 			normal = true, -- Main editor window background
	-- 			normalfloat = true, -- Floating windows
	-- 			neotree = true, -- Neo-tree file explorer
	-- 			nvimtree = true, -- Nvim-tree file explorer
	-- 			whichkey = true, -- Which-key popup
	-- 			telescope = true, -- Telescope fuzzy finder
	-- 			lazy = true, -- Lazy plugin manager UI
	-- 			mason = true, -- Mason manage external tooling
	-- 		},
	-- 		-- styles = {
	-- 		-- 	keywords = { bold = false },
	-- 		-- },
	-- 		on_highlights = function(colors, color)
	-- 			local groups = {
	-- 				KeyWord = { fg = "#859900" },
	-- 				Delimiter = { fg = "#dc322f" },
	-- 				Bracket = { fg = "#dc322f" },
	-- 				Number = { fg = "#2aa198" },
	-- 			}
	-- 			return groups
	-- 		end,
	-- 	},
	-- 	config = function(_, opts)
	-- 		-- vim.opt.background = "light"
	-- 		require("solarized").setup(opts)
	-- 		-- vim.cmd.colorscheme("solarized")
	-- 	end,
	-- },

	{
		"rose-pine/neovim",
		lazy = false,
		priority = 1000,
		opts = {
			dark_variant = "moon",
			styles = {
				bold = true,
				italic = false,
				transparency = true,
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
			-- vim.cmd.colorscheme("rose-pine-dawn")
		end,
	},

	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			italic = {
				strings = false,
				emphasis = false,
				comments = false,
				operators = false,
				folds = false,
			},
			transparent_mode = true,
		},
		config = function(_, opts)
			require("gruvbox").setup(opts)
			vim.cmd.colorscheme("gruvbox")
		end,
	},

	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.gruvbox_material_background = "hard"
			vim.g.gruvbox_material_transparent_background = 2
			vim.g.better_performance = 1
			-- vim.cmd.colorscheme("gruvbox-material")
		end,
	},

	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true,
			overrides = function(colors)
				local theme = colors.theme
				return {
					TelescopeTitle = { fg = theme.ui.special, bold = true },
					TelescopePromptNormal = { bg = theme.ui.bg_p1 },
					TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
					TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
					TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
					TelescopePreviewNormal = { bg = theme.ui.bg_dim },
					TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
				}
			end,
		},
		config = function(_, opts)
			require("kanagawa").setup(opts)
			-- vim.cmd.colorscheme("kanagawa-dragon")
		end,
	},

	{
		"catppuccin/nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent_background = true,
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)
		end,
	},

	{
		"kepano/flexoki-neovim",
		lazy = false,
		priority = 1000,
		config = function()
			-- vim.cmd.colorscheme("flexoki-light")
		end,
	},

	{
		"zenbones-theme/zenbones.nvim",
		dependencies = "rktjmp/lush.nvim",
		lazy = false,
		priority = 1000,
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

			-- vim.opt.background = "light"
			-- vim.cmd.colorscheme("zenwritten")
		end,
	},

	{
		"maxmx03/solarized.nvim",
		lazy = false,
		priority = 1000,
		config = function() end,
	},

	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 1000,
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
			-- vim.cmd.colorscheme("dayfox")
		end,
	},
}