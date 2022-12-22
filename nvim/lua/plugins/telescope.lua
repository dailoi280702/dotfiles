local M = {
  "nvim-telescope/telescope.nvim",
  cmd = { "Telescope" },

  dependencies = {
			{ "nvim-lua/plenary.nvim"},
			{ "nvim-lua/popup.nvim"},
			{"nvim-telescope/telescope-file-browser.nvim"},
  },
}

function M.config()
	local telescope = require("telescope")

	local custom = {
		previewer = false,
		theme = "dropdown",
	}

	telescope.setup({
		pickers = {
			find_files = custom,
			buffers = custom,
			live_grep = custom,
			grep_string = custom,
		},
		extensions = {
			file_browser = custom,
		},
		mappings = {
			i = {
				["<cr>"] = function(bufnr)
					require("telescope.actions.set").edit(bufnr, "tab drop")
				end,
			},
		},
	})

	telescope.load_extension("file_browser")
end

return M
