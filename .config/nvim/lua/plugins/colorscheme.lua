local hsluv = require("util.hsluv")

local M = {}

table.insert(M, { "nyoom-engineering/oxocarbon.nvim" })

table.insert(M, {
	"kepano/flexoki-neovim",
	enabled = false,
	config = function()
		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "flexoki",
			callback = function()
				local palette = require("flexoki.palette").palette()

				vim.api.nvim_set_hl(0, "Identifier", { fg = palette["tx"] })
			end,
		})
	end,
})

table.insert(M, {
	"catppuccin/nvim",
	name = "catppuccin",
	opts = {
		-- transparent_background = true,
		--
		color_overrides = {
			-- frappe = {
			-- 	text = "#d1d1d1",
			-- 	subtext1 = "#c0c0c0",
			-- 	subtext0 = "#aeaeae",
			-- 	overlay2 = "#9d9d9d",
			-- 	overlay1 = "#8c8c8c",
			-- 	overlay0 = "#7a7a7a",
			-- 	surface2 = "#696969",
			-- 	surface1 = "#585858",
			-- 	surface0 = "#464646",
			-- 	base = "#353535",
			-- 	mantle = "#2d2d2d",
			-- 	crust = "#272727",
			-- },
		},
		custom_highlights = function(colors)
			return {
				-- Normal = { bg = colors.crust },
				-- NormalNC = { bg = colors.crust },
				StatusLine = { bg = colors.base },
				StatusLineNC = { bg = colors.base },
				MiniStatuslineFilename = { bg = colors.sky, fg = colors.base },
				MiniStatuslineFileinfo = { bg = colors.sapphire, fg = colors.base },
				MiniStatuslineDevinfo = { bg = colors.teal, fg = colors.base },
			}
		end,
	},
	config = function(_, opts)
		local fix_palette = function(palette)
			local fix_s = function(hex, s)
				local hsl_value = hsluv.hex_to_hsluv(hex)
				hsl_value[2] = s
				return hsluv.hsluv_to_hex(hsl_value)
			end

			-- local fix_l = function(hex, s)
			-- 	local hsl_value = hsluv.hex_to_hsluv(hex)
			-- 	hsl_value[3] = s
			-- 	return hsluv.hsluv_to_hex(hsl_value)
			-- end

			local SAT_BASE = 0
			-- local LN_ACCENT = 80

			return {
				-- base/Text
				text = fix_s(palette.text, SAT_BASE),
				subtext1 = fix_s(palette.subtext1, SAT_BASE),
				subtext0 = fix_s(palette.subtext0, SAT_BASE),
				overlay2 = fix_s(palette.overlay2, SAT_BASE),
				overlay1 = fix_s(palette.overlay1, SAT_BASE),
				overlay0 = fix_s(palette.overlay0, SAT_BASE),
				surface2 = fix_s(palette.surface2, SAT_BASE),
				surface1 = fix_s(palette.surface1, SAT_BASE),
				surface0 = fix_s(palette.surface0, SAT_BASE),
				base = fix_s(palette.base, SAT_BASE),
				mantle = fix_s(palette.mantle, SAT_BASE),
				crust = fix_s(palette.crust, SAT_BASE),

				-- accent
				-- rosewater = fix_l(palette.rosewater, LN_ACCENT),
				-- flamingo = fix_l(palette.flamingo, LN_ACCENT),
				-- pink = fix_l(palette.pink, LN_ACCENT),
				-- mauve = fix_l(palette.mauve, LN_ACCENT),
				-- red = fix_l(palette.red, LN_ACCENT),
				-- maroon = fix_l(palette.maroon, LN_ACCENT),
				-- peach = fix_l(palette.peach, LN_ACCENT),
				-- yellow = fix_l(palette.yellow, LN_ACCENT),
				-- green = fix_l(palette.green, LN_ACCENT),
				-- teal = fix_l(palette.teal, LN_ACCENT),
				-- sky = fix_l(palette.sky, LN_ACCENT),
				-- sapphire = fix_l(palette.sapphire, LN_ACCENT),
				-- blue = fix_l(palette.blue, LN_ACCENT),
				-- lavender = fix_l(palette.lavender, LN_ACCENT),
			}
		end

		local frappe = require("catppuccin.palettes").get_palette("frappe")
		local macchiato = require("catppuccin.palettes").get_palette("macchiato")
		opts.color_overrides = {
			frappe = fix_palette(frappe),
			macchiato = fix_palette(macchiato),
		}

		require("catppuccin").setup(opts)

		-- vim.cmd.colorscheme("catppuccin-frappe")
	end,
})

table.insert(M, {
	"ellisonleao/gruvbox.nvim",
	config = function()
		require("gruvbox").setup({
			terminal_colors = true, -- add neovim terminal colors
			undercurl = true,
			underline = true,
			bold = true,
			italic = {
				strings = false,
				emphasis = false,
				comments = false,
				operators = false,
				folds = false,
			},
			strikethrough = true,
			invert_selection = false,
			invert_signs = false,
			invert_tabline = false,
			inverse = true, -- invert background for search, diffs, statuslines and errors
			contrast = "", -- can be "hard", "soft" or empty string
			palette_overrides = {
				-- bright_red = "#d64834",
			},
			overrides = {
				SignColumn = { bg = "#282828" },
			},
			dim_inactive = false,
			transparent_mode = false,
		})
	end,
})

table.insert(M, {
	"sainnhe/gruvbox-material",
	config = function()
		vim.cmd.colorscheme("gruvbox-material")
	end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "default",
	callback = function()
		if vim.o.background == "light" then
			vim.api.nvim_set_hl(0, "Normal", { bg = "#F1F0EC" })
			vim.api.nvim_set_hl(0, "NormalNC", { bg = "#F1F0EC" })
			vim.api.nvim_set_hl(0, "StatusLine", { bg = "#EAE7E5" })
			vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#EAE7E5" })
			vim.api.nvim_set_hl(0, "LineNR", { bg = "#EAE7E5" })
			vim.api.nvim_set_hl(0, "cursorLineNr", { bg = "#EAE7E5" })
			vim.api.nvim_set_hl(0, "SignColumn", { bg = "#EAE7E5" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#EAE7E5" })
			vim.api.nvim_set_hl(0, "Pmenu", { bg = "#EAE7E5" })
			-- vim.api.nvim_set_hl(0, "MiniStatuslineInactive", { bg = "#EAE7E5" })
			-- vim.api.nvim_set_hl(0, "MiniStatuslineInactive", { bg = "#DDDBD4" })
		end
	end,
})

for i, _ in ipairs(M) do
	M[i] = vim.tbl_extend("force", M[i], { lazy = false, priority = 1000 })
end

return M