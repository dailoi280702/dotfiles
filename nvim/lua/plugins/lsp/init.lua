return {
	"neovim/nvim-lspconfig",
	name = "lsp",
	event = "BufReadPre",
	dependencies = { "hrsh7th/cmp-nvim-lsp" },
	opts = {
		servers = {
			tsserver = {},
			cssls = {},
			html = {},
			eslint = {},
			ltex = {},
			tailwindcss = {},
			gopls = {},
			sumneko_lua = {
				settings = {
					Lua = {
						workspace = {
							checkThirdParty = false,
						},
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			},
			rust_analyzer = {},
		},
	},
	config = function(_, opts)
		require("mason")
		require("plugins.lsp.diagnostics").setup()

		local function on_attach(client, bufnr)
			require("plugins.lsp.formatting").setup(client, bufnr)
		end

		local servers = opts.servers

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
		capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		}

		local options = {
			on_attach = on_attach,
			capabilities = capabilities,
			flags = {
				debounce_text_changes = 150,
			},
		}

		for server, server_opts in pairs(servers) do
			server_opts = vim.tbl_deep_extend("force", {}, options, server_opts or {})
			require("lspconfig")[server].setup(server_opts)
		end

		require("plugins.null-ls").setup(options)
	end,
}
