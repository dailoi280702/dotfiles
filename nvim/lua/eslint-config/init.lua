local ok, eslint = pcall(require, "eslint")
if not ok then
	return
end

eslint.setup({
	bin = "eslint_d", -- or `eslint_d`
})
