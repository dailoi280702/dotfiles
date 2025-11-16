M = {
	"stevearc/oil.nvim",
	event = "VeryLazy",
	cmd = "Oil",
	opts = {
		view_options = {
			show_hidden = true,
		},
		default_file_explorer = true,
	},
}

M.keys = {
	{ "<leader>,", "<cmd>Oil<cr>", desc = "Brow Files" },
}

M.config = function(_, opts)
	require("oil").setup(opts)
end

return M