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
				else
					vim.api.nvim_set_hl(0, "Normal", { bg = "#EFF1F8", fg = "#13161C" })
					vim.api.nvim_set_hl(0, "StatusLine", { bg = "#EFF1F8", fg = "#13161C" })
					vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#EFF1F8", fg = "#13161C" })
					-- vim.api.nvim_set_hl(0, "Normal", { bg = "#fffefe", fg = "#13161C" })
				end
			end,
			wildcharm = function()
				vim.api.nvim_set_hl(0, "Normal", { bg = "none", fg = "#b2b2b2" })
			end,
			-- lunaperche = function()
			-- 	vim.api.nvim_set_hl(0, "Normal", { bg = "#0d0d0d" })
			-- end,
			habamax = function()
				vim.api.nvim_set_hl(0, "MatchParen", { fg = "#585858" })
				vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
				vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })
			end,
			gruvbox = function()
				if vim.o.background == "dark" then
					vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
					vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })
				end
			end,
			vscode = function()
				-- enforce transparency-friendly highlights
				vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
				vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
				vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
				vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
				vim.api.nvim_set_hl(0, "Folded", { bg = "NONE" })
				vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
				vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })
				vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = "#808080" })
				vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = "#808080" })
				vim.api.nvim_set_hl(0, "@punctuation.special", { fg = "#808080" })
			end,
		}

		local colorscheme = vim.g.colors_name
		if setup_colorscheme[colorscheme] then
			setup_colorscheme[colorscheme]()
		end
	end,
})

vim.api.nvim_create_autocmd({ "ColorSchemePre" }, {
	callback = function()
		vim.cmd("hi clear")
	end,
})

-- vim.api.nvim_create_autocmd({ "ColorScheme" }, {
-- 	callback = function()
-- 		local hsl = {
-- 			-- gruvbox = {
-- 			-- 	s = 0.9,
-- 			-- 	l = 0.9,
-- 			-- },
-- 			-- ["rose-pine"] = {
-- 			-- 	s = 0.7,
-- 			-- 	l = 0.8,
-- 			-- 	-- s = 0.8,
-- 			-- 	-- l = 0.9,
-- 			-- },
-- 		}
--
-- 		local colorscheme = vim.g.colors_name
-- 		if hsl[colorscheme] then
-- 			local C = require("util.color")
-- 			local hl_groups = vim.api.nvim_get_hl(0, {})
-- 			for name, spec in pairs(hl_groups) do
-- 				if spec.fg then
-- 					local fg = "#" .. string.format("%06x", spec.fg)
-- 					spec.fg = C.shift_hsl_percentage(fg, hsl[colorscheme])
-- 					vim.api.nvim_set_hl(0, name, spec)
-- 				end
-- 			end
-- 		end
-- 	end,
-- })

M.config = function()
	vim.cmd.colorscheme("oxocarbon")
end

local plugins = {
	M,
	{
		"Mofiqul/vscode.nvim",
		opts = {
			transparent = true,
			italic_comments = false,
			disable_nvimtree_bg = true,
		},
		config = function(_, opts)
			local vscode = require("vscode")
			vscode.setup(opts)
			-- local style = vim.o.background == "light" and "light" or "dark"
			-- vscode.load(style)
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
			transparent_mode = true,
			palette_overrides = {
				-- 	dark0 = "#171414",
				-- 	dark1 = "#272525",
				-- 	dark2 = "#3c3838",
				-- 	dark3 = "#565151",
				-- 	dark4 = "#726e6e",
				-- material palette
				-- dark0_hard = "#1C1C1C",
				-- dark0 = "#262626",
				-- dark0_soft = "#303030",
				-- dark1 = "#3A3A3A",
				-- dark2 = "#4E4E4E",
				-- dark3 = "#5F5F5F",
				-- dark4 = "#6C6C6C",
				-- light0_hard = "#FFFFD7",
				-- light0 = "#FFFFD7",
				-- light0_soft = "#FFD7B0",
				-- light1 = "#FFD7B0",
				-- light2 = "#D7D7AF",
				-- light3 = "#AFAF87",
				-- light4 = "#AF8788",
				-- bright_red = "#FF5F5F",
				-- bright_green = "#AFAF00",
				-- bright_yellow = "#FFAF01",
				-- bright_blue = "#87AF87",
				-- bright_purple = "#D686AF",
				-- bright_aqua = "#87AF87",
				-- bright_orange = "#FF8700",
				-- neutral_red = "#D70001",
				-- neutral_green = "#878700",
				-- neutral_yellow = "#D78700",
				-- neutral_blue = "#5F8787",
				-- neutral_purple = "#AF5F86",
				-- neutral_aqua = "#60AF5F",
				-- neutral_orange = "#D75F00",
				-- faded_red = "#AF0000",
				-- faded_green = "#878700",
				-- faded_yellow = "#AF8700",
				-- faded_blue = "#006087",
				-- faded_purple = "#875E5F",
				-- faded_aqua = "#5F875F",
				-- faded_orange = "#AF5F00",
				-- dark_red_hard = "#870000",
				-- dark_red = "#5F0000",
				-- dark_red_soft = "#444444",
				-- light_red_hard = "#FF8787",
				-- light_red = "#FF8787",
				-- light_red_soft = "#FF8787",
				-- dark_green_hard = "#4E4E4E",
				-- dark_green = "#585858",
				-- dark_green_soft = "#5F5F5F",
				-- light_green_hard = "#D7D7AF",
				-- light_green = "#D7D7AF",
				-- light_green_soft = "#D7D786",
				-- dark_aqua_hard = "#3A3A3A",
				-- dark_aqua = "#444444",
				-- dark_aqua_soft = "#4E4E4E",
				-- light_aqua_hard = "#D7D7AF",
				-- light_aqua = "#D7D7AF",
				-- light_aqua_soft = "#D7D7AF",
				-- gray = "#808080",
			},
			overrides = {
				SignColumn = { link = "LineNr" },
			},
		},
		config = function(_, opts)
			require("gruvbox").setup(opts)
		end,
	},

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

					vim.api.nvim_set_hl(0, "Folded", { bg = "none" })
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
			-- vim.cmd.colorscheme("dawnfox")
		end,
	},

	{ "maxmx03/solarized.nvim" },

	-- { "catppuccin/nvim", enabled = false },
}

for i, _ in ipairs(plugins) do
	plugins[i] = vim.tbl_extend("force", plugins[i], { lazy = false, priority = 1000 })
end

return plugins