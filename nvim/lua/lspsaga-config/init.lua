local status, saga = pcall(require, "lspsaga")
if not status then
	return
end

saga.init_lsp_saga({})

local config = {
	virtual_text = {
		prefix = "",
	},
}

vim.diagnostic.config(config)
