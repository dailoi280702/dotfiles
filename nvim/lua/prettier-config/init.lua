local status_ok, prettier = pcall(require, "prettier")
if not status_ok then
	return
end

prettier.setup({
	bin = "prettierd", -- or `prettierd`
	filetypes = {
		"css",
		"graphql",
		"html",
		"javascript",
		"javascriptreact",
		"json",
		"less",
		"markdown",
		"scss",
		"typescript",
		"typescriptreact",
		"yaml",
	},
})
