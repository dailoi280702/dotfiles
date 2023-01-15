local M = {
	"shaunsingh/oxocarbon.nvim",
	lazy = false,
	priority = 1000,
}

function M.config()
	require("oxocarbon")
end

return M
