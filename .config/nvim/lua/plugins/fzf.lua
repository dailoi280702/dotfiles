M = {
	"ibhagwan/fzf-lua",
	event = "VeryLazy",
	cmd = "FzfLua",
}

M.opts = {
	winopts = {
		treesitter = {
			enabled = false,
		},
	},

	previewers = {
		builtin = {
			treesitter = {
				enabled = false,
			},
		},
	},
}

M.keys = {
	{ "<leader>.", "<cmd>FzfLua files<cr>", desc = "Find Files" },
	{ "<leader><tab>", "<cmd>FzfLua buffers<cr>", desc = "Buffers" },
	{ "<leader>/", "<cmd>FzfLua live_grep<cr>", desc = "Grep" },
	{ "<leader>'", "<cmd>FzfLua resume<cr>", desc = "Resume search" },
}

return M