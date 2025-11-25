local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.cmd.colorscheme("habamax")
vim.opt.cmdheight = 0 -- prevent UI flickering
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

vim.loader.enable()

require("lazy").setup("plugins", {
	defaults = { lazy = true },
	install = { colorscheme = { "habamax" } },
	change_detection = { enabled = false },
})

vim.api.nvim_create_autocmd("VimEnter", {
	callback = vim.schedule_wrap(function(data)
		if data.file == "" or vim.fn.isdirectory(data.file) ~= 0 then
			local current_dir = vim.loop.cwd()
			local home_dir = vim.env.HOME

			-- Open FzfLua in standard locations, otherwise use FzfLua
			if current_dir == home_dir or current_dir == "/" then
				vim.cmd("Oil")
			else
				vim.cmd("FzfLua files")
			end
		end
	end),
})