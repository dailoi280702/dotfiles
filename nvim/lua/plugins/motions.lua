local M = {}

table.insert(M, {
	"echasnovski/mini.surround",
	event = { "BufReadPost", "BufNewFile", "BufWritePre" },
	opts = {
		mappings = {
			add = "gza", -- Add surrounding in Normal and Visual modes
			delete = "gzd", -- Delete surrounding
			find = "gzf", -- Find surrounding (to the right)
			find_left = "gzF", -- Find surrounding (to the left)
			highlight = "gzh", -- Highlight surrounding
			replace = "gzr", -- Replace surrounding
			update_n_lines = "gzn", -- Update `n_lines`
		},
	},
})

table.insert(M, {
	"echasnovski/mini.pairs",
	event = "VeryLazy",
	opts = {},
})

table.insert(M, {
	"echasnovski/mini.ai",
	opts = {},
	keys = {
	  { "a", mode = { "x", "o" } },
	  { "i", mode = { "x", "o" } },
	},
})

table.insert(M, {
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = true,
    opts = {
      enable_autocmd = false,
    },
  },
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    opts = {
      options = {
        custom_commentstring = function()
          return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
        end,
      },
    },
  },
})

local hop = {
	"phaazon/hop.nvim",
	event = { "BufReadPost", "BufNewFile", "BufWritePre" },
	cmd = { "HopWord", "HopWordMW", "HopLine", "HopLineMW" },
	opts = {}
}

hop.keys = {
	{ "<leader>jj", "<cmd>HopWord<CR>", desc = "Jump to word"},
	{ "<leader>jk", "<cmd>HopWordMW<CR>", desc = "Jump to word in all panes"},
	{ "<leader>jl", "<cmd>HopLine<CR>", desc = "jump to line"},
	{ "<leader>jk", "<cmd>HopLineMW<CR>", desc = "Jump to line in all panes"},
}

table.insert(M, hop)

return M