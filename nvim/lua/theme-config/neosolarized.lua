local ok, neosolarized = pcall(require, "neosolarized")
if not ok then
	return
end

neosolarized.setup({})
