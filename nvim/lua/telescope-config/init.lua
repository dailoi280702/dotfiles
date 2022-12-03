local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

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

require("telescope").load_extension("file_browser")
