local status, saga = pcall(require, "lspsaga")
if not status then
	return
end

require("lspsaga").init_lsp_saga({
	-- custom_kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
})

local config = {
	virtual_text = {
		-- prefix = "",
		-- prefix = "",
		prefix = "💩",
	},
}

vim.diagnostic.config(config)
