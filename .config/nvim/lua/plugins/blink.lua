local v = "v1.3.1"

local blink = {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"Kaiser-Yang/blink-cmp-avante",
	},
	event = "InsertEnter",
	version = v,
	opts = {
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
			kind_icons = {
				AvanteCmd = " ",
				AvanteMention = " ",
			},
		},

		sources = {
			default = { "avante", "lsp", "path", "snippets", "buffer" },
			providers = {
				avante = {
					module = "blink-cmp-avante",
					name = "Avante",
					opts = {
						-- options for blink-cmp-avante
						--
					},
					-- command = {
					-- 	get_kind_name = function(_)
					-- 		return "AvanteCmd"
					-- 	end,
					-- },
					-- mention = {
					-- 	get_kind_name = function(_)
					-- 		return "AvanteMention"
					-- 	end,
					-- },
				},
			},
		},

		fuzzy = {
			prebuilt_binaries = {
				download = true,
				force_version = v,
			},
		},

		signature = {
			enabled = true,
		},

		completion = {
			list = {
				selection = {
					auto_insert = true,

					preselect = function(ctx)
						return ctx.mode ~= "cmdline" and not require("blink.cmp").snippet_active({ direction = 1 })
					end,
				},
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
	config = function(_, opts)
		require("blink.cmp").setup(opts)
	end,
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

	-- cmdline = {
	-- 	["<S-Tab>"] = { "select_prev", "fallback" },
	-- 	["<Tab>"] = { "select_next", "fallback" },
	-- 	["<CR>"] = { "accept", "fallback" },
	-- },
}

return blink