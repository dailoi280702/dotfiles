local M = {
	"nyoom-engineering/oxocarbon.nvim",
	lazy = false,
	priority = 1000,
}

M.init = function()
	vim.api.nvim_create_autocmd({ "ColorScheme" }, {
		callback = function()
			local C = require("util.color")
			-- local hsluv = require("util.hsluv")
			-- :TODO dim the foreground colors
			local hl_groups = vim.api.nvim_get_hl(0, {})
			for name, spec in pairs(hl_groups) do
				if spec.fg then
					local fg = "#" .. string.format("%06x", spec.fg)
					spec.fg = C.shift_hsl(fg, {
						h = 0,
						s = -10,
						l = -5,
					})

					vim.api.nvim_set_hl(0, name, spec)
				end
			end
		end,
	})

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
				default = function()
					vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
				end,
				wildcharm = function()
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
			vim.cmd.colorscheme("rose-pine-dawn")
		end,
	},
	-- {
	-- 	"catppuccin/nvim",
	-- 	priority = 1000,
	-- 	lazy = false,
	-- 	opts = {
	-- 		no_italic = true,
	-- 	},
	-- 	config = function(_, opts)
	-- 		require("catppuccin").setup(opts)
	-- 		-- vim.cmd.colorscheme("catppuccin-frappe")
	-- 	end,
	-- },
}