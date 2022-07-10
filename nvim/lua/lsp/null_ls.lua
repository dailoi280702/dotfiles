local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local formatting_sources = {
	formatting.stylua,
	formatting.prettier.with({
		extra_filetypes = { "toml", "solidity" },
		extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
	}),
	formatting.fixjson,
	diagnostics.selene,
	-- formatting.black,
	-- formatting.gofmt,
	-- formatting.shfmt,
	-- formatting.clang_format,
	-- formatting.cmake_format,
	-- formatting.dart_format,
	-- formatting.lua_format.with({
	--   extra_args = {
	--     '--no-keep-simple-function-one-line', '--no-break-after-operator', '--column-limit=100',
	--     '--break-after-table-lb', '--indent-width=2'
	--   }
	-- }),
	-- formatting.isort,
	-- formatting.codespell.with({ filetypes = { 'markdown' } })
}

-- null_ls.setup({
-- 	sources = formatting_sources,
-- 	on_attach = function(client)
-- 		if client.resolved_capabilities.document_formatting then
-- 			vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()")
-- 		end
-- 	end,
-- })

local async_formatting = function(bufnr)
	bufnr = bufnr or vim.api.nvim_get_current_buf()

	vim.lsp.buf_request(
		bufnr,
		"textDocument/formatting",
		{ textDocument = { uri = vim.uri_from_bufnr(bufnr) } },
		function(err, res, ctx)
			if err then
				local err_msg = type(err) == "string" and err or err.message
				-- you can modify the log message / level (or ignore it completely)
				vim.notify("formatting: " .. err_msg, vim.log.levels.WARN)
				return
			end

			-- don't apply results if buffer is unloaded or has been modified
			if not vim.api.nvim_buf_is_loaded(bufnr) or vim.api.nvim_buf_get_option(bufnr, "modified") then
				return
			end

			if res then
				local client = vim.lsp.get_client_by_id(ctx.client_id)
				vim.lsp.util.apply_text_edits(res, bufnr, client and client.offset_encoding or "utf-16")
				vim.api.nvim_buf_call(bufnr, function()
					vim.cmd("silent noautocmd update")
				end)
			end
		end
	)
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	-- add your sources / config options here
	sources = formatting_sources,
	debug = false,
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePost", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					async_formatting(bufnr)
				end,
			})
		end
	end,
})
