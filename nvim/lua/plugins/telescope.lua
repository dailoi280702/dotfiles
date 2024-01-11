local M = {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},
	cmd = "Telescope",
}

M.keys = {
	{ "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Grep" },
	{ "<leader><tab>", "<cmd>Telescope buffers<cr>", desc = "Brow Files" },
	{ "<leader>,", "<cmd>Telescope file_browser hidden=true<cr>", desc = "Brow Files" },
	{ "<leader>.", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
	{ "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
}

M.opts = {
	extensions = {
		fzf = {
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			fuzzy = true, -- false will only do exact matching
			override_file_sorter = true, -- override the file sorter
			override_generic_sorter = true, -- override the generic sorter
		},
	},
	defaults = {
		dynamic_preview_title = true,
		entry_prefix = "  ",
		layout_config = {
			horizontal = {
				preview_width = 0.5,
				prompt_position = "top",
			},
			vertical = {
				mirror = false,
				prompt_position = "top",
			},
		},
		layout_stragery = "flex",
		prompt_prefix = "   ",
		selection_caret = "  ",
		sorting_strategy = "ascending",
	},
}

M.config = function(_, opts)
	local telescope = require("telescope")

	telescope.setup(opts)
	telescope.load_extension("fzf")
	telescope.load_extension("file_browser")
end

return M