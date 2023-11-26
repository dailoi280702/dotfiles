local M = {
	"nvimdev/guard.nvim",
	event = { "BufReadPost", "BufNewFile", "BufWritePre" },
	dependencies = { "nvimdev/guard-collection" },
}

M.config = function()
	local ft = require("guard.filetype")

	ft("python"):fmt("black")
	ft("lua"):fmt("stylua")
	ft("go"):fmt({ cmd = "gofumpt", stdin = true, args = {} })
	ft(
		"javascript,javascriptreact,typescript,typescriptreact,vue,css,scss,less,html,json,jsonc,yaml,markdown,markdown.mdx,graphql,handlebars"
	):fmt("prettier")
	ft("rust"):fmt("rustfmt")

	require("guard").setup({
		fmt_on_save = true,
		lsp_as_default_formatter = true,
	})
end

return M