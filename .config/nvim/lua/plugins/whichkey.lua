local M = {
	"folke/which-key.nvim",
	event = "VeryLazy",
}

M.opts = {
	plugins = { spelling = true },
	defaults = {
		mode = { "n", "v" },
		-- ["g"] = { name = "+goto" },
		-- ["gs"] = { name = "+surround" },
		-- ["]"] = { name = "+next" },
		-- ["["] = { name = "+prev" },
		-- ["<leader><tab>"] = { name = "+tabs" },
		-- ["<leader>b"] = { name = "+buffer" },
		-- ["<leader>c"] = { name = "+code" },
		-- ["<leader>f"] = { name = "+file/find" },
		-- ["<leader>g"] = { name = "+git" },
		-- ["<leader>gh"] = { name = "+hunks" },
		-- ["<leader>q"] = { name = "+quit/session" },
		-- ["<leader>s"] = { name = "+search" },
		-- ["<leader>u"] = { name = "+ui" },
		-- ["<leader>w"] = { name = "+windows" },
		-- ["<leader>x"] = { name = "+diagnostics/quickfix" },
		{ "g", group = "+goto" },
		{ "gs", group = "+surround" },
		{ "]", group = "+next" },
		{ "[", group = "+prev" },
		{ "<leader><tab>", group = "+tabs" },
		{ "<leader>b", group = "+buffer" },
		{ "<leader>c", group = "+code" },
		{ "<leader>f", group = "+file/find" },
		{ "<leader>g", group = "+git" },
		{ "<leader>gh", group = "+hunks" },
		{ "<leader>q", group = "+quit/session" },
		{ "<leader>s", group = "+search" },
		{ "<leader>u", group = "+ui" },
		{ "<leader>w", group = "+windows" },
		{ "<leader>x", group = "+diagnostics/quickfix" },
	},
}

M.config = function(_, opts)
	local wk = require("which-key")
	wk.setup(opts)
	-- wk.register(opts.defaults)
	wk.add(opts.defaults)
end

return M