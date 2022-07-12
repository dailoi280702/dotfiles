local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
	return
end

M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.update_capabilities(M.capabilities)

M.setup = function()
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
		width = 60,
		-- height = 30,
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
		width = 60,
		-- height = 30,
	})
end

local function lsp_highlight_document(client)
	-- if client.server_capabilities.document_highlight then
	local status_ok, illuminate = pcall(require, "illuminate")
	if not status_ok then
		return
	end
	illuminate.on_attach(client)
	-- end
end

M.on_attach = function(client)
	if client.name == "tsserver" then
		client.server_capabilities.documentFormattingProvider = false
	end

	if client.name == "html" then
		-- client.resolved_capabilities.document_formatting = false
		client.server_capabilities.documentFormattingProvider = false
	end

	if client.name == "sumneko_lua" then
		client.server_capabilities.documentFormattingProvider = false
	end

	-- vim.notify("sever running: " .. client.name)
	lsp_highlight_document(client)
end

-- function M.enable_format_on_save()
-- 	vim.cmd([[
--     augroup format_on_save
--       autocmd!
--       autocmd BufWritePre * lua vim.lsp.buf.format({ async = true })
--     augroup end
--   ]])
-- 	vim.notify("Enabled format on save")
-- end

-- function M.disable_format_on_save()
-- 	M.remove_augroup("format_on_save")
-- 	vim.notify("Disabled format on save")
-- end

-- function M.toggle_format_on_save()
-- 	if vim.fn.exists("#format_on_save#BufWritePre") == 0 then
-- 		M.enable_format_on_save()
-- 	else
-- 		M.disable_format_on_save()
-- 	end
-- end

-- function M.remove_augroup(name)
-- 	if vim.fn.exists("#" .. name) == 1 then
-- 		vim.cmd("au! " .. name)
-- 	end
-- end

-- vim.cmd([[ command! LspToggleAutoFormat execute 'lua require("user.lsp.handlers").toggle_format_on_save()' ]])

return M
