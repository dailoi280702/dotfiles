local M = {
	"nvimdev/guard.nvim",
	event = { "BufReadPost", "BufNewFile", "BufWritePre" },
	dependencies = { "nvimdev/guard-collection" },
}

M.config = function()
	local ft = require("guard.filetype")

	ft("python"):fmt("black")

	ft("lua"):fmt("stylua")

	ft("go"):fmt({ cmd = "gofumpt", stdin = true, args = {} }):lint({
		cmd = "golangci-lint",
		args = { "run", "--fix=false", "--no-config" },
		fname = true,
		parse = function(result, bufnr)
			local lint = require("guard.lint")
			local diags = {}

			if result == "" then
				return diags
			end
			result = vim.json.decode(result)

			local issues = result.Issues
			if issues == nil or type(issues) == "userdata" then
				return diags
			end
			if type(issues) == "table" then
				for _, d in ipairs(issues) do
					table.insert(
						diags,
						lint.diag_fmt(
							bufnr,
							d.Pos.Line > 0 and d.Pos.Line - 1 or 0,
							d.Pos.Column > 0 and d.Pos.Column - 1 or 0,
							d.Text,
							severities[d.Severity] or lint.severities.warning,
							string.format("golangci-lint: %s", d.FromLinter)
						)
					)
				end
			end

			return diags
		end,
	})

	ft(
		"javascript,javascriptreact,typescript,typescriptreact,vue,css,scss,less,html,json,jsonc,yaml,markdown,markdown.mdx,graphql,handlebars"
	):fmt("prettier")

	ft("rust"):fmt("rustfmt")

	ft("*"):lint("codespell")

	vim.g.guard_config = {
		fmt_on_save = true,
		lsp_as_default_formatter = true,
		auto_lint = true,
		lint_interval = 300,
		refresh_diagnostic = true,
	}
end

return M