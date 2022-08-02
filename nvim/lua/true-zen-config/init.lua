require("true-zen").setup({
	narrow = {
		--- change the style of the fold lines. Set it to:
		--- `informative`: to get nice pre-baked folds
		--- `invisible`: hide them
		--- function() end: pass a custom func with your fold lines. See :h foldtext
		folds_style = "informative",
		run_ataraxis = false, -- display narrowed text in a Ataraxis session
		open_callback = nil, -- run a function when opening Narrow mode
		close_callback = nil, -- run a function when closing Narrow mode
	},
})
