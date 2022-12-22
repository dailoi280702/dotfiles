local M = {
	"jose-elias-alvarez/null-ls.nvim",
}

function M.setup(options)
	local nls = require("null-ls")

	local formatting = nls.builtins.formatting
	local diagnostics = nls.builtins.diagnostics
	local code_actions = nls.builtins.code_actions

	local formatting_sources = {
		formatting.stylua,
		-- formatting.prettierd.with({
		-- 	extra_filetypes = { "toml", "solidity" },
		-- 	-- extra_args = { "--single-quote", "--jsx-single-quote" },
		-- }),
		formatting.fixjson,
		diagnostics.selene,
		-- diagnostics.eslint_d.with({
		-- 	diagnostics_format = "[eslint] #{m}\n(#{c})",
		-- }),
		-- diagnostics.eslint,
		formatting.prettierd,
		diagnostics.eslint_d,
		code_actions.eslint_d,
		diagnostics.golangci_lint,
		formatting.gofumpt,
	}

	nls.setup({
		sources = formatting_sources,
		on_attach = options.on_attach,
	})
end

function M.has_formatter(ft)
	local sources = require("null-ls.sources")
	local available = sources.get_available(ft, "NULL_LS_FORMATTING")
	return #available > 0
end

return M
