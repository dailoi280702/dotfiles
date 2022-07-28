local saga = require("lspsaga")

saga.setup({})

local config = {
	virtual_text = {
		prefix = "",
	},
}

vim.diagnostic.config(config)
