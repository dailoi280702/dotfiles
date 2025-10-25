local plugins = {
	{
		"zenbones-theme/zenbones.nvim",
		dependencies = "rktjmp/lush.nvim",
	},

	{
		"projekt0n/github-nvim-theme",
		opts = {
			options = {
				transparent = true,
			},
		},
		config = function(_, opts)
			require("github-theme").setup(opts)
		end,
	},

	{
		"NLKNguyen/papercolor-theme",
		config = function()
			vim.cmd.colorscheme("PaperColor")
		end,
	},

	{ "Mofiqul/adwaita.nvim" },
}

for i, _ in ipairs(plugins) do
	plugins[i] = vim.tbl_extend("force", plugins[i], { lazy = false, priority = 1000 })
end

return plugins