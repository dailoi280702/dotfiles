vim.loader.enable()

-- As per lazy's install instructions
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

-- Bootstap hotpot into lazy plugin dir if it does not exist yet.
local hotpotpath = vim.fn.stdpath("data") .. "/lazy/hotpot.nvim"
if not vim.loop.fs_stat(hotpotpath) then
	vim.notify("Bootstrapping hotpot.nvim...", vim.log.levels.INFO)
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		-- You may with to pin a known version tag with `--branch vX.Y.Z`
		"https://github.com/rktjmp/hotpot.nvim.git",
		hotpotpath,
	})
end

-- As per lazy's install instructions, but insert hotpots path at the front
vim.opt.runtimepath:prepend({ hotpotpath, lazypath })

local default_providers = {
	"node",
	"perl",
	"ruby",
}

for _, provider in ipairs(default_providers) do
	vim.g["loaded_" .. provider .. "_provider"] = 0
end

-- load hotpot
require("hotpot").setup({
	provide_require_fennel = true,
})
require("core")

local plugins = require("modules")

table.insert(plugins, {
	"rktjmp/hotpot.nvim",
	lazy = false,
})

-- load lazy
require("lazy").setup(plugins, {
	defaults = { lazy = true },
	install = { colorscheme = { "oxocarbon", "habamax" }, missing = true },
	performance = {
		rtp = {
			disabled_plugins = {
				"2html_plugin",
				"getscript",
				"getscriptPlugin",
				"gzip",
				"logipat",
				"netrw",
				"netrwPlugin",
				"netrwSettings",
				"netrwFileHandlers",
				"matchit",
				"tar",
				"tarPlugin",
				"rrhelper",
				"spellfile_plugin",
				"vimball",
				"vimballPlugin",
				"zip",
				"zipPlugin",
				"tutor",
				"rplugin",
				"syntax",
				"synmenu",
				"optwin",
				"compiler",
				"bugreport",
				"ftplugin",
			},
		},
	},
})

vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		require("keybinds")
	end,
})
