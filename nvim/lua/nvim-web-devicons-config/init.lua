local web_devicons_ok, web_devicons = pcall(require, "nvim-web-devicons")
if not web_devicons_ok then
	return
end

local material_icon_ok, material_icon = pcall(require, "nvim-material-icon")
if not material_icon then
	return
end

require("nvim-web-devicons").setup({
	override = require("nvim-material-icon").get_icons(),
})
