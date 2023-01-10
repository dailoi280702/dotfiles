local M = {
	"catppuccin/nvim",
	lazy = false,
	priority = 1000,
}

function M.config()
	require("catppuccin").setup({
		-- flavor = "macchiato",
		-- transparent_background = true,
		integrations = {
			hop = true,
			lsp_saga = true,
			mini = true,
			ts_rainbow = true,
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
				}
			end,
		},
	})

	vim.cmd.colorscheme("catppuccin")
end

return M
