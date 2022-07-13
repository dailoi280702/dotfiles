-- check for lsp-installer
local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

local servers = {
	"tsserver",
	"pyright",
	"html",
	"ltex",
	"sumneko_lua",
	-- "grammarly",
}

local settings = {
	ensure_installed = servers,
	automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
	ui = {
		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗",
		},
	},
}

-- setup lsp_installer
lsp_installer.setup(settings)

-- check for lsp-config
local lsp_config_status_ok, nvim_lsp = pcall(require, "lspconfig")
if not lsp_config_status_ok then
	return
end

local opts = {}

--setup lsp servers
for _, server in ipairs(servers) do
	opts = {
		on_attach = require("lsp.handlers").on_attach,
		capabilities = require("lsp.handlers").capabilities,
	}

	if server == "sumneko_lua" then
		local sumneko_opts = require("lsp.settings.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end

	nvim_lsp[server].setup(opts)
end
