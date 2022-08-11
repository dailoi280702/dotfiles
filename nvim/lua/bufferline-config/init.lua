local ok, bufferline = pcall(require, "bufferline")

if not ok then
	return
end

bufferline.setup({
	animation = false,
	auto_hide = true,
	maximum_padding = 10000,
	tabpages = false,
	closable = false,
})
