local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
	return
end

M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

-- M.setup = function()
-- 	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
-- 		border = "rounded",
-- 		width = 60,
-- 		-- height = 30,
-- 	})

-- 	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
-- 		border = "rounded",
-- 		width = 60,
-- 		-- height = 30,
-- 	})
-- end

M.on_attach = function(client)
	if client.name == "cssls" or client.name == "tsserver" or client.name == "html" or client.name == "sumneko_lua" then
		client.server_capabilities.documentFormattingProvider = false
	end
end

return M
