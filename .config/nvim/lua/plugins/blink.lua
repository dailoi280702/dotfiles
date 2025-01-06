local blink = {
	"saghen/blink.cmp",
	dependencies = "rafamadriz/friendly-snippets",
	opts = {
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},

		fuzzy = {
			prebuilt_binaries = {
				download = true,
				force_version = "v0.9.2",
			},
		},

		signature = {
			enabled = true,
		},

		completion = {
			list = {
				selection = function(ctx)
					return ctx.mode == "cmdline" and "auto_insert" or "preselect"
				end,
			},

			documentation = {
				auto_show = true,
				auto_show_delay_ms = 100,
			},

			ghost_text = {
				enabled = true,
			},
		},
	},
	opts_extend = { "sources.default" },
}

blink.opts.keymap = {
	["<CR>"] = {
		function(cmp)
			if cmp.snippet_active() then
				return cmp.accept()
			else
				return cmp.select_and_accept()
			end
		end,
		"snippet_forward",
		"fallback",
	},

	["<S-Tab>"] = { "select_prev", "fallback" },
	["<Tab>"] = { "select_next", "fallback" },

	cmdline = {
		["<S-Tab>"] = { "select_prev", "fallback" },
		["<Tab>"] = { "select_next", "fallback" },
		["<CR>"] = { "accept", "fallback" },
	},
}

return blink