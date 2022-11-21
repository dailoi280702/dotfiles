require("nightfox").setup({
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
		},
		terafox = {
			bg1 = "#0b1314",
		},
	},
})

vim.cmd.colorscheme("duskfox")
