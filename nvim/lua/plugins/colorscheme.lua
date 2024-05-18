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
				["gruvbox-material"] = function()
					vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
					vim.api.nvim_set_hl(0, "LspInfoBorder", { link = "Normal" })
					vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
					vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = "#928374" })
				end,
				melange = function()
					vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
				end,
				default = function()
					vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
					vim.api.nvim_set_hl(0, "StatusLine", { link = "Normal" })
					vim.api.nvim_set_hl(0, "StatusLineNC", { link = "Normal" })
				end,
				adwaita = function()
					vim.api.nvim_set_hl(0, "TelescopeSelection", { link = "CursorLine" })
					vim.api.nvim_set_hl(0, "TelescopeMatching", { link = "Identifier" })
				end,
			}

			local colorscheme = vim.g.colors_name
			if setup_colorscheme[colorscheme] then
				setup_colorscheme[colorscheme]()
			end
		end,
	})
end

M.config = function()
	-- vim.cmd.colorscheme("oxocarbon")
	-- vim.cmd.colorscheme("retrobox")
	-- vim.cmd.colorscheme("default")
end

local N = {
	"rose-pine/neovim",
	lazy = false,
	priority = 999,
	enabled = true,
}

N.opts = { styles = { italic = false, transparency = false, bold = false } }

N.config = function(_, opts)
	local theme = require("rose-pine")
	theme.setup(opts)

	-- vim.cmd.colorscheme("rose-pine-dawn")
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

return {
	M,
	N,
	P,
	-- {
	-- 	"Mofiqul/vscode.nvim",
	-- 	lazy = false,
	-- 	priority = 999,
	-- 	config = function()
	-- 		local c = require("vscode.colors").get_colors()
	-- 		require("vscode").setup({
	-- 			italic_comments = true,
	-- 			underline_links = true,
	-- 			group_overrides = {
	-- 				["@punctuation.bracket"] = { fg = c.vscGray },
	-- 				["@punctuation.delimiter"] = { fg = c.vscGray },
	-- 				["@punctuation.special"] = { fg = c.vscGray },
	-- 			},
	-- 		})
	-- 		-- require("vscode").load()
	-- 		-- vim.cmd.colorscheme("vscode")
	-- 	end,
	-- },
	{
		"ellisonleao/gruvbox.nvim",
		priority = 998,
		lazy = false,
		opts = {
			transparent_mode = true,
			bold = false,
			italic = {
				strings = false,
				emphasis = false,
				comments = false,
				operators = false,
				folds = false,
			},
			overrides = {
				-- ["Delimiter"] = { link = "Comment" },
				["Delimiter"] = { link = "GruvboxOrange" },
			},
		},
		config = function(_, opts)
			require("gruvbox").setup(opts)
			-- vim.cmd.colorscheme("gruvbox")
		end,
	},
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		enabled = false,
		opts = {
			transparent_background = false,
			kitty = false,
			integrations = {
				hop = true,
				telescope = {
					enabled = true,
					style = "nvchad",
				},
				noice = true,
				ufo = true,
				notify = true,
				which_key = true,
			},
			color_overrides = {
				macchiato = {
					-- base = "#212334",
					base = "#232634",
				},
			},
		},
		priority = 998,
		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd.colorscheme("catppuccin-macchiato")
		end,
	},
	{
		"projekt0n/github-nvim-theme",
		lazy = false,
		priority = 1000,
		opts = {
			options = {
				transparent = false,
				styles = {
					comments = "italic",
					functions = "NONE",
					keywords = "bold",
					variables = "NONE",
					conditionals = "NONE",
					constants = "NONE",
					numbers = "NONE",
					operators = "NONE",
					strings = "italic",
					types = "NONE",
				},
			},
		},
		config = function(_, opts)
			require("github-theme").setup(opts)
			-- vim.cmd.colorscheme("github_dark_dimmed")
		end,
	},
	{
		"Mofiqul/adwaita.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.adwaita_transparent = false
			-- vim.cmd.colorscheme("adwaita")
		end,
	},
	{
		"savq/melange-nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("melange")
		end,
	},
}