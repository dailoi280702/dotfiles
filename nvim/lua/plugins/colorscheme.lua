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
				-- retrobox = function()
				-- 	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
				-- 	vim.api.nvim_set_hl(0, "Folded", { bg = "none" })
				-- 	vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
				-- 	vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#b8bb26" })
				-- 	vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#8ec07c" })
				-- 	vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#fb4934" })
				-- 	vim.api.nvim_set_hl(0, "HopNextKey", { fg = "#d3869b", bold = true })
				-- 	vim.api.nvim_set_hl(0, "HopNextKey1", { fg = "#83a598", bold = true })
				-- 	vim.api.nvim_set_hl(0, "HopNextKey2", { fg = "#8ec07c" })
				-- 	vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = "#fe8019", bg = "#303030" })
				-- 	vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = "#83a598" })
				-- end,
				-- gruvbox = function()
				-- 	vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
				-- 	vim.api.nvim_set_hl(0, "FoldColumn", { bg = "none" })
				-- end,
				-- default = function()
				-- 	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
				-- end,
				wildcharm = function()
					vim.api.nvim_set_hl(0, "Normal", { bg = "none", fg = "#b2b2b2" })
				end,
				["jellybeans-nvim"] = function()
					vim.api.nvim_set_hl(0, "Normal", { bg = "none", fg = "#b2b2b2" })
				end,
				habamax = function()
					vim.api.nvim_set_hl(0, "MatchParen", { fg = "#585858" })
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
				["rose-pine"] = {
					s = 0.7,
					l = 0.8,
					-- s = 0.8,
					-- l = 0.9,
				},
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
end

return {
	M,
	{
		"Mofiqul/vscode.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			local c = require("vscode.colors").get_colors()
			require("vscode").setup({
				italic_comments = true,
				underline_links = true,
				group_overrides = {
					["@punctuation.bracket"] = { fg = c.vscGray },
					["@punctuation.delimiter"] = { fg = c.vscGray },
					["@punctuation.special"] = { fg = c.vscGray },
				},
			})
			-- require("vscode").load()
			-- vim.cmd.colorscheme("vscode")
		end,
	},
	{
		"maxmx03/solarized.nvim",
		lazy = false,
		opts = {
			transparent = {
				enabled = true, -- Master switch to enable transparency
				pmenu = true, -- Popup menu (e.g., autocomplete suggestions)
				normal = true, -- Main editor window background
				normalfloat = true, -- Floating windows
				neotree = true, -- Neo-tree file explorer
				nvimtree = true, -- Nvim-tree file explorer
				whichkey = true, -- Which-key popup
				telescope = true, -- Telescope fuzzy finder
				lazy = true, -- Lazy plugin manager UI
				mason = true, -- Mason manage external tooling
			},
			-- styles = {
			-- 	keywords = { bold = false },
			-- },
			on_highlights = function(colors, color)
				local groups = {
					KeyWord = { fg = "#859900" },
					Delimiter = { fg = "#dc322f" },
					Bracket = { fg = "#dc322f" },
					Number = { fg = "#2aa198" },
				}
				return groups
			end,
		},
		config = function(_, opts)
			-- vim.opt.background = "light"
			require("solarized").setup(opts)
			-- vim.cmd.colorscheme("solarized")
		end,
	},
	{
		"rose-pine/neovim",
		lazy = false,
		priority = 1000,
		opts = {
			dark_variant = "moon",
			styles = {
				bold = true,
				italic = false,
				transparency = false,
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
			transparent_mode = false,
		},
		config = function(_, opts)
			require("gruvbox").setup(opts)
			-- vim.opt.background = "dark"
			-- vim.cmd.colorscheme("gruvbox")
		end,
	},
	{
		"projekt0n/github-nvim-theme",
		lazy = false,
		priority = 1000,
		opts = {
			options = {
				transparent = false,
			},
		},
		config = function(_, opts)
			require("github-theme").setup(opts)
			-- vim.cmd.colorscheme("github_dark_dimmed")
		end,
	},
	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function(_, opts)
			require("nightfox").setup(opts)
			-- vim.opt.background = "light"
			-- vim.cmd.colorscheme("dayfox")
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
	-- 	config = function(_, opts)
	-- 		require("kanagawa").setup(opts)
	-- 		-- vim.opt.background = "dark"
	-- 		-- vim.cmd.colorscheme("kanagawa-dragon")
	-- 	end,
	-- },
	-- {
	-- 	"catppuccin/nvim",
	-- 	priority = 1000,
	-- 	lazy = false,
	-- 	opts = {
	-- 		no_italic = true,
	-- 		transparent_background = false,
	-- 	},
	-- 	config = function(_, opts)
	-- 		require("catppuccin").setup(opts)
	-- 		-- vim.cmd.colorscheme("catppuccin-frappe")
	-- 	end,
	-- },
	-- {
	-- 	"echasnovski/mini.base16",
	-- 	lazy = false,
	-- 	priority = 999,
	-- 	config = function()
	-- 		require("mini.base16").setup({
	-- 			palette = {
	-- 				base00 = "#FFFBF0",
	-- 				base01 = "#F2F0E5",
	-- 				base02 = "#E6E4D8",
	-- 				base03 = "#DAD8CE",
	-- 				base07 = "#CECDC3",
	-- 				base06 = "#B7B6AC",
	-- 				base05 = "#6F6E69",
	-- 				base04 = "#171616",
	-- 				base08 = "#D14D41",
	-- 				base0D = "#DA702C",
	-- 				base09 = "#4385BE",
	-- 				base0A = "#D0A215",
	-- 				base0C = "#879A39",
	-- 				base0B = "#3AA99F",
	-- 				base0E = "#8B7EC8",
	-- 				base0F = "#CE5D97",
	-- 			},
	-- 		})
	-- 	end,
	-- },
	{
		"kepano/flexoki-neovim",
		lazy = false,
		priority = 999,
		config = function()
			vim.cmd.colorscheme("flexoki-light")
		end,
	},
}