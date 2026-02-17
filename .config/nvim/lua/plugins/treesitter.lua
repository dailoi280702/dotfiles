local M = {}

table.insert(M, {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
	-- dependencies = { "nvim-treesitter/nvim-treesitter-context" },
	cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
	opts = {
		highlight = {
			enable = true,
			-- disable = { "go", "lua", "sql" },
		},
		indent = { enable = true },
		auto_install = true,
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
		-- require("treesitter-context").setup({
		-- 	max_lines = 1,
		-- 	min_window_height = 20,
		-- 	multiline_threshold = 1,
		-- })
	end,
})

return M