local cmp = {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
			"onsails/lspkind.nvim",
    },
} 

cmp.opts = function()
	local cmp = require("cmp")
	local defaults = require("cmp.config.default")()

	return {
		completion = {
			completeopt = "menu,menuone,noinsert",
		},
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		mapping = cmp.mapping.preset.insert({
			["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
			["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-e>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Replace,
				select = true,
			}), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		}),
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			{ name = "path" },
			{ name = "buffer" },
		}),
		window = {
			completion = {
				winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
				col_offset = -3,
				side_padding = 0,
			},
		},
		formatting = {
			fields = { "kind", "abbr", "menu" },
			format = function(entry, vim_item)
				local kind = require("lspkind").cmp_format({ mode = "symbol", maxwidth = 50 })(entry, vim_item)
				local strings = vim.split(kind.kind, "%s", { trimempty = true })
				kind.kind = " " .. (strings[1] or "") .. " "
				return kind
			end,
		},
		experimental = {
			ghost_text = true,
		},
		sorting = defaults.sorting,
	}
end

cmp.config = function(_, opts)
	for _, source in ipairs(opts.sources) do
		source.group_index = source.group_index or 1
	end
	require("cmp").setup(opts)
end

local ls = {
	"L3MON4D3/LuaSnip",
	build = "make install_jsregexp",
	dependencies = {
		"rafamadriz/friendly-snippets",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
}

ls.keys = {
	{
		"<tab>",
		function()
			return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
		end,
		expr = true, silent = true, mode = "i",
	},
	{ "<tab>", function() require("luasnip").jump(1) end, mode = "s" },
	{ "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
}

return { cmp, ls }