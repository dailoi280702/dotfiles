local M = {}

M.autoformat = true

function M.format()
    if M.autoformat then
        if vim.lsp.buf.format then
            vim.lsp.buf.format()
        else
            vim.lsp.buf.formatting_sync()
        end
    end
end

-- function M.async_formatting(bufnr)
-- 	bufnr = bufnr or vim.api.nvim_get_current_buf()
--
-- 	vim.lsp.buf_request(
-- 		bufnr,
-- 		"textDocument/formatting",
-- 		{ textDocument = { uri = vim.uri_from_bufnr(bufnr) } },
-- 		function(err, res, ctx)
-- 			if err then
-- 				local err_msg = type(err) == "string" and err or err.message
-- 				-- you can modify the log message / level (or ignore it completely)
-- 				vim.notify("formatting: " .. err_msg, vim.log.levels.WARN)
-- 				return
-- 			end
--
-- 			-- don't apply results if buffer is unloaded or has been modified
-- 			if not vim.api.nvim_buf_is_loaded(bufnr) or vim.api.nvim_buf_get_option(bufnr, "modified") then
-- 				return
-- 			end
--
-- 			if res then
-- 				local client = vim.lsp.get_client_by_id(ctx.client_id)
-- 				vim.lsp.util.apply_text_edits(res, bufnr, client and client.offset_encoding or "utf-16")
-- 				vim.api.nvim_buf_call(bufnr, function()
-- 					vim.cmd("silent noautocmd update")
-- 				end)
-- 			end
-- 		end
-- 	)
-- end

function M.setup(client, buf)
    local ft = vim.api.nvim_buf_get_option(buf, "filetype")
    local nls = require("plugins.null-ls")

    local enable = false
    if nls.has_formatter(ft) then
        enable = client.name == "null-ls"
    else
        enable = not (client.name == "null-ls")
    end

    if client.name == "tsserver" then
        enable = false
    end

    -- util.info(client.name .. " " .. (enable and "yes" or "no"), "format")

    client.server_capabilities.documentFormattingProvider = enable
    -- format on save
    if client.server_capabilities.documentFormattingProvider then
        vim.cmd([[
      augroup LspFormat
        autocmd! * <buffer>
        autocmd BufWritePre <buffer> lua require("plugins.lsp.formatting").format()
      augroup END
    ]]   )
    end
end

return M
