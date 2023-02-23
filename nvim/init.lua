local plugins_path = vim.fn.stdpath("data") .. "/lazy"
local lazy_path = plugins_path .. "/lazy.nvim"
local hotpot_path = plugins_path .. "/hotpot.nvim"

-- bootstrap lazy.nvim
if not vim.loop.fs_stat(lazy_path) then
	vim.notify("Could not find lazy.nvim, cloning new copy to " .. lazy_path, vim.log.levels.INFO)
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazy_path,
	})
end

-- bootstrap hotpot.nvim
if not vim.loop.fs_stat(hotpot_path) then
	vim.notify("Could not find hotpot.nvim, cloning new copy to " .. hotpot_path, vim.log.levels.INFO)
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/rktjmp/hotpot.nvim.git",
		hotpot_path,
	})
end

local default_providers = {
	"node",
	"perl",
	"ruby",
}

for _, provider in ipairs(default_providers) do
	vim.g["loaded_" .. provider .. "_provider"] = 0
end

vim.opt.rtp:prepend(lazy_path)
vim.opt.rtp:prepend(hotpot_path)

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
