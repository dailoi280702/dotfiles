return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	-- event = "BufReadPost",
	---@type TSConfig
	-- opts = {
	-- },
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = "all",
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
			autotag = {
				enable = true,
			},
			autopairs = {
				enable = true,
			},
		})
	end,
}
