-- vim.o.shortmess = vim.o.shortmess .. "c"
-- vim.g.did_load_filetypes = 0
vim.o.hidden = true
vim.o.whichwrap = "b,s,<,>,[,],h,l"
-- vim.o.pumheight = 10
-- vim.o.pumblend = 10
vim.o.fileencoding = "utf-8"
vim.o.cmdheight = 1
vim.o.splitbelow = true
vim.o.splitright = true
vim.opt.termguicolors = true
vim.o.conceallevel = 0
vim.o.showmode = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.timeoutlen = 250
vim.o.clipboard = "unnamedplus"
vim.o.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.o.scrolloff = 10
vim.o.sidescrolloff = 10
vim.o.mouse = "n"
vim.o.mousemodel = "extend"
vim.wo.number = true
-- vim.wo.relativenumber = true
vim.o.cursorline = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.autoindent = true
vim.o.signcolumn = "yes"
vim.o.wrap = false
vim.o.lazyredraw = true
vim.g.mapleader = " "
vim.g.completeopt = "menu,menuone,noselect,noinsert"
vim.cmd([[hi PmenuSel blend=0]])
vim.g.ts_highlight_lua = true
vim.o.background = "dark"
vim.o.bri = true

-- disable default plugins
local builtins = {
	"gzip",
	"zip",
	"zipPlugin",
	"fzf",
	"tar",
	"tarPlugin",
	"getscript",
	"getscriptPlugin",
	"vimball",
	"vimballPlugin",
	"2html_plugin",
	"matchit",
	"matchparen",
	"logiPat",
	"rrhelper",
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
}

for _, plugin in ipairs(builtins) do
	vim.g["loaded_" .. plugin] = 1
end
