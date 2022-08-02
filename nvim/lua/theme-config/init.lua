-- vim.g.enfocado_style = "neon"
-- vim.cmd([[
-- let g:enfocado_plugins = [
--   \ 'cmp',
--   \ 'lsp',
--   \ 'lsp-installer',
--   \ 'netrw',
--   \ 'packer',
--   \ 'which-key',
--   \ 'rainbow',
--   \ ]
-- 	colorscheme enfocado
-- ]])
local colors = require("catppuccin.palettes").get_palette()
colors.none = "NONE"
vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
require("catppuccin").setup({
	transparent_background = true,
	compile = {
		enabled = true,
		path = vim.fn.stdpath("cache") .. "/catppuccin",
	},
	integrations = {
		lsp_saga = true,
		which_key = true,
		hop = true,
		ts_rainbow = true,
		indent_blankline = {
			colored_indent_levels = true,
		},
	},
	custom_highlights = {
		Comment = { fg = colors.overlay1 },
		LineNr = { fg = colors.overlay1 },
		CursorLine = { bg = colors.none },
		CursorLineNr = { fg = colors.lavender },
		DiagnosticVirtualTextError = { bg = colors.none },
		DiagnosticVirtualTextWarn = { bg = colors.none },
		DiagnosticVirtualTextInfo = { bg = colors.none },
		DiagnosticVirtualTextHint = { bg = colors.none },
	},
})
vim.cmd([[colorscheme catppuccin]])
