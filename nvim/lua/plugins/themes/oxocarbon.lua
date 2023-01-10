local M = {
	"shaunsingh/oxocarbon.nvim",
	lazy = false,
	priority = 1000,
}

function M.config()
	require("oxocarbon")
	-- local trueBlack = "#000000"
	-- vim.api.nvim_set_hl(0, "Normal", { bg = trueBlack })
	-- vim.api.nvim_set_hl(0, "NormalNC", { bg = trueBlack })
	-- vim.api.nvim_set_hl(0, "SignColumn", { bg = trueBlack })
	-- vim.api.nvim_set_hl(0, "LineNr", { bg = trueBlack })
end

return M
