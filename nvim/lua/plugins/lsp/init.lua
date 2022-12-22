local M = {
	"neovim/nvim-lspconfig",
	name = "lsp",
	event = "BufReadPre",
	dependencies = { "hrsh7th/cmp-nvim-lsp" },
}

function M.config()
	require("mason")
	require("plugins.lsp.diagnostics").setup()

	local function on_attach(client, bufnr)
		require("plugins.lsp.formatting").setup(client, bufnr)
	end

	local servers = {
		tsserver = {},
		cssls = {},
		html = {},
		eslint = {},
		ltex = {},
		tailwindcss = {},
		gopls = {},
		sumneko_lua = {},
	}

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

	for server, opts in pairs(servers) do
		opts = vim.tbl_deep_extend("force", {}, options, opts or {})
		-- if server == "tsserver" then
		-- require("typescript").setup({ server = opts })
		-- else
		require("lspconfig")[server].setup(opts)
		-- end
	end

	require("plugins.null-ls").setup(options)
end

return M
