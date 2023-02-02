local M = {}

function M.format(bufnr)
	if vim.lsp.buf.format then
		vim.lsp.buf.format({ bufnr = bufnr })
	else
		vim.lsp.buf.formatting_sync()
	end
end

function M.setup(client, buf)
	local ft = vim.api.nvim_buf_get_option(buf, "filetype")
	local nls = require("plugins.null-ls")

	local enable = false
	if nls.has_formatter(ft) then
		enable = client.name == "null-ls"
	else
		enable = not (client.name == "null-ls")
	end

	client.server_capabilities.documentFormattingProvider = enable
	-- format on save
	if client.server_capabilities.documentFormattingProvider then
		vim.cmd([[
				augroup LspFormat
					autocmd! * <buffer>
					autocmd BufWritePre <buffer> lua require("plugins.lsp.formatting").format(buf)
				augroup END
			]])
	end
end

return M
