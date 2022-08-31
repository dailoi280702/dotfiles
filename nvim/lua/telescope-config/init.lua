local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

telescope.setup()

require("telescope").load_extension("file_browser")
