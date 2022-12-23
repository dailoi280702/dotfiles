require("options")
require("plugins_manager")

vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		require("mappings")
	end,
})
