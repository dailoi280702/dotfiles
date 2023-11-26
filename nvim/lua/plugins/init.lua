local group = vim.api.nvim_create_augroup("LazyVim", { clear = true })
vim.api.nvim_create_autocmd("User", {
	group = group,
	pattern = "VeryLazy",
	callback = function()
		require("config.keymaps")
	end,
})

return {
	{
		"folke/lazy.nvim", 
		version = "*",
		init = function()
			require("config.options")
		end
	}
}
 