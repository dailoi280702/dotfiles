local ok, colorizer = pcall(require, "colorizer")

if not ok then
	return
end

colorizer.setup({
	user_default_options = {
		tailwind = true,
	},
})
