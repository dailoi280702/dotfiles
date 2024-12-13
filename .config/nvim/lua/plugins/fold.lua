local M = {
	"kevinhwang91/nvim-ufo",
	-- event = { "BufReadPost", "BufNewFile", "BufWritePre" },
	dependencies = { "kevinhwang91/promise-async" },
	cmd = {
		"UfoEnable",
		"UfoDisable",
		"UfoInspect",
		"UfoAttach",
		"UfoDetach",
		"UfoEnableFold",
		"UfoDisableFold",
	},
	keys = function()
		local ufo = require("ufo")

		return {
			{ "z,", "<cmd>%foldclose<CR>", desc = "Close first level folds" },
			{ "z.", "<cmd>sil! normal mzzM`zzO<CR>", desc = "Magic fold  " },
			{ "zM", ufo.closeAllFolds },
			{ "zR", ufo.openAllFolds },
		}
	end,
}

M.config = function()
	local ufo = require("ufo")

	vim.o.foldcolumn = "0"
	vim.o.foldlevel = 99
	vim.o.foldlevelstart = 99
	vim.o.foldenable = true

	local ok, _ = pcall(require, "tree-sitter")
	if ok then
		ufo.setup({
			provider_selector = function(_, _, _)
				return { "treesitter", "indent" }
			end,
		})
	else
		ufo.setup()
	end
end

return M