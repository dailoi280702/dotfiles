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
				-- vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
				-- vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
				-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
				vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
				vim.api.nvim_set_hl(0, "Folded", { bg = "NONE" })
				vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
				vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })
				vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = "#808080" })
				vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = "#808080" })
				vim.api.nvim_set_hl(0, "@punctuation.special", { fg = "#808080" })
			end,
		}

		vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })

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
	-- vim.cmd.colorscheme("oxocarbon")
end

local plugins = {
	M,
	{
		"ellisonleao/gruvbox.nvim",
		opts = {
			bold = true,
			italic = {
				strings = false,
				emphasis = false,
				comments = false,
				operators = false,
				folds = false,
			},
			-- transparent_mode = true,
			-- contrast = "hard",
			overrides = {
				SignColumn = { link = "LineNr" },
			},
		},
		config = function(_, opts)
			require("gruvbox").setup(opts)
			-- vim.opt.background = "light"
			-- vim.cmd.colorscheme("gruvbox")
		end,
	},

	{
		"zenbones-theme/zenbones.nvim",
		dependencies = "rktjmp/lush.nvim",
		config = function()
			-- vim.api.nvim_create_autocmd({ "ColorScheme" }, {
			-- 	pattern = { "zenwritten", "zenbones" },
			-- 	callback = function()
			-- 		local disable_italic = function(hl)
			-- 			vim.api.nvim_set_hl(
			-- 				0,
			-- 				hl,
			-- 				vim.tbl_extend(
			-- 					"keep",
			-- 					{ bold = false, italic = false },
			-- 					vim.api.nvim_get_hl(0, { name = hl, link = false })
			-- 				)
			-- 			)
			-- 		end
			-- 		disable_italic("Comment")
			-- 		disable_italic("Number")
			-- 		disable_italic("Constant")
			-- 		disable_italic("Boolean")
			--
			-- 		vim.api.nvim_set_hl(0, "Folded", { bg = "none" })
			-- 	end,
			-- })
		end,
	},

	{
		"projekt0n/github-nvim-theme",
		opts = {
			options = {
				transparent = true,
			},
		},
		config = function(_, opts)
			require("github-theme").setup(opts)
		end,
	},

	{
		"NLKNguyen/papercolor-theme",
		config = function()
			vim.cmd.colorscheme("PaperColor")
		end,
	},
}

for i, _ in ipairs(plugins) do
	plugins[i] = vim.tbl_extend("force", plugins[i], { lazy = false, priority = 1000 })
end

return plugins