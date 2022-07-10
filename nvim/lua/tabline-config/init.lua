local status_ok, tabline = pcall(require, "tabline")
if not status_ok then
	return
end

tabline.setup({
	options = {
		max_bufferline_percent = 100, -- set to nil by default, and it uses vim.o.columns * 2/3
		modified_icon = "+ ", -- change the default modified icon
	},
})

vim.cmd([[
  set guioptions-=e " Use showtabline in gui vim
  set sessionoptions+=tabpages,globals " store tabpages and globals in session
]])
