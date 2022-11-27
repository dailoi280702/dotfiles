local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

lualine.setup({
	options = {
		-- theme = "solarized",
		globalstatus = false,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
	},
})
