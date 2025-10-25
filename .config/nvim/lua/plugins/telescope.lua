local M = {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
	},
	cmd = "Telescope",
}

M.keys = {
	{ "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Grep" },
	{ "<leader><tab>", "<cmd>Telescope buffers<cr>", desc = "Brow Files" },
	{ "<leader>,", "<cmd>Telescope file_browser hidden=true<cr>", desc = "Brow Files" },
	{ "<leader>.", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
	{ "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
	{ "<leader>'", "<cmd>Telescope resume<cr>", desc = "Resume search" },
}

M.opts = {
	defaults = {
		dynamic_preview_title = true,
		layout_config = {
			horizontal = {
				prompt_position = "top",
			},
			vertical = {
				prompt_position = "top",
			},
		},
		layout_stragery = "flex",
		sorting_strategy = "ascending",
		preview = {
			treesitter = false,
		},
	},
}

M.config = function(_, opts)
	local telescope = require("telescope")

	telescope.setup(opts)
	telescope.load_extension("file_browser")
end

return M