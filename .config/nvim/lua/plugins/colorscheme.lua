local M = {}

table.insert(M, {
	"zenbones-theme/zenbones.nvim",
	dependencies = "rktjmp/lush.nvim",
	enabled = false,
})

table.insert(M, {
	"cocopon/iceberg.vim",
	enabled = false,
	config = function()
		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "iceberg",
			callback = function()
				local second_bg = "#1F2132"

				local hl_grs = {
					"Pmenu",
					"NormalFloat",
					"StatusLine",
					"StatusLineNC",
				}

				for _, name in ipairs(hl_grs) do
					vim.api.nvim_set_hl(0, name, { bg = second_bg })
				end

				vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#6B7089", fg = "#1F2132" })
			end,
		})
	end,
})

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

table.insert(M, { "y9san9/y9nika.nvim", enabled = false })
table.insert(M, { "anttikivi/lucid.nvim", enabled = false })
table.insert(M, { "folksoftware/nvim", enabled = false })
table.insert(M, { "p00f/alabaster.nvim", enabled = false })

table.insert(M, {
	"savq/melange-nvim",
	config = function()
		-- vim.cmd.colorscheme("melange")
	end,
})

table.insert(M, {
	"catppuccin/nvim",
	name = "catppuccin",
	opts = {
		-- transparent_background = true,
		highlight_overrides = {
			frappe = function(frappe)
				return {
					StatusLine = { bg = frappe.base },
					StatusLineNC = { bg = frappe.base },
					MiniStatuslineFilename = { bg = frappe.sky, fg = frappe.base },
					MiniStatuslineFileinfo = { bg = frappe.sapphire, fg = frappe.base },
					MiniStatuslineDevinfo = { bg = frappe.teal, fg = frappe.base },
				}
			end,
		},
	},
	config = function(_, opts)
		require("catppuccin").setup(opts)
		vim.cmd.colorscheme("catppuccin-frappe")
	end,
})

table.insert(M, {
	"metalelf0/black-metal-theme-neovim",
	enabled = false,
	opts = { transparent = true },
	config = function(_, opts)
		require("black-metal").setup(opts)
		-- vim.cmd.colorscheme("emperor")
	end,
})

table.insert(M, {
	"sainnhe/everforest",
	config = function()
		vim.g.everforest_background = "hard"
		-- vim.cmd.colorscheme("everforest")
	end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "y9nika,lucid,alabaster,folk-mandragola,default",
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