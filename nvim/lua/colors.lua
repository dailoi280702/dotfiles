local M = {}

M.setup = function(scheme)
	M[scheme]()
end

function M:oxocarbon()
	require("oxocarbon")
	vim.api.nvim_set_hl(0, "StatusLine", { bg = "#161616" })
	vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#161616", fg = "#161616" })
	vim.api.nvim_set_hl(0, "HopNextKey", { fg = "#be95ff", bold = true })
	vim.api.nvim_set_hl(0, "HopNextKey1", { fg = "#ff7eb6", bold = true })
	vim.api.nvim_set_hl(0, "HopNextKey2", { fg = "#ee5396" })
end

function M:catppuccin()
	vim.g.background = "light"
	require("catppuccin").setup({
		-- flavour = "macchiato",
		integrations = {
			hop = true,
			mini = true,
			which_key = true,
		},
		highlight_overrides = {
			all = function(colors)
				return {
					CmpItemKindSnippet = { bg = colors.mauve, fg = colors.surface0 },
					CmpItemKindKeyword = { bg = colors.red, fg = colors.surface0 },
					CmpItemKindText = { bg = colors.teal, fg = colors.surface0 },
					CmpItemKindMethod = { bg = colors.blue, fg = colors.surface0 },
					CmpItemKindConstructor = { bg = colors.blue, fg = colors.surface0 },
					CmpItemKindFunction = { bg = colors.blue, fg = colors.surface0 },
					CmpItemKindFolder = { bg = colors.blue, fg = colors.surface0 },
					CmpItemKindModule = { bg = colors.blue, fg = colors.surface0 },
					CmpItemKindConstant = { bg = colors.peach, fg = colors.surface0 },
					CmpItemKindField = { bg = colors.green, fg = colors.surface0 },
					CmpItemKindProperty = { bg = colors.green, fg = colors.surface0 },
					CmpItemKindEnum = { bg = colors.green, fg = colors.surface0 },
					CmpItemKindUnit = { bg = colors.green, fg = colors.surface0 },
					CmpItemKindClass = { bg = colors.yellow, fg = colors.surface0 },
					CmpItemKindVariable = { bg = colors.flamingo, fg = colors.surface0 },
					CmpItemKindFile = { bg = colors.blue, fg = colors.surface0 },
					CmpItemKindInterface = { bg = colors.yellow, fg = colors.surface0 },
					CmpItemKindColor = { bg = colors.red, fg = colors.surface0 },
					CmpItemKindReference = { bg = colors.red, fg = colors.surface0 },
					CmpItemKindEnumMember = { bg = colors.red, fg = colors.surface0 },
					CmpItemKindStruct = { bg = colors.blue, fg = colors.surface0 },
					CmpItemKindValue = { bg = colors.peach, fg = colors.surface0 },
					CmpItemKindEvent = { bg = colors.blue, fg = colors.surface0 },
					CmpItemKindOperator = { bg = colors.blue, fg = colors.surface0 },
					CmpItemKindTypeParameter = { bg = colors.blue, fg = colors.surface0 },
					CmpItemKindCopilot = { bg = colors.teal, fg = colors.surface0 },
					-- ["@function"] = { style = { "bold" }, fg = colors.sapphire },
					-- ["@method"] = { fg = colors.sapphire },
				}
			end,
		},
	})

	vim.cmd.colorscheme("catppuccin")
	-- vim.api.nvim_set_hl(0, "@function", { bold = true })
end

function M:nightfox()
	require("nightfox").setup({
		options = {
			styles = {
				comments = "italic",
			},
		},
		palettes = {
			nordfox = {
				bg1 = "#1b1f26",
				sel0 = "#242c36",
			},
		},
		groups = {
			nordfox = {
				CursorLine = { bg = "#232831" },
			},
		},
	})
	vim.cmd.colorscheme("carbonfox")
end

function M:onedarkpro()
	require("onedarkpro").setup({
		plugins = {
			gitsigns = true,
			hop = true,
			lsp_saga = true,
			nvim_cmp = true,
			nvim_ts_rainbow = true,
			telescope = true,
			treesitter = true,
			which_key = true,
		},
		styles = {
			comments = "italic",
			functions = "bold",
			virtual_text = "italic",
		},
		options = {
			transparency = true,
		},
	})
	vim.cmd.colorscheme("onedark_dark")
end

function M:tokio()
	local tokyonight = require("tokyonight")
	tokyonight.setup({
		style = "night",
		transparent = true,
		on_highlights = function(hl, c)
			hl.CursorLineNr = { fg = c.orange, bold = true }

			if true then
				local prompt = "#2d3149"
				hl.TelescopeNormal = {
					bg = c.bg_dark,
					fg = c.fg_dark,
				}
				hl.TelescopeBorder = {
					bg = c.bg_dark,
					fg = c.bg_dark,
				}
				hl.TelescopePromptNormal = {
					bg = prompt,
				}
				hl.TelescopePromptBorder = {
					bg = prompt,
					fg = prompt,
				}
				hl.TelescopePromptTitle = {
					bg = c.fg_gutter,
					fg = c.orange,
				}
				hl.TelescopePreviewTitle = {
					bg = c.bg_dark,
					fg = c.bg_dark,
				}
				hl.TelescopeResultsTitle = {
					bg = c.bg_dark,
					fg = c.bg_dark,
				}
			end
		end,
	})
	tokyonight.load()
end

return M
