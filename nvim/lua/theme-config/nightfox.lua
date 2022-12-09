local status, nightfox = pcall(require, "nightfox")
if not status then
	return
end

nightfox.setup({
	options = {
		transparent = false,
	},
	palettes = {
		nightfox = {
			bg1 = "#0f141c",
		},
		duskfox = {
			bg1 = "#12111c",
		},
		nordfox = {
			bg1 = "#1b1f26",
			sel0 = "#242c36",
		},
		terafox = {
			bg1 = "#0b1314",
		},
		-- terafox = {
		-- 	bg1 = "#161616",
		-- },
	},
	groups = {
		nordfox = {
			CursorLine = { bg = "#232831" },
		},
	},
})

vim.cmd.colorscheme("terafox")
-- vim.api.nvim_set_hl(0, "CursorLine", { bg = "" })
