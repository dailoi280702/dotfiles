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
			-- local current_dir = vim.loop.cwd()
			-- local home_dir = vim.env.HOME
			--
			-- -- Open FzfLua in standard locations, otherwise use Oil
			-- if home_dir ~= current_dir and current_dir:find(home_dir, 1, true) == 1 then
			-- 	vim.cmd("FzfLua files")
			-- else
			-- 	vim.cmd("Oil")
			-- end

			vim.cmd("Oil")
		end
	end),
})