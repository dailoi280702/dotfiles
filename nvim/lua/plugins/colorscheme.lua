local M = {
	"nyoom-engineering/oxocarbon.nvim",
	lazy = false,
	priority = 1000,
}

M.init = function()
	-- vim.api.nvim_create_autocmd({ "ColorSchemePre" }, { callback = function() vim.cmd([[hi clear]])
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
					vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
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
	vim.cmd.colorscheme("wildcharm")
end

return {
	M,
	{
		"Mofiqul/vscode.nvim",
		lazy = false,
		priority = 999,
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
			require("solarized").setup(opts)
			-- vim.cmd.colorscheme("solarized")
		end,
	},
}