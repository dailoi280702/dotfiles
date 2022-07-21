local ok, eslint = pcall(require, "eslint")
if not ok then
	return
end

eslint.setup({
	bin = "eslint_d", -- or `eslint_d`
	code_actions = {
		enable = true,
		apply_on_save = {
			enable = true,
			types = { "problem" }, -- "directive", "problem", "suggestion", "layout"
		},
		disable_rule_comment = {
			enable = true,
			location = "separate_line", -- or `same_line`
		},
	},
	diagnostics = {

		enable = true,
		report_unused_disable_directives = false,
		run_on = "type", -- or `save`
	},
})
