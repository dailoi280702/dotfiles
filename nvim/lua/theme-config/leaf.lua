local ok, leaf = pcall(require, "leaf")
if not ok then
	return
end

leaf.setup({
	contrast = "high",
})

vim.cmd.colorscheme("leaf")
